pageextension 50002 CustList_Ext extends "Customer List"
{
    layout
    {



    }

    actions
    {

        addlast(navigation)
        {
            group("Pakkeliste")
            {


                action("Aktive ordrer")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Aktive ordrer';
                    Image = Sales;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Sales Order List";
                    RunPageLink = "Sell-to Customer No." = FIELD("No.");
                    ToolTip = 'Se aktive salgsordrer på debitor';
                }

                action("Pakkelister")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Pakkelister';
                    Image = Sales;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Posted Sales Shipments";
                    RunPageLink = "Sell-to Customer No." = FIELD("No.");
                    ToolTip = 'Oversigt over tidligere pakkelister';
                }


                /*    action(xmltest)
                    {
                        ApplicationArea = All;

                        trigger OnAction()
                        var
                            ous: OutStream;
                            x: XmlPort "_Inventable ERPG";
                            xml: XmlDocument;
                        begin

                            Xmlport.Run(50102, false, false);//
                        end;
                    }*/
            }

            action("Kopi Debitor")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Kopi af Kunde';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Opret ny kunde som kopi af den aktuelle';
                //Visible = NOT IsOfficeHost;

                trigger OnAction()
                begin
                    Page.Run(Page::ITB_Cust_Copy, Rec);
                end;
            }
        }


    }
    /*
        trigger OnAfterGetCurrRecord()
        var

        begin
            Message('getcur');
            Message(format("Line No."));
            CurrPage.Update(true);
        end;
        */

    var

}