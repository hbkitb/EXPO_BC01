pageextension 50003 SalesSubForm_ext extends "Sales Order Subform"
{
    layout
    {

        addafter("No.")
        {

            field(PalleNr; PalleNr)
            {
                ApplicationArea = all;
                ToolTip = 'PalleNr';
                //Editable = false;
            }




        }
        // Add changes to page layout here
    }

    actions
    {

        /*
        addlast(processing)
        {
            action("OrdBek/OrdPak/OrdFlg")
            {
               
            }

            action("OrdBek/OrdPak")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'OrdBek/OrdPak';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category11;
                ToolTip = 'Udskriver bekræftelse/pakkeliste';
                //Visible = NOT IsOfficeHost;

                trigger OnAction()
                begin
                    DocPrint.PrintSalesOrder(Rec, Usage::"Order Confirmation");
                    DocPrint.PrintSalesOrder(Rec, Usage::"Pick Instruction");

                end;
            }

            
        }
        */

    }



    trigger OnAfterGetRecord()
    var
    begin
        //CurrPage.Update(true);

    end;



    var
    //docPrint: Codeunit "Document-Print";
    //Usage: Option "Order Confirmation","Work Order","Pick Instruction";

}