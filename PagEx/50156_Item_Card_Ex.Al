pageextension 50156 "Item_Card_Ex ERPG" extends "Item Card"
{
    layout
    {
        addafter("Qty. on Asm. Component")
        {
            field(DispExpo; DispExpo)
            {
                ApplicationArea = all;
                ToolTip = 'Disp_EXPO';
                Editable = false;  //190822

            }


        }

        addafter(InventoryGrp)
        {
            group(Expotape)
            {
                field(StkKrt; Rec.StkKrt)
                {
                    ApplicationArea = all;
                    ToolTip = 'Antal stk. der indgår i en karton';

                    //trigger OnValidate()
                    //begin
                    //    UpdateSalesHeadertEXPO();
                    //end;
                }
                field(Trykfarve1; Rec.Trykfarve1)
                {
                    ApplicationArea = all;
                    ToolTip = 'Trykfarve1';

                    trigger OnValidate()
                    begin
                        //UpdateSalesHeadertEXPO();
                    end;
                }
                field(Trykfarve2; Rec.Trykfarve2)
                {
                    ApplicationArea = all;
                    ToolTip = 'Trykfarve2';

                    trigger OnValidate()
                    begin
                        //UpdateSalesHeadertEXPO();
                    end;
                }
                field(Trykfarve3; Rec.Trykfarve3)
                {
                    ApplicationArea = all;
                    ToolTip = 'Trykfarve3';

                    trigger OnValidate()
                    begin
                        //UpdateSalesHeadertEXPO();
                    end;
                }
                field(Trykfarve4; Rec.Trykfarve4)
                {
                    ApplicationArea = all;
                    ToolTip = 'Trykfarve4';

                    trigger OnValidate()
                    begin
                        //UpdateSalesHeadertEXPO();
                    end;
                }
                field(KvalFarve; Rec.KvalFarve)
                {
                    ApplicationArea = all;
                    ToolTip = 'Kvalitet / Farve';

                    trigger OnValidate()
                    begin
                        //UpdateSalesHeadertEXPO();
                    end;
                }
                field(TrykLgd; Rec.TrykLgd)
                {
                    ApplicationArea = all;
                    ToolTip = 'Tryklængde';

                    trigger OnValidate()
                    begin
                        //UpdateSalesHeadertEXPO();
                    end;
                }
                field(KlicheNr; Rec.KlicheNr)
                {
                    ApplicationArea = all;
                    ToolTip = 'Kliche nummer';

                    trigger OnValidate()
                    begin
                        //UpdateSalesHeadertEXPO();
                    end;
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = all;
                    ToolTip = 'Type vare / Bemærkning';

                    trigger OnValidate()
                    begin
                        //UpdateSalesHeadertEXPO();
                    end;
                }
                field(Type_; Rec.Type_)
                {
                    ApplicationArea = all;
                    ToolTip = 'Type vare';

                    trigger OnValidate()
                    begin
                        //UpdateSalesHeadertEXPO();
                    end;
                }
                field(AfrulningsRetning; Rec.AfrulningsRetning)
                {
                    ApplicationArea = all;
                    ToolTip = 'Afrulningsretning';

                    trigger OnValidate()
                    begin
                        //UpdateSalesHeadertEXPO();
                    end;

                }

            }
        }
        // Add changes to page layout here
    }

    actions
    {

        addlast(Processing)
        {
            /*    action(xmltest)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        ous: OutStream;
                        x: XmlPort "_Inventable ERPG";
                        xml: XmlDocument;
                    begin

                        Xmlport.Run(50102, false, false);
                    end;
                }*/
        }
        addlast(Reporting)
        {
            action("ERP-TEST")
            {
                Caption = 'ERP-I-konti';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message('dette er ok');
                    //Codeunit.Run(50149);  //50149 "50149_Diverse_OP_ERPG"
                    Codeunit.Run(Codeunit::"50151_Diverse_OP_ERPG");
                end;
            }
        }

    }



    var
        DispExpo: Decimal;

    trigger OnAfterGetRecord()
    begin
        //DispExpo := Inventory - "Qty. on Sales Order" + "Qty. on Purch. Order" + "Qty. on Assembly Order" - "Qty. on Asm. Component";
        DispExpo := Inventory - "Qty. on Sales Order" - "Qty. on Asm. Component";
    end; //190822

    local procedure UpdateSalesHeadertEXPO()
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Item: Record Item;
        found: Boolean;

    begin
        if "Assembly BOM" = true then begin
            SalesHeader.Reset;
            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
            SalesHeader.SetRange(Status, SalesHeader.Status::Open);

            if SalesHeader.FindSet then begin
                message('01');
                repeat
                    found := false;
                    SalesLine.Reset;
                    SalesLine.SetCurrentKey("Document Type", "Document No.", "Line No.");
                    SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                    SalesLine.SetRange("Document No.", SalesHeader."No.");
                    SalesLine.SetRange(Type, SalesLine.Type::Item);
                    if SalesLine.FindSet then begin
                        Message('02');
                        repeat
                            Item.Reset;
                            Item.SetRange("No.", SalesLine."No.");
                            if Item.FindFirst then begin
                                Item.CalcFields("Assembly BOM");
                                Message('03');
                                //Message(SalesLine."Document No.");
                                //Message(Item."No.");
                                if Item."Assembly BOM" = true then begin
                                    Message('04');
                                    if found = false then begin
                                        found := true;
                                        Message('05');
                                        if SalesLine."No." = "No." then begin
                                            Message('06');
                                            if Dialog.Confirm('Ændre farve mv på salgsordre ' + SalesHeader."No." + ' Debitor: ' + SalesHeader."Sell-to Customer Name") then begin
                                                Salesheader.Trykfarve1 := Item.Trykfarve1;
                                                Salesheader.Trykfarve2 := Item.Trykfarve2;
                                                Salesheader.Trykfarve3 := Item.Trykfarve3;
                                                Salesheader.Trykfarve4 := Item.Trykfarve4;
                                                Salesheader.BrtWeight := Item."Gross Weight";
                                                Salesheader.KvalFarve := Item.KvalFarve;
                                                Salesheader.TrykLgd := Item.TrykLgd;
                                                Salesheader.KlicheNr := Item.KlicheNr;
                                                Salesheader.Remark := Item.Remark;
                                                Salesheader.Type_ := Item.Type_;
                                                Salesheader.AfrulningsRetning := Item.AfrulningsRetning;
                                                Salesheader.Volume := Item."Unit Volume";

                                                SalesHeader.Modify;
                                            end;
                                        end;  //Found
                                    end;
                                end;


                            end;
                        until SalesLine.Next = 0;

                    end;

                until SalesHeader.Next = 0;
            end;
        end;
    end;
}