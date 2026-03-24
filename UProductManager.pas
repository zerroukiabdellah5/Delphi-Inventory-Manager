unit UProductManager;

interface

uses
  System.SysUtils, Data.Win.ADODB, Vcl.Dialogs;

type
  TProductController = class
  private
    FQuery: TADOQuery;
  public
    constructor Create(AQuery: TADOQuery);
    procedure AddProduct(Name: string; Price: Double; Stock: Integer);
    procedure DeleteProduct(ProductID: Integer);
  end;

implementation

constructor TProductController.Create(AQuery: TADOQuery);
begin
  FQuery := AQuery;
end;

procedure TProductController.AddProduct(Name: string; Price: Double; Stock: Integer);
begin
  FQuery.Close;
  FQuery.SQL.Text := 'INSERT INTO Products (product_name, selling_price, stock_quantity) ' +
                     'VALUES (:name, :price, :stock)';
  FQuery.Parameters.ParamByName('name').Value := Name;
  FQuery.Parameters.ParamByName('price').Value := Price;
  FQuery.Parameters.ParamByName('stock').Value := Stock;
  FQuery.ExecSQL;
  ShowMessage('Product Added Successfully!');
end;

procedure TProductController.DeleteProduct(ProductID: Integer);
begin
  FQuery.Close;
  FQuery.SQL.Text := 'DELETE FROM Products WHERE product_id = :id';
  FQuery.Parameters.ParamByName('id').Value := ProductID;
  FQuery.ExecSQL;
end;

end.
