program Delivery;

uses
  System.StartUpCopy,
  FMX.Forms,
  Delivery.View.Principal in 'View\Delivery.View.Principal.pas' {frmPrincipal},
  Delivery.Controller.Interfaces in 'Controller\Delivery.Controller.Interfaces.pas',
  Delivery.Controller in 'Controller\Delivery.Controller.pas',
  Delivery.Controller.Forms in 'Controller\Delivery.Controller.Forms.pas',
  Delivery.View.Pedidos.Principal in 'View\Pedidos\Delivery.View.Pedidos.Principal.pas' {frmPedidos},
  Delivery.Controller.Pedidos in 'Controller\Pedidos\Delivery.Controller.Pedidos.pas',
  Delivery.Controller.Pedidos.DrawObjects in 'Controller\Pedidos\Delivery.Controller.Pedidos.DrawObjects.pas',
  Delivery.Controller.StatusPedido in 'Controller\Pedidos\Delivery.Controller.StatusPedido.pas',
  Delivery.Model.Connection.Interfaces in 'Model\Connection\Delivery.Model.Connection.Interfaces.pas',
  Delivery.Model.Firedac.Connection in 'Model\Connection\Firedac\Delivery.Model.Firedac.Connection.pas',
  Delivery.Model.Firedac.Query in 'Model\Connection\Firedac\Delivery.Model.Firedac.Query.pas',
  Delivery.Model.Pedidos in 'Model\Delivery.Model.Pedidos.pas',
  Delivery.Model.Interfaces in 'Model\Delivery.Model.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  //ReportMemoryLeaksOnShutdown := true;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
