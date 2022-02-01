program Delivery;

uses
  System.StartUpCopy,
  FMX.Forms,
  Ind.View.Principal in 'View\Ind.View.Principal.pas' {frmPrincipal},
  Delivery.Controller.Interfaces in 'Controller\Delivery.Controller.Interfaces.pas',
  Delivery.Controller in 'Controller\Delivery.Controller.pas',
  Delivery.Controller.Forms in 'Controller\Delivery.Controller.Forms.pas',
  Ind.View.Pedidos.Principal in 'View\Pedidos\Ind.View.Pedidos.Principal.pas' {frmPedidos},
  Delivery.Controller.Pedidos in 'Controller\Pedidos\Delivery.Controller.Pedidos.pas',
  Delivery.Controller.Pedidos.DrawObjects in 'Controller\Pedidos\Delivery.Controller.Pedidos.DrawObjects.pas',
  Delivery.Controller.StatusPedido in 'Controller\Pedidos\Delivery.Controller.StatusPedido.pas',
  Ind.View.Cadastros.Produtos.Principal in 'View\Cadastros\Produtos\Ind.View.Cadastros.Produtos.Principal.pas' {frmCadastrosProdutos};

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := true;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
