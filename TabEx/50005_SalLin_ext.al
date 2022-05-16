tableextension 50005 SalLin_ext extends "Sales Line"

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