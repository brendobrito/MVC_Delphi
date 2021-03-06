unit Delivery.Controller.Interfaces;

interface

uses
  FMX.Types;

type
  TPedidoStatus = (tpEmDigitacao,tpEmEspera,tpEmPreparo,tpProntoParaEntrega,tpConcluido);

type
  iControllerForms = interface;
  iControllerPedidos = interface;
  iControllerStatusPedido = interface;

  iController = interface
    ['{E54B8BAE-DB5E-4E4C-9513-47A0619A412F}']
    function Forms : iControllerForms;
    function Pedidos : iControllerPedidos;
  end;

  iControllerForms = interface
    ['{2828AB60-1C1F-4F4A-9B70-A15B18B82AD4}']
    function CreateForm(ClassName: String; aParent : TFMXObject = nil) : iControllerForms;
    function &End : iController;
  end;

  iControllerPedidos = interface
    ['{F64F69EF-18D8-4CC0-8BEF-5868B51B5083}']
    function Bind(value : TFMXObject) : iControllerPedidos; overload;
    function Bind : TFMXObject; overload;
    function AtualizarBind(Segundos : integer) : iControllerPedidos; overload;
    function AtualizarBind(value : boolean) : iControllerPedidos; overload;
    function novoPedido(id : string) : iControllerPedidos;
    function alterarPedido(id : string) : iControllerPedidos;
    function &End : iController;
  end;

  iControllerPedidosDrawObjects = interface
    ['{95EFA37F-60E7-45F8-8057-2329BFE59425}']
    function id(value : integer) : iControllerPedidosDrawObjects;
    function nomeCliente(value : string) : iControllerPedidosDrawObjects;
    function horaPedido(value : string) : iControllerPedidosDrawObjects;
    function status(value : TPedidoStatus) : iControllerPedidosDrawObjects;
    function &End : iControllerPedidos;
  end;

  iControllerStatusPedido = interface
    ['{4924D2E8-CF02-436E-B153-097B9D1DFD7C}']
    function GetColor(value: TPedidoStatus) : Cardinal;
    function GetText(value: TPedidoStatus) : string;
    function &End : iControllerPedidos;
  end;

implementation

end.
