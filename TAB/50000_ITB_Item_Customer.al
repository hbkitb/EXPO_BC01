table 50000 "ITB_Item_Customer"
{
    Caption = 'Debitor varer';
    //LookupPageID = "Item Vendor Catalog";

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Varenr';
            NotBlank = true;
            TableRelation = Item;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Debitornr';
            NotBlank = true;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                //Cust.Get("Customer No.");//
                //"Lead Time Calculation" := Vend."Lead Time Calculation";
            end;
        }

        field(3; "Customer Item No."; Text[50])
        {
            Caption = 'Kundevare';

            trigger OnValidate()
            begin
                //UpdateItemCrossReference();
            end;
        }

    }

    keys
    {
        key(Key1; "customer No.", "Item No.")
        {
            Clustered = true;
        }
        key(Key2; "Item No.", "Customer No.")
        {
        }
        key(Key3; "Customer No.", "Customer Item No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Customer No.", "Item No.")
        {
        }
    }

    trigger OnDelete()
    begin

    end;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnRename()
    begin

    end;

    var
        Cust: Record Customer;

}

