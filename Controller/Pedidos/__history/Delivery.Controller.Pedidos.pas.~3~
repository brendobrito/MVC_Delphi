unit Delivery.Controller.Pedidos;

interface

uses
  Delivery.Controller.Interfaces, FMX.Types, System.Generics.Collections,
  System.Classes,Delivery.Controller.Pedidos.DrawObjects;
type
  TControllerPedidos = class(TInterfacedObject, iControllerPedidos)
    private
      [weak]
      FParent : iController;
      FBind : TFMXObject;
      FAtualizarBind : boolean;
      FListaObjectos : TObjectDictionary<integer, TControllerPedidosDrawObjects>;
      FID : string;
    public
      constructor Create(Parent : iController);
      destructor Destroy; override;
      class function New(Parent : iController) : iControllerPedidos;
      function Bind(value : TFMXObject) : iControllerPedidos; overload;
      function Bind : TFMXObject; overload;
      function novoPedido(id : string) : iControllerPedidos;
      function alterarPedido(id : string) : iControllerPedidos;
      function AtualizarBind(Segundos : integer) : iControllerPedidos; overload;
      function AtualizarBind(value : boolean) : iControllerPedidos; overload;
      function &End : iController;
  end;

implementation

uses
  FMX.Forms,
  System.UITypes,
  System.SysUtils,
    Ind.Controller.StatusPedido;

{ TControllerPedidos }

function TControllerPedidos.&End: iController;
begin
  Result := FParent;
end;

function TControllerPedidos.alterarPedido(id: string): iControllerPedidos;
begin
  Result := self;
  FID := id;
end;

function TControllerPedidos.Bind(value: TFMXObject): iControllerPedidos;
begin
  Result := self;
  FBind := value;
end;

function TControllerPedidos.AtualizarBind(Segundos: integer): iControllerPedidos;
var
 aPedido : TControllerPedidosDrawObjects;
 aThread : TThread;
begin
  Result := self;
  FAtualizarBind := true;

  aThread := TThread.CreateAnonymousThread(
  procedure
  var
  i : integer;
  begin
      while FAtualizarBind do
      begin
        Sleep(100);
        for I := 1 to 10 do
        begin
          TThread.Synchronize (TThread.CurrentThread,
          procedure
          begin
             if FListaObjectos.TryGetValue(i, aPedido) = false then
               FListaObjectos.Add(i, TControllerPedidosDrawObjects.Create(Bind).id(i).horaPedido('01:06').nomeCliente('teste').status(tpEmPreparo));
          end);
        end;
        Sleep(Segundos*1000);
      end;
  end);
  aThread.FreeOnTerminate := true;
  aThread.Start;
end;

function TControllerPedidos.AtualizarBind(value: boolean): iControllerPedidos;
begin
  Result := self;
  FAtualizarBind := value;
end;

function TControllerPedidos.Bind: TFMXObject;
begin
  Result := FBind;
end;

constructor TControllerPedidos.Create(Parent : iController);
begin
  FParent := Parent;
  FListaObjectos := TObjectDictionary<integer, TControllerPedidosDrawObjects>.Create;
end;

destructor TControllerPedidos.Destroy;
var
 i : integer;
begin
  for I := 1 to FListaObjectos.Count do
    FListaObjectos[i].Destroy;

  FAtualizarBind := false;
  FreeAndNil(FListaObjectos);
  inherited;
end;

class function TControllerPedidos.New(Parent : iController): iControllerPedidos;
begin
  Result := Self.Create(Parent);
end;

function TControllerPedidos.novoPedido(id: string): iControllerPedidos;
begin
  Result := self;
  //FListaObjectos.Add(i, TControllerPedidosDrawObjects.Create(Bind).id(i).horaPedido('01:06').nomeCliente('teste').status(tpEmPreparo));
  FID := id;
end;

end.
