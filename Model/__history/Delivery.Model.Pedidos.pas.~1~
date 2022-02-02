unit Delivery.Model.Pedidos;

interface

uses
  Delivery.Controller.Interfaces, FMX.Types, System.Generics.Collections,
  System.Classes,Delivery.Controller.Pedidos.DrawObjects;
type
  TModelPedidos = class(TInterfacedObject, iModelPedidos)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iModelPedidos;
      function QuantidadeDePedidos : integer;
      function Pedidos : TDataSet;
  end;

implementation


{ TModelPedidos }

constructor TModelPedidos.Create;
begin

end;

destructor TModelPedidos.Destroy;
begin

  inherited;
end;

class function TModelPedidos.New: iModelPedidos;
begin

end;

end.
