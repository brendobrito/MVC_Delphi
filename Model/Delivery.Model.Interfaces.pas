unit Delivery.Model.Interfaces;

interface

uses
  FMX.Types, Data.DB;

type

  iModelPedidos = interface
   ['{82ECDA7E-BE4B-430C-91F7-DD51D7B3CECC}']
     function QuantidadeDePedidos : integer;
     function Pedidos : TDataSet; overload;
     function Pedidos(ID : integer): TDataSet; overload;
     function ItensPedido(ID : integer): TDataSet;
  end;


implementation

end.
