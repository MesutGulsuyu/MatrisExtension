pageextension 50125 SalesPersonMatrixExtension extends "Salespersons/Purchasers"
{
    layout
    {
        // Add changes to page layout here
        //
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
                RunObject = Page  "Sales by Salesperson";
                trigger OnAction();
                begin
                end;
            }
        }
    }
    
    var
        myInt : Integer;
}