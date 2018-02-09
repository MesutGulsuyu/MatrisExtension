page 50120 "Item Statistic By Period 2"
{
    PageType = List;
    SourceTable = Item;
    InsertAllowed = false;
    DeleteAllowed = false;
    LinksAllowed = false;
    RefreshOnActivate = true;
    
    
    layout
    {
        area(Content)
        {
            group(Group)
            {
                field("Show Type";ShowType)
                {
                    CaptionML =  ENU= 'Type';
                    trigger OnValidate();
                    begin
                        SetColumns(SetWanted::Initial);
                        Load();
                        //
                    end;
                }
                field(TransactionType;EntryType)
                {
                    trigger OnValidate();
                    var
                        myInt : Integer;
                    begin
                        SetColumns(SetWanted::Initial);
                        Load();
                    end;
                }
                field(LocationFilter;LocationFilter)
                {
                    TableRelation = Location;
                }
                field(PeriodType;PeriodType)
                {
                    OptionCaptionML= ENU= 'Day,Week,Month,Quarter,Year,Accounting Period' , ENG='Day,Week,Month,Quarter,Year,Accounting Period';
                    trigger OnValidate();
                    begin
                        SetColumns(SetWanted::Initial);
                        Load();
                    end;
                }
                field(InfoTxt;InfoTxt)
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = true;
                    RowSpan = 4;
                    ColumnSpan = 4;
                    ShowCaption = false;
                }

            }
            repeater(group2)
            {
                Editable = false;
                field("No.";"No.")
                {
                    
                }
                field(Description;Description)
                {
                    
                }
                field(Field1;Matrix_CELLDATA[1])
                {
                    BlankZero = true;
                    Editable = false;
                    CaptionClass = MATRIX_ColumnCaption[1];
                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(1);
                    end;
                }
                field(Field2;Matrix_CELLDATA[2])
                {
                    BlankZero = true;
                    Editable = false;
                    CaptionClass = MATRIX_ColumnCaption[2];
                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(2);
                    end;
                }
                field(Field3;Matrix_CELLDATA[3])
                {
                    BlankZero = true;
                    Editable = false;
                    CaptionClass = MATRIX_ColumnCaption[3];
                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(3);
                    end;
                }                
                field(Field4;Matrix_CELLDATA[4])
                {
                    BlankZero = true;
                    Editable = false;
                    CaptionClass = MATRIX_ColumnCaption[4];
                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(4);
                    end;
                }                
                field(Field5;Matrix_CELLDATA[5])
                {
                    BlankZero = true;
                    Editable = false;
                    CaptionClass = MATRIX_ColumnCaption[5];
                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(5);
                    end;
                }                
                field(Field6;Matrix_CELLDATA[6])
                {
                    BlankZero = true;
                    Editable = false;
                    CaptionClass = MATRIX_ColumnCaption[6];
                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(6);
                    end;
                }                
                field(Field7;Matrix_CELLDATA[7])
                {
                    BlankZero = true;
                    Editable = false;
                    CaptionClass = MATRIX_ColumnCaption[7];
                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(7);
                    end;
                }                
                field(Field8;Matrix_CELLDATA[8])
                {
                    BlankZero = true;
                    Editable = false;
                    CaptionClass = MATRIX_ColumnCaption[8];
                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(8);
                    end;
                }
                field(Field9;Matrix_CELLDATA[9])
                {
                    BlankZero = true;
                    Editable = false;
                    CaptionClass = MATRIX_ColumnCaption[9];
                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(9);
                    end;
                }      
                field(Field10;Matrix_CELLDATA[10])
                {
                    BlankZero = true;
                    Editable = false;
                    CaptionClass = MATRIX_ColumnCaption[10];
                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(10);
                    end;
                }                            
                field(Field11;Matrix_CELLDATA[11])
                {
                    BlankZero = true;
                    Editable = false;
                    CaptionClass = MATRIX_ColumnCaption[11];
                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(11);
                    end;
                } 
                field(Field12;Matrix_CELLDATA[12])
                {
                    BlankZero = true;
                    Editable = false;
                    CaptionClass = MATRIX_ColumnCaption[12];
                    trigger OnDrillDown();
                    begin
                        MATRIX_OnDrillDown(12);
                    end;
                }                                             
            }
        }
        area(factboxes)
        {
        }
    }


    actions
    {
        area(Processing)
        {
            action("Previous Set")
            {
                Promoted=true;
                PromotedIsBig=true;
                Image=PreviousSet;
                PromotedCategory = Process;
                trigger OnAction();
                begin
                    SetColumns(SetWanted::Previous);
                end;
            }
            action("Previous Cloumn")
            {
                Promoted = true;
                PromotedIsBig = true;
                Image = PreviousRecord;
                PromotedCategory = Process;
                trigger OnAction();
                begin
                    SetColumns(SetWanted::PreviousColumn);
                end;
            }
            action("Next Cloumn")
            {
                Promoted = true;
                PromotedIsBig = true;
                Image = NextRecord;
                PromotedCategory = Process;
                trigger OnAction();
                begin
                    SetColumns(SetWanted::NextColumn);
                end;
            }
            action("Next Set")
            {
                Promoted = true;
                PromotedIsBig = true;
                Image = NextSet;
                PromotedCategory = Process;
                trigger OnAction();
                begin
                    SetColumns(SetWanted::Next);
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
    end;



    var Matrix_CELLDATA :array[12] of decimal;
    var MatrixRecords : array[32] of Record Date;
    var MATRIX_NoOfMatrixColumns : Integer;
    var MATRIX_ColumnCaption : array[12] of text[1024];
    var ShowType : Option Quantity,Sales;
    var PKFirstRecInCurrSet : Text;
    var MatrixColumnCaptions : array[12] of text;
    var CurrSetLength: Integer;
    var ColumnSet :Text;
    var SetWanted : Option Initial,Previous,Same,Next,PreviousColumn,NextColumn;
    Var EntryType : Option Sales,Purchase;
    var PeriodType : Option Day,Week,Month,Quarter,Year,"Accounting Period";
    var Text001 :TextConst ENU='Need to refresh after setting new parameters';
    var InfoTxt : Text[250];
    var LocationFilter : code[10];

    
    procedure MATRIX_AfterGetRecord(ColumnID : Integer)
        var 
            ItemLedgEntries : Record "Item Ledger Entry";
        begin  
            case ShowType of 
                ShowType::Quantity:
                    begin
                        ItemLedgEntries.SetCurrentKey("Item No.");
                        ItemLedgEntries.SetRange("Item No.","No.");
                        ItemLedgEntries.SetFilter("Invoiced Quantity",'<>0');
                        ItemLedgEntries.SETFILTER("Location Code",LocationFilter);
                        CASE EntryType OF
                            EntryType::Sales :
                            ItemLedgEntries.SETRANGE("Entry Type",ItemLedgEntries."Entry Type"::Sale);
                            EntryType::Purchase :
                            ItemLedgEntries.SETRANGE("Entry Type",ItemLedgEntries."Entry Type"::Purchase);
                        END;
                        ItemLedgEntries.SETRANGE("Posting Date",MatrixRecords[ColumnID]."Period Start",MatrixRecords[ColumnID]."Period End");
                        ItemLedgEntries.CALCSUMS(Quantity);
                        MATRIX_CellData[ColumnID] := ItemLedgEntries.Quantity;
                    end;
                ShowType::Sales:  
                    begin
                       ItemLedgEntries.SetCurrentKey("Item No.");
                       ItemLedgEntries.SetRange("Item No.","No.");
                       ItemLedgEntries.SetFilter("Invoiced Quantity",'<>0');
                       ItemLedgEntries.SetFilter("Location Code",LocationFilter);
                       case EntryType of  
                            EntryType::Sales:
                                begin
                                    ItemLedgEntries.SetRange("Entry Type",ItemLedgEntries."Entry Type"::sale);
                                    ItemLedgEntries.SetAutoCalcFields("Purchase Amount (Actual)");
                                end;
                            EntryType::Purchase:    
                                begin
                                    ItemLedgEntries.SetRange("Entry Type",ItemLedgEntries."Entry Type"::Purchase);
                                    ItemLedgEntries.SetAutoCalcFields("Purchase Amount (Actual)");
                                end;
                        end;
                        ItemLedgEntries.SetRange("Posting Date",MatrixRecords[ColumnID]."Period Start",MatrixRecords[ColumnID]."Period End");
                        If ItemLedgEntries.FindSet then
                            repeat
                                If EntryType = EntryType::Sales then
                                    Matrix_CELLDATA[ColumnID] := Matrix_CELLDATA[ColumnID] + ItemLedgEntries."Sales Amount (Actual)"
                                else
                                    Matrix_CELLDATA[ColumnID] := Matrix_CELLDATA[ColumnID] + ItemLedgEntries."Purchase Amount (Actual)";
                            until ItemLedgEntries.Next = 0;
                    end;
                end;                                                                   
        END; 


    procedure MATRIX_OnDrillDown(ColumnID : Integer)
        var 
            ItemLedgEntries : Record "Item Ledger Entry";
        begin  
            ItemLedgEntries.SetCurrentKey("Item No.");
            ItemLedgEntries.SetRange("Item No.","No.");
            ItemLedgEntries.SetFilter("Invoiced Quantity",'<>0');
            ItemLedgEntries.SetFilter("Location Code",LocationFilter);
            case EntryType of 
                EntryType ::Sales : 
                    ItemLedgEntries.SetRange("Entry Type",ItemLedgEntries."Entry Type"::Sale);
                EntryType::Purchase:                                                        
                    ItemLedgEntries.SetRange("Entry Type",ItemLedgEntries."Entry Type"::Purchase);
            end;
            ItemLedgEntries.SetRange("Posting Date",MatrixRecords[ColumnID]."Period Start",MatrixRecords[ColumnID]."Period End");
            Page.Run(Page::"Item Ledger Entries",ItemLedgEntries);        
        END; 
        procedure SetColumns(SetWanted:Option Initial,Previous,Same,Next,PreviousColumn,NextColumn);
            var
                MatrixMgt : Codeunit "Matrix Management";
            begin
                MatrixMgt.GeneratePeriodMatrixData(SetWanted,12,false,PeriodType,'',PKFirstRecInCurrSet,MatrixColumnCaptions,ColumnSet,CurrSetLength,MatrixRecords);
            end;
        procedure Load();
        var
            i : Integer;
        begin
            CopyArray(MATRIX_ColumnCaption,MatrixColumnCaptions,1);
            MATRIX_NoOfMatrixColumns := ArrayLen(MATRIX_ColumnCaption);
        end;

}