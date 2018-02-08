pageextension 50107 ItemMatrixExtension extends "Item List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addfirst(Processing)
        {
            action(MatrixExt)
            {
                Promoted = true;
                PromotedIsBig = true;
                Image = ShowMatrix;
                RunObject = Page "Item Statistic By Period";
                trigger OnAction();
                begin
                end;
            }
        }
    }
    
    var
        myInt : Integer;
}