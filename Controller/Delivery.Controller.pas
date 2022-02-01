unit Delivery.Controller;

interface

uses
  Delivery.Controller.Interfaces;
type
  TController = class(TInterfacedObject, iController)
    private
      FForms : iControllerForms;
      FPedidos : iControllerPedidos;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iController;
      function Forms : iControllerForms;
      function Pedidos : iControllerPedidos;
  end;

implementation

uses
  Delivery.Controller.Forms, Delivery.Controller.Pedidos;

{ TController }

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.Forms: iControllerForms;
begin
  Result := FForms;
end;

class function TController.New: iController;
begin
    Result := Self.Create;
end;

function TController.Pedidos: iControllerPedidos;
begin
  if not Assigned(FPedidos) then
    FPedidos := TControllerPedidos.New(Self);

  Result := FPedidos;
end;

end.
