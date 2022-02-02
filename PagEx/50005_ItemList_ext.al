pageextension 50005 ItemList_Ext extends "Item List"
{
    layout
    {



    }

    actions
    {

        addlast(navigation)
        {


            action("Kopi Vare")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Kopi af Vare';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Opret ny Vare som kopi af den aktuelle';
                //Visible = NOT IsOfficeHost;

                trigger OnAction()
                begin
                    Page.Run(Page::ITB_Item_Copy, Rec);
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