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

            action(Kundelinier)
            {
                ApplicationArea = All;
                Caption = 'Kundelinier';
                Image = Inventory;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Value Entries";
                RunPageLink = "Item No." = FIELD("No."), "Item Ledger Entry Type" = filter(1);
                RunPageView = SORTING("Item Ledger Entry Type", "Posting Date", "Item No.", "Inventory Posting Group", "Dimension Set ID")
                              //ORDER(Ascending);
                              order(descending);
                ShortCutKey = 'Ctrl+F7';
                ToolTip = 'Vis alle Kunde/varelinier.';
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