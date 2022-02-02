page 50003 "ITB_Item_Copy"
{
    Caption = 'Vare opret / kopi';
    PageType = Card;    //StandardDialog;
    SourceTable = Item;
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
                Caption = 'VareNummer';
                Editable = false;

            }
            field(Description; Description)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'VareNavn';
                Editable = false;

            }
            field(ItemNo; ItemNo)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Nyt VareNummer';

            }


        }


    }
    actions
    {


        area(Processing)
        {



            action("Opret kopi af Vare")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Kopi af Vare';
                Ellipsis = true;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Opret ny vare som kopi af den aktuelle';
                //Visible = NOT IsOfficeHost;


                trigger OnAction()
                var
                    "Sales Line": Record "Sales Line";
                    "Sales & Receivables Setup": Record "Sales & Receivables Setup";
                    srs: Record "Sales & Receivables Setup";
                    ItemNew: Record Item;
                    country: Record "Country/Region";  //110121
                    ans: Boolean;
                    //310122 - Kopi af diverse relaterede oplysninger
                    ItemOldPurchase: Record "Purchase Price";
                    ItemNewPurchase: Record "Purchase Price";
                    ItemOldSales: Record "Sales Price";
                    ItemNewSales: Record "Sales Price";
                    ItemOldPurLineD: Record "Purchase Line Discount";
                    ItemNewPurLineD: Record "Purchase Line Discount";
                    ItemOldSalLineD: Record "Sales Line Discount";
                    ItemNewSalLineD: Record "Sales Line Discount";
                    ItemOldBOM: Record "BOM Component";
                    ItemNewBOM: Record "BOM Component";
                    ItemOldUnit: Record "Item Unit of Measure";
                    ItemNewUnit: Record "Item Unit of Measure";

                //stykliste,enheder, kundevarer

                begin
                    ItemNew.Reset;
                    if (ItemNew.get(ItemNo)) or (ItemNo = '') then begin
                        Message('Varenummer eksisterer eller er blank - Oprettes IKKE !');
                        //Message('før');
                        exit;
                        //Message('efter');
                    end
                    else begin
                        Clear(ItemNew);
                        ItemNew.Reset;
                        ItemNew.Init;
                        ItemNew := Rec;
                        ItemNew."No." := ItemNo;
                        ItemNew.Insert;

                        //310122 - Så kommer diverse relaterede oplysninger
                        ItemOldBOM.Reset;
                        ItemOldBOM.SetRange("Parent Item No.", Rec."No.");
                        //VendOldB.SetRange("Source Type", 23);  //23 lig leverandør
                        if ItemOldBOM.FindSet then
                            repeat
                                ItemNewBOM.Reset;
                                ItemNewBOM.Init;
                                ItemNewBOM := ItemOldBOM;
                                ItemNewBOM."Parent Item No." := ItemNew."No.";
                                ItemNewBOM.Insert;
                            until ItemOldBOM.Next = 0;

                        ItemOldSales.Reset;
                        ItemOldSales.SetRange("Item No.", Rec."No.");
                        if ItemOldSales.FindSet then
                            repeat
                                ItemNewSales.Reset;
                                ItemNewSales.Init;
                                ItemNewSales := ItemOldSales;
                                ItemNewSales."Item No." := ItemNew."No.";
                                ItemNewSales.Insert;
                            until ItemOldSales.Next = 0;

                        ItemOldPurchase.Reset;
                        ItemOldPurchase.SetRange("Item No.", Rec."No.");
                        if ItemOldPurchase.FindSet then
                            repeat
                                ItemNewPurchase.Reset;
                                ItemNewPurchase.Init;
                                ItemNewPurchase := ItemOldPurchase;
                                ItemNewPurchase."Item No." := ItemNew."No.";
                                ItemNewPurchase.Insert;
                            until ItemOldPurchase.Next = 0;

                        ItemOldSalLineD.Reset;
                        ItemOldSalLineD.SetRange(Code, Rec."No.");
                        if ItemOldSalLineD.FindSet then
                            repeat
                                ItemNewSalLineD.Reset;
                                ItemNewSalLineD.Init;
                                ItemNewSalLineD := ItemOldSalLineD;
                                ItemNewSalLineD.Code := ItemNew."No.";
                                ItemNewSalLineD.Insert;
                            until ItemOldSalLineD.Next = 0;

                        ItemOldPurLineD.Reset;
                        ItemOldPurLineD.SetRange("Item No.", Rec."No.");
                        if ItemOldPurLineD.FindSet then
                            repeat
                                ItemNewPurLineD.Reset;
                                ItemNewPurLineD.Init;
                                ItemNewPurLineD := ItemOldPurLineD;
                                ItemNewPurLineD."Item No." := ItemNew."No.";
                                ItemNewPurLineD.Insert;
                            until ItemOldPurLineD.Next = 0;


                        ItemOldUnit.Reset;
                        ItemOldUnit.SetRange("Item No.", Rec."No.");
                        if ItemOldUnit.FindSet then
                            repeat
                                ItemNewUnit.Reset;
                                ItemNewUnit.Init;
                                ItemNewUnit := ItemOldUnit;
                                ItemNewUnit."Item No." := ItemNew."No.";
                                ItemNewUnit.Insert;
                            until ItemOldUnit.Next = 0;

                        //310122 <-

                        Message('Varenummer er oprettet !');
                        ItemNo := '';
                    end;


                end;

            }



        }

    }

    Var
        ItemNo: Code[20];


}

