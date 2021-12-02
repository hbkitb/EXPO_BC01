tableextension 50000 ITB_Item extends Item

{
    fields
    {
        field(50000; StkKrt; Decimal)
        {
            Caption = 'StkKrt';

        }
        field(50001; Trykfarve1; Text[20])
        {
            Caption = 'Trykfarve1';

        }
        field(50002; Trykfarve2; Text[20])
        {
            Caption = 'Trykfarve2';

        }
        field(50003; Trykfarve3; Text[20])
        {
            Caption = 'Trykfarve3';

        }
        field(50004; Trykfarve4; Text[20])
        {
            Caption = 'Trykfarve4';

        }

        field(50005; KvalFarve; Text[20])
        {
            Caption = 'Kvalfarve';

        }
        field(50006; TrykLgd; Integer)
        {
            Caption = 'Tryklængde';

        }
        field(50007; KlicheNr; Text[20])
        {
            Caption = 'KlicheNr';

        }
        field(50008; Remark; Text[20])
        {
            Caption = 'Bemærkning';

        }
        field(50009; Type_; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Tryktape,Standard tape,Dispenser';
            OptionMembers = " ","Tryktape","Standard tape","Dispenser";
        }
        field(50010; AfrulningsRetning; Option)
        {
            Caption = 'AfrulningsRetning';
            OptionCaption = ' ,A:NORMAL,B:NORMAL,C:LINKS,D:LINKS';
            OptionMembers = " ","A:NORMAL","B:NORMAL","C:LINKS","D:LINKS";

        }
    }

}