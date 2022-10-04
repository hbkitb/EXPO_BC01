pageextension 50011 ItemTurnOverLines_Ext extends "Item Turnover Lines"
{
    layout
    {
        addafter(SalesLCY)
        {
            field(MontQty; MontQty)
            {
                ApplicationArea = all;
                ToolTip = 'Montageforbrug antal';
                Caption = 'StykForb.';

                trigger OnValidate()
                begin
                    //UpdateSalesHeadertEXPO();
                end;

            }
        }

    }

    actions
    {




    }

    trigger OnAfterGetRecord()
    var
        ItemEntry: Record "Item Ledger Entry";
        FromDate: Date;
        ToDate: Date;

    begin
        //Message(Item."No.");
        //exit;

        //Message('getcur');

        FromDate := "Period Start";
        ToDate := "Period End";

        MontQty := 0;
        Clear(ItemEntry);
        ItemEntry.SetRange("Item No.", Item."No.");
        ItemEntry.SetFilter("Posting Date", '%1..%2', FromDate, ToDate);
        ItemEntry.SetRange("Entry Type", ItemEntry."Entry Type"::"Assembly Consumption");
        if ItemEntry.FindSet then
            repeat
                MontQty := MontQty + -ItemEntry."Invoiced Quantity";
            until ItemEntry.Next = 0;

        //CurrPage.Update;
    end;


    var
        MontQty: Decimal;

}