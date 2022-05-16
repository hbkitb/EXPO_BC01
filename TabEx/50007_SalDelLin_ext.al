tableextension 50007 SalDelLin_ext extends "Sales Shipment Line"

{
    fields
    {
        field(50000; PalleNr; Integer)
        {
            Caption = 'PalleNr';

        }
        field(50001; LineReference; Text[30])
        {
            Caption = 'Reference';

        }

    }

}