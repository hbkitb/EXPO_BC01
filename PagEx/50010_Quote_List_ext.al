pageextension 50010 QuoteList_Ext extends "Sales Quotes"
{
    layout
    {
        addafter(Amount)
        {
            field(ItemNo_Expo; ItemNo_Expo)
            {
                ApplicationArea = all;
            }
            field(ItemDesc_Expo; ItemDesc_Expo)
            {
                ApplicationArea = all;
            }

        }


    }

    actions
    {

    }

    //*
    trigger OnOpenPage()
    var

    begin
        //Rec.SetCurrentKey("No.", "Document Type");
        //Rec.Ascending(false);
        //Rec.FindFirst();
    end;
    //*/

    var




}


