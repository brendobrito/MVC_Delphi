unit Delivery.Controller.StatusPedido;

interface

uses
  Delivery.Controller.Interfaces;
type
  TControllerStatusPedido = class(TInterfacedObject, iControllerStatusPedido)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iControllerStatusPedido;
      function GetColor(value: TPedidoStatus): Cardinal;
      function GetText(value: TPedidoStatus): string;
      function &End : iControllerPedidos;
  end;

implementation

uses
  System.Generics.Collections;

{ TControllerStatusPedido }

function TControllerStatusPedido.&End: iControllerPedidos;
begin

end;

constructor TControllerStatusPedido.Create;
begin

end;

destructor TControllerStatusPedido.Destroy;
begin

  inherited;
end;

class function TControllerStatusPedido.New: iControllerStatusPedido;
begin
  Result := Self.Create;
end;

function TControllerStatusPedido.GetColor(value: TPedidoStatus): Cardinal;
var
  Lista : TList<Cardinal>;
begin
  Lista := TList<Cardinal>.Create;

  try
    Lista.Insert(Integer(TPedidoStatus.tpEmDigitacao), $FF949494);
    Lista.Insert(Integer(TPedidoStatus.tpEmEspera), $FFBB1B1B);
    Lista.Insert(Integer(TPedidoStatus.tpEmPreparo), $FFF98323);
    Lista.Insert(Integer(TPedidoStatus.tpProntoParaEntrega), $FF0086E5);
    Lista.Insert(Integer(TPedidoStatus.tpConcluido), $FF04A620);

    Result := Lista[Integer(value)];
  except
    Lista.Free;
    Result := 0;
  end;

  Lista.Free;
end;
function TControllerStatusPedido.GetText(value: TPedidoStatus): string;
  var
  Lista : TList<string>;
begin
  Lista := TList<string>.Create;

  try
    Lista.Insert(Integer(TPedidoStatus.tpEmDigitacao), 'Em digitação');
    Lista.Insert(Integer(TPedidoStatus.tpEmEspera), 'Em espera');
    Lista.Insert(Integer(TPedidoStatus.tpEmPreparo), 'Em preparação');
    Lista.Insert(Integer(TPedidoStatus.tpProntoParaEntrega), 'Pronto para entrega');
    Lista.Insert(Integer(TPedidoStatus.tpConcluido), 'Concluído');

    Result := Lista[Integer(value)];
  except
    Lista.Free;
    Result := 'ERRO';
  end;

  Lista.Free;
end;

end.
