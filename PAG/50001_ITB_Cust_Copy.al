/// <summary>
/// Page ITB_Cust_Copy (ID 50001).
/// </summary>
page 50001 "ITB_Cust_Copy"
{
    Caption = 'Debitor opret / kopi';
    PageType = Card;    //StandardDialog;
    SourceTable = Customer;
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
                Caption = 'KundeNummer';
                Editable = false;

            }
            field(Name; Name)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'KundeNavn';
                Editable = false;

            }
            field(CustNo; CustNo)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Nyt KundeNr';

            }


        }


    }
    actions
    {


        area(Processing)
        {



            action("Opret kopi af kunde")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Kopi af Kunde';
                Ellipsis = true;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Opret ny kunde som kopi af den aktuelle';
                //Visible = NOT IsOfficeHost;


                trigger OnAction()
                var
                    "Sales Line": Record "Sales Line";
                    "Sales & Receivables Setup": Record "Sales & Receivables Setup";
                    srs: Record "Sales & Receivables Setup";
                    CustNew: Record Customer;
                    country: Record "Country/Region";  //110121
                    ans: Boolean;
                    //310122 - Kopi af diverse relaterede oplysninger
                    CustOldRep: Record "Custom Report Selection";
                    CustNewRep: Record "Custom Report Selection";
                    CustOldSales: Record "Sales Price";
                    CustNewSales: Record "Sales Price";
                    CustOldLineD: Record "Sales Line Discount";
                    CustNewLineD: Record "Sales Line Discount";
                    CustOldInvD: Record "Cust. Invoice Disc.";
                    CustNewInvD: Record "Cust. Invoice Disc.";


                begin
                    CustNew.Reset;
                    if (CustNew.get(CustNo)) or (CustNo = '') then begin
                        Message('Debitornummer eksisterer eller er blank - Oprettes IKKE !');
                        //Message('før');
                        exit;
                        //Message('efter');
                    end
                    else begin
                        Clear(CustNew);
                        CustNew.Reset;
                        CustNew.Init;
                        CustNew := Rec;
                        CustNew."No." := CustNo;
                        CustNew.Insert;

                        //310122 - Så kommer diverse relaterede oplysninger
                        CustOldRep.Reset;
                        CustOldRep.SetRange("Source No.", Rec."No.");
                        CustOldRep.SetRange("Source Type", 18);  //18 lig customer
                        if CustOldRep.FindSet then
                            repeat
                                CustNewRep.Reset;
                                CustNewRep.Init;
                                CustNewRep := CustOldRep;
                                CustNewRep."Source No." := CustNew."No.";
                                CustNewRep.Insert;
                            until CustOldRep.Next = 0;

                        CustOldSales.Reset;
                        CustOldSales.SetRange("Sales Code", Rec."No.");
                        if CustOldSales.FindSet then
                            repeat
                                CustNewSales.Reset;
                                CustNewSales.Init;
                                CustNewSales := CustOldSales;
                                CustNewSales."Sales Code" := CustNew."No.";
                                CustNewSales.Insert;
                            until CustOldSales.Next = 0;

                        CustOldLineD.Reset;
                        CustOldLineD.SetRange("Sales Code", Rec."No.");
                        if CustOldLineD.FindSet then
                            repeat
                                CustNewLineD.Reset;
                                CustNewLineD.Init;
                                CustNewLineD := CustOldLineD;
                                CustNewLineD."Sales Code" := CustNew."No.";
                                CustNewLineD.Insert;
                            until CustOldLineD.Next = 0;

                        CustOldInvD.Reset;
                        CustOldInvD.SetRange(Code, Rec."No.");
                        if CustOldInvD.FindSet then
                            repeat
                                CustNewInvD.Reset;
                                CustNewInvD.Init;
                                CustNewInvD := CustOldInvD;
                                CustNewInvD.Code := CustNew."No.";
                                CustNewInvD.Insert;
                            until CustOldInvD.Next = 0;

                        //310122 <-

                        //Message('Kunde er oprettet !');
                        if Dialog.Confirm('Kunde er oprettet ! Ønsker du at hoppe til den nye kunde: ' + CustNew."No." + ' ?') then begin
                            Page.Run(Page::"Customer Card", CustNew);
                        end;
                        CustNo := '';
                        CurrPage.Close;
                    end;


                end;

            }



        }

    }

    Var
        CustNo: Code[20];


}

