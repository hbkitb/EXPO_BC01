page 50002 "ITB_Vend_Copy"
{
    Caption = 'Kreditor opret / kopi';
    PageType = Card;    //StandardDialog;
    SourceTable = Vendor;
    //PromotedActionCategories = 'New,Process,Report,Prices & Discounts';
    PromotedActionCategories = 'Process,Processing';
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            field("No."; "No.")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'LeverandørNummer';
                Editable = false;

            }
            field(Name; Name)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'LeverandørNavn';
                Editable = false;

            }
            field(VendNo; VendNo)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Nyt LeverandørNr';

            }


        }


    }
    actions
    {


        area(Processing)
        {



            action("Opret kopi af Leverandør")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Kopi af Leverandør';
                Ellipsis = true;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Opret ny Leverandør som kopi af den aktuelle';
                //Visible = NOT IsOfficeHost;


                trigger OnAction()
                var
                    "Sales Line": Record "Sales Line";
                    "Sales & Receivables Setup": Record "Sales & Receivables Setup";
                    srs: Record "Sales & Receivables Setup";
                    VendNew: Record Vendor;
                    country: Record "Country/Region";  //110121
                    ans: Boolean;
                    //310122 - Kopi af diverse relaterede oplysninger
                    VendOldRep: Record "Custom Report Selection";
                    VendNewRep: Record "Custom Report Selection";
                    VendOldSales: Record "Purchase Price";
                    VendNewSales: Record "Purchase Price";
                    VendOldLineD: Record "Purchase Line Discount";
                    VendNewLineD: Record "Purchase Line Discount";
                    VendOldInvD: Record "Vendor Invoice Disc.";
                    VendNewInvD: Record "Vendor Invoice Disc.";


                begin
                    VendNew.Reset;
                    if (VendNew.get(VendNo)) or (VendNo = '') then begin
                        Message('Kreditornummer eksisterer eller er blank - Oprettes IKKE !');
                        Message('før');
                        exit;
                        Message('efter');
                    end
                    else begin
                        Clear(VendNew);
                        VendNew.Reset;
                        VendNew.Init;
                        VendNew := Rec;
                        VendNew."No." := VendNo;
                        VendNew.Insert;

                        //310122 - Så kommer diverse relaterede oplysninger
                        VendOldRep.Reset;
                        VendOldRep.SetRange("Source No.", Rec."No.");
                        VendOldRep.SetRange("Source Type", 23);  //23 lig leverandør
                        if VendOldRep.FindSet then
                            repeat
                                VendNewRep.Reset;
                                VendNewRep.Init;
                                VendNewRep := VendOldRep;
                                VendNewRep."Source No." := VendNew."No.";
                                VendNewRep.Insert;
                            until VendOldRep.Next = 0;

                        VendOldSales.Reset;
                        VendOldSales.SetRange("Vendor No.", Rec."No.");
                        if VendOldSales.FindSet then
                            repeat
                                VendNewSales.Reset;
                                VendNewSales.Init;
                                VendNewSales := VendOldSales;
                                VendNewSales."Vendor No." := VendNew."No.";
                                VendNewSales.Insert;
                            until VendOldSales.Next = 0;

                        VendOldLineD.Reset;
                        VendOldLineD.SetRange("Vendor No.", Rec."No.");
                        if VendOldLineD.FindSet then
                            repeat
                                VendNewLineD.Reset;
                                VendNewLineD.Init;
                                VendNewLineD := VendOldLineD;
                                VendNewLineD."Vendor No." := VendNew."No.";
                                VendNewLineD.Insert;
                            until VendOldLineD.Next = 0;

                        VendOldInvD.Reset;
                        VendOldInvD.SetRange(Code, Rec."No.");
                        if VendOldInvD.FindSet then
                            repeat
                                VendNewInvD.Reset;
                                VendNewInvD.Init;
                                VendNewInvD := VendOldInvD;
                                VendNewInvD.Code := VendNew."No.";
                                VendNewInvD.Insert;
                            until VendOldInvD.Next = 0;

                        //310122 <-

                        Message('Leverandør er oprettet !');
                        VendNo := '';
                    end;


                end;

            }



        }

    }

    Var
        VendNo: Code[20];


}

