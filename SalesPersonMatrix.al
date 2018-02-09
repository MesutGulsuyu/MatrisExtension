page 50124 "Sales by Salesperson"
{
    PageType = Card;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(ViewBy;ViewBy)
               {
                    CaptionML = ENU = 'Viewed By';
                    OptionCaptionML = ENU= 'Day,Week,Month,Quarter,Years';
                    trigger OnValidate();
                    begin
                        SetColumns(SetWanted::Initial);
                    end;
               }
               field(ColumnSet;ColumnSet)
               {
                   CaptionML = ENU = 'Column Set';
                   Editable = false;
               }
               field(DateFilter;DateFilter)
               {
                   CaptionML = ENU = 'Date Filter';
                   trigger OnValidate();
                   begin
                     ApplicationManagement.MakeDateFilter(DateFilter);
                     SetColumns(SetWanted::Initial);                       
                   end;
               }
            }
            part(MatrixSubPage;"Sales by Salesperson Ma. SubP.")
            {
                    
            }
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

    trigger OnOpenPage();
    begin
        SetColumns(SetWanted::Initial);
    end;
    
    var
      ColumnSet : Text[1024];
      ViewBy : Option Day,Week,Month,Quarter,Years;
      MatrixManagement : Codeunit "Matrix Management";
      SetWanted : Option Initial,Previous,Same,Next,PreviousColumn,NextColumn;
      Matrix_CloumCaption : ARRAY [32] OF Text;
      DateFilter : Text;
      PKFirstRecInSet : Text;
      ColumnSetLength : Integer;
      MatrixRecord : ARRAY [32] OF Record 2000000007;
      ApplicationManagement : Codeunit ApplicationManagement; 
      procedure SetColumns(SetWanted : Option Initial,Previous,Same,Next,PreviousColumn,NextColumn);
      var
          myInt : Integer;
      begin
        MatrixManagement.GeneratePeriodMatrixData(SetWanted,ARRAYLEN(Matrix_CloumCaption),FALSE,ViewBy,DateFilter,PKFirstRecInSet,
        Matrix_CloumCaption,ColumnSet,ColumnSetLength,MatrixRecord);

        CurrPage.MatrixSubPage.PAGE.SetMatrixData(Matrix_CloumCaption,MatrixRecord,DateFilter,ColumnSetLength);
        CurrPage.UPDATE(FALSE);  
      end;
}