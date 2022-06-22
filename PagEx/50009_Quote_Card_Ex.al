pageextension 50009 ITB_SalesQoute_Card extends "Sales Quote"
{
    layout
    {

        addafter(General)
        {
            group(Expotape)
            {

                field(Trykfarve1; Rec.Trykfarve1)
                {
                    ApplicationArea = all;
                    ToolTip = 'Trykfarve1';
                    Editable = false;
                }
                field(Trykfarve2; Rec.Trykfarve2)
                {
                    ApplicationArea = all;
                    ToolTip = 'Trykfarve2';
                    Editable = false;
                }

                field(Trykfarve3; Rec.Trykfarve3)
                {
                    ApplicationArea = all;
                    ToolTip = 'Trykfarve3';
                    Editable = false;
                }
                field(Trykfarve4; Rec.Trykfarve4)
                {
                    ApplicationArea = all;
                    ToolTip = 'Trykfarve4';
                    Editable = false;
                }
                field(Korrektur; Rec.Korrektur)
                {
                    ApplicationArea = all;
                    ToolTip = 'Korrektur';

                }
                field(Tegning; Rec.Tegning)
                {
                    ApplicationArea = all;
                    ToolTip = 'Tegning';
                }
                field(AfrulningsRetning; Rec.AfrulningsRetning)
                {
                    ApplicationArea = all;
                    ToolTip = 'Afrulning';
                    Editable = false;
                }
                field(Genoptryk; Rec.Genoptryk)
                {
                    ApplicationArea = all;
                    ToolTip = 'Genoptryk';
                }
                field(KvalFarve; Rec.KvalFarve)
                {
                    ApplicationArea = all;
                    ToolTip = 'Kvalitet / Farve';
                    Editable = false;
                }
                field(NetWeight; Rec.NetWeight)
                {
                    ApplicationArea = all;
                    ToolTip = 'Nettovægt';
                    Editable = false;
                }
                field(ManKart; Rec.ManKart)
                {
                    ApplicationArea = all;
                    ToolTip = 'Her indtastes det rettede antal kartoner ved sampakning af rester';
                }
                field(BrtWeight; Rec.BrtWeight)
                {
                    ApplicationArea = all;
                    ToolTip = 'Bruttovægt';
                    Editable = false;
                }
                field(Kartoner; Rec.Kartoner)
                {
                    ApplicationArea = all;
                    ToolTip = 'Systemoptalte antal kartoner';
                    Editable = false;
                }

                field(Markeret; Rec.Markeret)
                {
                    ApplicationArea = all;
                    ToolTip = 'Markeret';
                    Editable = false;
                }
                field(DelWeek; Rec.DelWeek)
                {
                    ApplicationArea = all;
                    ToolTip = 'Leveringsuge';
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

                        Xmlport.Run(50102, false, false);//
                    end;
                }*/
        }
        addlast(Reporting)
        {



            /*
            action("ERP-TEST")
            {
                //Caption = 'ERP-I-konti';
                //ApplicationArea = All;

                trigger OnAction()
                begin
                    //Message('dette er ok');
                    //Codeunit.Run(50149);  //50149 "50149_Diverse_OP_ERPG"
                    //Codeunit.Run(Codeunit::"50151_Diverse_OP_ERPG");
                end;
            }
            */
        }

    }



    trigger OnAfterGetRecord()
    var
    begin
        //CurrPage.Update(true);

    end;



    var
    // docPrint: Codeunit "Document-Print";
    // Usage: Option "Order Confirmation","Work Order","Pick Instruction";

}