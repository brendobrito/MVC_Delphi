 unit Ind.View.Pedidos.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  Delivery.Controller.Interfaces;

type
  TfrmPedidos = class(TForm)
    Rectangle6: TRectangle;
    Layout4: TLayout;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    Layout3: TLayout;
    Layout6: TLayout;
    Edit1: TEdit;
    ScrollBoxPedidos: TScrollBox;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FController : iController;
    procedure ConfigScrollBox;
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

uses
  Ind.Controller, FMX.InertialMovement;

{$R *.fmx}

procedure TfrmPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FController.Pedidos.AtualizarBind(false);
end;

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  Self.ConfigScrollBox;
  FController.Pedidos.Bind(ScrollBoxPedidos).AtualizarBind(5);
end;

procedure TfrmPedidos.Button1Click(Sender: TObject);
begin
 //FController.Pedidos.novoPedido();
end;

procedure TfrmPedidos.ConfigScrollBox;
var
    LCalculations: TAniCalculations;
begin
  LCalculations := TAniCalculations.Create(nil);
  try
    LCalculations.Animation        := true;
    LCalculations.BoundsAnimation  := true;
    LCalculations.Averaging        := true;
    LCalculations.AutoShowing      := true;
    LCalculations.DecelerationRate := 0.5;
    LCalculations.Elasticity       := 50;
    LCalculations.TouchTracking    := [ttHorizontal];
    //--- Passa as configurações para os componentes que possuem rolagem ---\\
    ScrollBoxPedidos.AniCalculations.Assign(LCalculations);
  finally
    LCalculations.Free;
  end;
end;

initialization
RegisterFmxClasses([TfrmPedidos]);

end.
