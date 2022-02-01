pageextension 50004 VendList_Ext extends "Vendor List"
{
    layout
    {



    }

    actions
    {

        addlast(navigation)
        {


            action("Kopi Kreditor")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Kopi af Leverandør';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Opret ny leverandør som kopi af den aktuelle';
                //Visible = NOT IsOfficeHost;

                trigger OnAction()
                begin
                    Page.Run(Page::ITB_Vend_Copy, Rec);
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