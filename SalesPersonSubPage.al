page 50122 "Sales by Salesperson Ma. SubP."
{
    PageType = ListPart;
    SourceTable = "Salesperson/Purchaser";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code;Code)
                {
                    
                }
                field(Name;Name)
                {
                    
                }
                field(Matrix_Caption1;Matrix_CellData[1])
                {
                    CaptionClass = '3,'+ Matrix_Caption[1];
                    DrillDown = true;
                    Visible = Field1Visible;
                    trigger OnValidate();
                    begin
                        Matrix_DrillDown(1);
                    end;
                }
                 field(Matrix_Caption2;Matrix_CellData[2])
                {
                    CaptionClass = '3,'+ Matrix_Caption[2];
                    DrillDown = true;
                    Visible = Field2Visible;
                    trigger OnValidate();
                    begin
                        Matrix_DrillDown(2);
                    end;
                }
                 field(Matrix_Caption3;Matrix_CellData[3])
                {
                    CaptionClass = '3,'+  Matrix_Caption[3];
                    DrillDown = true;
                    Visible = Field3Visible;
                    trigger OnValidate();
                    begin
                        Matrix_DrillDown(3);
                    end;
                }
                 field(Matrix_Caption4;Matrix_CellData[4])
                {
                    CaptionClass = '3,'+ Matrix_Caption[4];
                    DrillDown = true;
                    Visible = Field4Visible;
                    trigger OnValidate();
                    begin
                        Matrix_DrillDown(4);
                    end;
                }
                 field(Matrix_Caption5;Matrix_CellData[5])
                {
                    CaptionClass = '3,'+ Matrix_Caption[5];
                    DrillDown = true;
                    Visible = Field5Visible;
                    trigger OnValidate();
                    begin
                        Matrix_DrillDown(5);
                    end;
                }   
                 field(Matrix_Caption6;Matrix_CellData[6])
                {
                    CaptionClass = '3,'+ Matrix_Caption[6];
                    DrillDown = true;
                    Visible = Field6Visible;
                    trigger OnValidate();
                    begin
                        Matrix_DrillDown(6);
                    end;
                }                         
                 field(Matrix_Caption7;Matrix_CellData[7])
                {
                    CaptionClass = '3,'+ Matrix_Caption[7];
                    DrillDown = true;
                    Visible = Field7Visible;
                    trigger OnValidate();
                    begin
                        Matrix_DrillDown(7);
                    end;
                }  
                 field(Matrix_Caption8;Matrix_CellData[8])
                {
                    CaptionClass = '3,'+ Matrix_Caption[8];
                    DrillDown = true;
                    Visible = Field8Visible;
                    trigger OnValidate();
                    begin
                        Matrix_DrillDown(8);
                    end;
                }                   
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
    trigger OnOpenPage();
    begin
     Field1Visible := TRUE;
     Field2Visible := TRUE;
     Field3Visible := TRUE;
     Field4Visible := TRUE;
     Field5Visible := TRUE;
     Field6Visible := TRUE;
     Field7Visible := TRUE;
     Field8Visible := TRUE;
     Field9Visible := TRUE;
     Field10Visible := TRUE;
     Field11Visible := TRUE;
     Field12Visible := TRUE;
     Field13Visible := TRUE;
     Field14Visible := TRUE;
     Field15Visible := TRUE;
     Field16Visible := TRUE;
     Field17Visible := TRUE;
     Field18Visible := TRUE;
     Field19Visible := TRUE;
     Field20Visible := TRUE;
     Field21Visible := TRUE;
     Field22Visible := TRUE;
     Field23Visible := TRUE;
     Field24Visible := TRUE;
     Field25Visible := TRUE;
     Field26Visible := TRUE;
     Field27Visible := TRUE;
     Field28Visible := TRUE;
     Field29Visible := TRUE;
     Field30Visible := TRUE;
     Field31Visible := TRUE;
     Field32Visible := TRUE;   
    end;
    trigger OnAfterGetRecord();
    var
        i: Integer;
    begin
        For i := 1 to Matrix_CloumnCount do
            i := i + 1;
    end;
    var 
      Matrix_CellData : ARRAY [32] OF Decimal;
      Matrix_Caption : ARRAY [32] OF Text[1024];
      Field1Visible : Boolean;
      Field2Visible : Boolean;
      Field3Visible : Boolean;
      Field4Visible : Boolean;
      Field5Visible : Boolean;
      Field6Visible : Boolean;
      Field7Visible : Boolean;
      Field8Visible : Boolean;
      Field9Visible : Boolean;
      Field10Visible : Boolean;
      Field11Visible : Boolean;
      Field12Visible : Boolean;
      Field13Visible : Boolean;
      Field14Visible : Boolean;
      Field15Visible : Boolean;
      Field16Visible : Boolean;
      Field17Visible : Boolean;
      Field18Visible : Boolean;
      Field19Visible : Boolean;
      Field20Visible : Boolean;
      Field21Visible : Boolean;
      Field23Visible : Boolean;
      Field22Visible : Boolean;
      Field24Visible : Boolean;
      Field25Visible : Boolean;
      Field26Visible : Boolean;
      Field27Visible : Boolean;
      Field28Visible : Boolean;
      Field29Visible : Boolean;
      Field30Visible : Boolean;
      Field31Visible : Boolean;
      Field32Visible : Boolean;
      Matrix_Record : ARRAY [32] OF Record 2000000007;
      PageDateFilter : Text;
      Matrix_CloumnCount : Integer;

    procedure SetMatrixData(ColumnCaptions : array[32] of text; var MatrixRec : array[32] of record Date; DateFilter : Text; ColumnSetLength : Integer);
    var
        i : Integer;
    begin
        For i := 1 to ArrayLen(MatrixRec) do begin
            If ColumnCaptions[i] = '' then
                Matrix_Caption[i] := ''
            ELSE
                Matrix_Caption[i] := ColumnCaptions[i];
                Matrix_Record[i] := MatrixRec[i];
        end;
        PageDateFilter := DateFilter;
        Matrix_CloumnCount := ColumnSetLength;

        ShowHideColumn;
    end;

    procedure ShowHideColumn();

    begin
      Field1Visible := Matrix_CloumnCount >=1 ;
      Field2Visible := Matrix_CloumnCount >=2 ;
      Field3Visible := Matrix_CloumnCount >=3 ;
      Field4Visible := Matrix_CloumnCount >=4 ;
      Field5Visible := Matrix_CloumnCount >=5 ;
      Field6Visible := Matrix_CloumnCount >=6 ;
      Field7Visible := Matrix_CloumnCount >=7 ;
      Field8Visible := Matrix_CloumnCount >=8 ;
      Field9Visible := Matrix_CloumnCount >=9 ;
      Field10Visible := Matrix_CloumnCount >=10 ;
      Field11Visible := Matrix_CloumnCount >=11 ;
      Field12Visible := Matrix_CloumnCount >=12 ;
      Field13Visible := Matrix_CloumnCount >=13 ;
      Field14Visible := Matrix_CloumnCount >=14 ;
      Field15Visible := Matrix_CloumnCount >=15 ;
      Field16Visible := Matrix_CloumnCount >=16 ;
      Field17Visible := Matrix_CloumnCount >=17 ;
      Field18Visible := Matrix_CloumnCount >=18 ;
      Field19Visible := Matrix_CloumnCount >=19 ;
      Field20Visible := Matrix_CloumnCount >=20 ;
      Field21Visible := Matrix_CloumnCount >=21 ;
      Field22Visible := Matrix_CloumnCount >=22 ;
      Field23Visible := Matrix_CloumnCount >=23 ;
      Field24Visible := Matrix_CloumnCount >=24 ;
      Field25Visible := Matrix_CloumnCount >=25 ;
      Field26Visible := Matrix_CloumnCount >=26 ;
      Field27Visible := Matrix_CloumnCount >=27 ;
      Field28Visible := Matrix_CloumnCount >=28 ;
      Field29Visible := Matrix_CloumnCount >=29 ;
      Field30Visible := Matrix_CloumnCount >=30 ;
      Field31Visible := Matrix_CloumnCount >=31 ;
      Field32Visible := Matrix_CloumnCount >=32 ;         
    end;

    procedure Matrix_OnAfterGetrRecord(CurrColumnNo : Integer);
    var
        CustLedgerEntry : Record "Cust. Ledger Entry";
    begin
      CustLedgerEntry.SETCURRENTKEY("Salesperson Code","Posting Date");
      CustLedgerEntry.SETRANGE("Salesperson Code",Code);
      CustLedgerEntry.SETRANGE("Posting Date",Matrix_Record[CurrColumnNo]."Period Start",Matrix_Record[CurrColumnNo]."Period End");
      CustLedgerEntry.CALCSUMS("Sales (LCY)");
      Matrix_CellData[CurrColumnNo] := CustLedgerEntry."Sales (LCY)";       
    end;

    procedure Matrix_DrillDown(CurrColumnNo : Integer);
    var
        CustLedgerEntry : Record "Cust. Ledger Entry";
    begin
      CustLedgerEntry.SETCURRENTKEY("Salesperson Code","Posting Date");
      CustLedgerEntry.SETRANGE("Salesperson Code",Code);
      CustLedgerEntry.SETRANGE("Posting Date",Matrix_Record[CurrColumnNo]."Period Start",Matrix_Record[CurrColumnNo]."Period End");
      PAGE.RUN(0,CustLedgerEntry);
    end;
}