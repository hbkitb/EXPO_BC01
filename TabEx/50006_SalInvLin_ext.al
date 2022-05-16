tableextension 50006 SalInvLin_ext extends "Sales Invoice Line"

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