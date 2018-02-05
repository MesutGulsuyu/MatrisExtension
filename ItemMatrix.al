page 50101 "Item Statistic By Period"
{
    PageType = List;
    SourceTable = Item;
    InsertAllowed = false;
    DeleteAllowed = false;
    LinksAllowed = false;
    RefreshOnActivate = true;
    

    layout
    {
        area(content)
        {
            repeater(Group)
            {

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
                PromotedCategory=Process;
                trigger OnAction();
                begin
                end;
            }
            action("Previous Cloumn")
            {
                Promoted = true;
                PromotedIsBig = true;
                Image = PreviousRecord;
                trigger OnAction();
                begin
                end;
            }
        }
    }

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
        procedure SetColumns(SerWanted:Option Initial,Previous,Same,Next,PreviousColumn,NextColumn);
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