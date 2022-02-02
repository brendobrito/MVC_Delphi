unit Delivery.Model.Pedidos;

interface

uses
  Delivery.Model.Interfaces, Data.DB, Delivery.Model.Connection.Interfaces;
type
  TModelPedidos = class(TInterfacedObject, iModelPedidos)
    private
      FQuery,FQuery2 : iModelQuery;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iModelPedidos;
      function QuantidadeDePedidos : integer;
      function Pedidos : TDataSet; overload;
      function Pedidos(ID_Pedido : integer): TDataSet; overload;
      function ItensPedido(ID_Pedido : integer): TDataSet;
      function ClienteNome(ID_Pedido : integer): TDataSet;
  end;

implementation

uses
  Delivery.Model.Firedac.Query, System.SysUtils;


{ TModelPedidos }

function TModelPedidos.ClienteNome(ID_Pedido: integer): TDataSet;
begin
  try
    FQuery2.Open('SELECT * FROM Clientes where idPedido = '+QuotedStr(ID_Pedido.ToString));
  except
  end;

  Result := FQuery.DataSet;
end;

constructor TModelPedidos.Create;
begin
  FQuery := TModelFiredacQuery.New;
  FQuery2 := TModelFiredacQuery.New;
end;

destructor TModelPedidos.Destroy;
begin

  inherited;
end;

function TModelPedidos.ItensPedido(ID_Pedido: integer): TDataSet;
begin
  try
    FQuery.Open('SELECT * FROM Pedido_itens where idPedido = '+QuotedStr(ID_Pedido.ToString));
  except
  end;

  Result := FQuery.DataSet;
end;

class function TModelPedidos.New: iModelPedidos;
begin
  Result := self.Create;
end;

function TModelPedidos.Pedidos: TDataSet;

begin
  try
    FQuery
    .ClearSQL
      .add('SELECT idPedido,idCliente,horario,data,status,Nome FROM Pedidos')
      .add('INNER JOIN Clientes ON Clientes.ID = idCliente')
    .&End.Open;
  except
    on e :exception do
    raise Exception.Create(e.Message);
  end;

  Result := FQuery.DataSet;
end;

function TModelPedidos.Pedidos(ID_Pedido : integer): TDataSet;
begin
  try
    FQuery
      .SQL
        .Clear
        .Add('SELECT idPedido,idCliente,horario,data,status,Clientes.Nome')
        .Add('FROM Pedidos')
        .Add('INNER JOIN Clientes ON Clientes.ID = idCliente ')
        .Add('where idPedido = '+QuotedStr(ID_Pedido.ToString))
        .&End
      .Open;
  except
  end;

  Result := FQuery.DataSet;
end;

function TModelPedidos.QuantidadeDePedidos: integer;
begin
  try
    FQuery.Open('SELECT * FROM Pedidos');
  except
  end;

  Result := FQuery.DataSet.RecordCount;
end;

end.
