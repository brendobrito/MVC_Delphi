unit Delivery.View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Ani, FMX.Effects, FMX.Layouts, FMX.TabControl, FMX.Controls.Presentation,
  FMX.StdCtrls, Delivery.Controller.Interfaces, FireDAC.UI.Intf,
  FireDAC.FMXUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI;

type
  TfrmPrincipal = class(TForm)
    Layout1: TLayout;
    Circle1: TCircle;
    Label1: TLabel;
    Label2: TLabel;
    Layout2: TLayout;
    Line1: TLine;
    Layout4: TLayout;
    Text1: TText;
    Text2: TText;
    Text3: TText;
    Layout3: TLayout;
    ScrollBox1: TScrollBox;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    GridPanelLayout1: TGridPanelLayout;
    Layout5: TLayout;
    Line2: TLine;
    Line3: TLine;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    Lbl_Btn_Fornecedor: TText;
    Img_Btn_Fornecedor: TImage;
    Layout6: TLayout;
    Line4: TLine;
    Line5: TLine;
    Rectangle2: TRectangle;
    ShadowEffect2: TShadowEffect;
    Text4: TText;
    Image1: TImage;
    Layout7: TLayout;
    Line6: TLine;
    Rectangle3: TRectangle;
    ShadowEffect3: TShadowEffect;
    Text5: TText;
    Image2: TImage;
    Layout8: TLayout;
    Line8: TLine;
    Rectangle4: TRectangle;
    ShadowEffect4: TShadowEffect;
    Text6: TText;
    Image3: TImage;
    Layout9: TLayout;
    Line9: TLine;
    Rectangle5: TRectangle;
    ShadowEffect5: TShadowEffect;
    Text7: TText;
    Image4: TImage;
    Layout10: TLayout;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    StyleBook1: TStyleBook;
    Layout11: TLayout;
    Text13: TText;
    Text14: TText;
    Text15: TText;
    Text16: TText;
    Text17: TText;
    Text18: TText;
    Layout13: TLayout;
    Text10: TText;
    Rectangle6: TRectangle;
    ShadowEffect6: TShadowEffect;
    Text8: TText;
    Image5: TImage;
    Layout12: TLayout;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure Text3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Rectangle1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure Rectangle1MouseLeave(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
  private
    FController : iController;
    procedure ConfigScrollBox;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  FMX.InertialMovement, Delivery.Controller, Delivery.Controller.Forms;

{$R *.fmx}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Self.ConfigScrollBox;
  FController := TController.New;
end;

procedure TfrmPrincipal.Rectangle1Click(Sender: TObject);
begin
  TControllerForms.CreateForm('TfrmPedidos', Layout12);
end;

procedure TfrmPrincipal.Rectangle1MouseLeave(Sender: TObject);
begin
  if (sender is TRectangle) then
  begin
    TRectangle(sender).AnimateFloat('Height',178,0.3, TAnimationType.Out,TInterpolationType.Linear);
    TRectangle(sender).AnimateFloat('Width',223,0.3, TAnimationType.Out,TInterpolationType.Linear);
    sleep(30);

    TRectangle(Sender).Fill.Gradient.Color  := TAlphaColors.Null;
    TRectangle(Sender).Fill.Gradient.Color1 := TAlphaColors.Null;
    TRectangle(Sender).Cursor := crDefault;
  end;
end;

procedure TfrmPrincipal.Rectangle1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
  if (sender is TRectangle) then
  begin
    TRectangle(Sender).Fill.Kind      := TBrushKind.Gradient;
    TRectangle(Sender).Fill.Gradient  := self.Fill.Gradient;
    TRectangle(Sender).Cursor := crHandPoint;

    TRectangle(sender).AnimateFloat('Height',188,0.2, TAnimationType.&In,TInterpolationType.Linear);
    TRectangle(sender).AnimateFloat('Width',233,0.2, TAnimationType.&In,TInterpolationType.Linear);
  end;
end;

procedure TfrmPrincipal.Text3Click(Sender: TObject);
begin
  Rectangle1.Fill.Gradient.Color  := TAlphaColors.Null;
  Rectangle1.Fill.Gradient.Color1 := TAlphaColors.Null;
end;

procedure TfrmPrincipal.ConfigScrollBox;
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
        ScrollBox1.AniCalculations.Assign(LCalculations);
    finally
        LCalculations.Free;
    end;
end;

end.
