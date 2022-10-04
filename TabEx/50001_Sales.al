tableextension 50001 ITB_Sales extends "Sales Header"

{
    fields
    {

        field(50000; Trykfarve1; Text[20])
        {
            Caption = 'Trykfarve1';

        }
        field(50001; Trykfarve2; Text[20])
        {
            Caption = 'Trykfarve2';

        }
        field(50002; Trykfarve3; Text[20])
        {
            Caption = 'Trykfarve3';

        }
        field(50003; Trykfarve4; Text[20])
        {
            Caption = 'Trykfarve4';

        }
        field(50004; Korrektur; Boolean)
        {
            Caption = 'Korrektur';

        }
        field(50005; Tegning; Boolean)
        {
            Caption = 'Tegning';

        }
        field(50006; NormalOprul; Boolean)
        {
            Caption = 'NormalOprul';

        }
        field(50007; Genoptryk; Boolean)
        {
            Caption = 'Genoptryk';

        }
        field(50008; KvalFarve; Text[20])
        {
            Caption = 'Kvalfarve';

        }
        field(50009; NetWeight; Decimal)
        {
            Caption = 'Nettovægt';

        }
        field(50010; ManKart; Decimal)
        {
            Caption = 'ManuelKartoner';

        }
        field(50011; BrtWeight; Decimal)
        {
            Caption = 'Bruttovægt';

        }
        field(50012; Kartoner; Decimal)
        {
            Caption = 'Kartoner';

        }
        field(50013; Markeret; Boolean)
        {
            Caption = 'Markeret';

        }
        field(50014; DelWeek; Text[20])
        {
            Caption = 'LevUge';

        }
        field(50015; TrykLgd; Integer)
        {
            Caption = 'Tryklængde';

        }
        field(50016; KlicheNr; Text[20])
        {
            Caption = 'KlicheNr';

        }
        field(50017; Remark; Text[20])
        {
            Caption = 'Bemærkning';

        }
        field(50018; Type_; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Tryktape,Standard tape,Dispenser';
            OptionMembers = " ","Tryktape","Standard tape","Dispenser";
        }
        field(50019; AfrulningsRetning; Option)
        {
            Caption = 'AfrulningsRetning';
            OptionCaption = ' ,A:NORMAL,B:NORMAL,C:LINKS,D:LINKS';
            OptionMembers = " ","A:NORMAL","B:NORMAL","C:LINKS","D:LINKS";

        }
        field(50020; Volume; Decimal)
        {
            Caption = 'Rumfang';

        }
        field(50021; ItemNo_Expo; Code[20])
        {
            Caption = 'VareNr';
            Editable = false;

        }
        field(50022; ItemDesc_Expo; Text[100])
        {
            Caption = 'VareBesk';
            Editable = false;
        }



    }

    trigger OnAfterInsert()

    begin
        Rec."Shipment Date" := Today + 730;
        Rec."Ship-to Contact" := '';  //130622
        Rec.Modify;
    end;

}