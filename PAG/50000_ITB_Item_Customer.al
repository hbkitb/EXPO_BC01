page 50000 "ITB_Item_Customer"
{
    Caption = 'Kundevare';
    DataCaptionFields = "Item No.";
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Prices & Discounts';
    SourceTable = ITB_Item_Customer;

    layout
    {
        area(content)
        {
            //repeater(Control1)
            //{
            //ShowCaption = false;
            field("Item No."; Rec."Item No.")
            {
                ApplicationArea = Planning;
                ToolTip = 'Specifies the number of the item that the alternate direct unit cost is valid for.';
                //Visible = false;
            }

            field("Customer No."; Rec."Customer No.")
            {
                ApplicationArea = Planning;
                ToolTip = 'Specifies the number of the vendor who offers the alternate direct unit cost.';
            }
            field("Customer Item No."; Rec."Customer Item No.")
            {
                ApplicationArea = Planning;
                ToolTip = 'Specifies the number that the vendor uses for this item.';
            }

            //}
        }
        area(factboxes)
        {

        }
    }

    actions
    {
        area(navigation)
        {
            group(Kundevare)
            {


            }
        }
    }

    trigger OnOpenPage()
    var

    begin

    end;

    var

}

