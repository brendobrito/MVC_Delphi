unit Delivery.Controller.Pedidos.DrawObjects;

interface

uses
  Delivery.Controller.Interfaces, FMX.Types, System.Generics.Collections,
  FMX.Objects, FMX.StdCtrls, System.Classes;
type
  TControllerPedidosDrawObjects = class
    private
      FParent : TFMXObject;
      FID : TLabel;
      FNomeCliente : TLabel;
      FHoraPedido : TLabel;
      FStatusLabel : TLabel;
      FStatusRectangle : TRectangle;
      FRectangleBase : TRectangle;
    procedure RectangleMouseEnter(Sender: TObject);
    procedure RectangleMouseLeave(Sender: TObject);

    public
      constructor Create(Parent : TFMXObject);
      destructor Destroy; override;
      function id(value : integer) : TControllerPedidosDrawObjects;
      function nomeCliente(value : string) : TControllerPedidosDrawObjects;
      function horaPedido(value : string) : TControllerPedidosDrawObjects;
      function status(value : TPedidoStatus) : TControllerPedidosDrawObjects;
  end;

implementation

uses
  FMX.Forms, System.UITypes, System.SysUtils, System.Variants,
  FMX.Graphics, Delivery.Controller, Delivery.Controller.StatusPedido;

{ TControllerPedidos }

function TControllerPedidosDrawObjects.horaPedido(
  value: string): TControllerPedidosDrawObjects;
begin
  Result := self;

  if not Assigned(FHoraPedido) then begin

    FHoraPedido := TLabel.Create(FRectangleBase);
    with FHoraPedido do
    begin
      Parent := FRectangleBase;
      Anchors := [TAnchorKind.akLeft, TAnchorKind.akTop];
      Position.X := 10;
      Position.Y := 25;
      Width := 50;
      StyledSettings := [TStyledSetting.Family, TStyledSetting.Style];
      TextSettings.Font.Size := 12;
      TextSettings.HorzAlign := TTextAlign.Leading;
      TextSettings.FontColor := $FF656565;
    end;
  end;

  FHoraPedido.Text := value;
end;

function TControllerPedidosDrawObjects.id(
  value: integer): TControllerPedidosDrawObjects;
begin
  Result := self;

  if not Assigned(FID) then begin

    FID := TLabel.Create(FRectangleBase);
    with FID do
    begin
      Parent := FRectangleBase;
      ClipParent := false;
      ClipChildren := false;
      Anchors := [TAnchorKind.akLeft, TAnchorKind.akTop];
      Position.X := 10;
      Position.Y := 6;
      Width := 50;
      StyledSettings := [TStyledSetting.Family, TStyledSetting.Style];
      TextSettings.Font.Size := 12;
      TextSettings.HorzAlign := TTextAlign.Leading;
      TextSettings.FontColor := $FF656565;
    end;
  end;

  FID.Text := FormatFloat('''#''0000', value);
end;

procedure TControllerPedidosDrawObjects.RectangleMouseEnter(Sender: TObject);
begin
  if (sender is TRectangle) then
  begin
    TRectangle(Sender).Fill.Kind      := TBrushKind.Gradient;
    TRectangle(Sender).Fill.Gradient  := TRectangle(Sender).Fill.Gradient;
    TRectangle(Sender).Cursor := crHandPoint;

    TRectangle(Sender).Fill.Kind      := TBrushKind.Solid;
    TRectangle(Sender).Fill.Color  := $FFCDEBF6;
    TRectangle(Sender).Cursor := crHandPoint;
  end;
end;

procedure TControllerPedidosDrawObjects.RectangleMouseLeave(Sender: TObject);
begin
  if (sender is TRectangle) then
  begin
    TRectangle(Sender).Fill.Kind      := TBrushKind.Gradient;
    TRectangle(Sender).Fill.Gradient  := TRectangle(Sender).Fill.Gradient;
    TRectangle(Sender).Cursor := crHandPoint;

    TRectangle(Sender).Fill.Kind      := TBrushKind.Solid;
    TRectangle(Sender).Fill.Color  := $FFFFFFFF;
  end;
end;

constructor TControllerPedidosDrawObjects.Create(Parent : TFMXObject);
begin
  FParent := Parent;

  if not Assigned(FRectangleBase) then begin
    FRectangleBase := TRectangle.Create(nil);
    with FRectangleBase do
    begin
      Parent := FParent;
      Align := TAlignLayout.top;

      Fill.Color := $FFFFFFFF;
      Size.Width := 491;
      Size.Height := 50;
      Size.PlatformDefault := False;
      Stroke.Thickness := 0.2;
      Sides := [TSide.Bottom];
      Position.Y := -10;
    end;

    FRectangleBase.OnMouseEnter := RectangleMouseEnter;
    FRectangleBase.OnMouseLeave := RectangleMouseLeave;
  end;


end;

destructor TControllerPedidosDrawObjects.Destroy;
begin
  inherited;
end;

function TControllerPedidosDrawObjects.nomeCliente(
  value: string): TControllerPedidosDrawObjects;
begin
  Result := self;

  if not Assigned(FNomeCliente) then begin

    FNomeCliente := TLabel.Create(Nil);
    with FNomeCliente do
    begin
      Parent := FRectangleBase;
      Anchors := [TAnchorKind.akLeft, TAnchorKind.akTop];
      Position.X := 60;
      Position.Y := 6;
      Width := 350;
      StyledSettings := [TStyledSetting.Family, TStyledSetting.Style,
      TStyledSetting.FontColor];
      TextSettings.Font.Size := 15;
      TextSettings.HorzAlign := TTextAlign.Leading;
      TextSettings.FontColor := $FF656565;
    end;
  end;

  FNomeCliente.Text := value;
end;

function TControllerPedidosDrawObjects.status(
  value: TPedidoStatus): TControllerPedidosDrawObjects;
begin
  Result := self;

  if not Assigned(FStatusRectangle) then begin

    FStatusRectangle := TRectangle.Create(FRectangleBase);
    with FStatusRectangle do
    begin
      Parent := FRectangleBase;
      Position.X := INT(FRectangleBase.Width)-125;
      Position.Y := (INT(FRectangleBase.Height)-25)/2;
      Size.Width := 110;
      Size.Height := 25;
      Size.PlatformDefault := False;
      Stroke.Kind := TBrushKind.None;
      XRadius := 8.0;
      YRadius := 8.0;
      HitTest := false;
    end;


   FStatusLabel := TLabel.Create(FRectangleBase);
   with FStatusLabel do
    begin
      Parent := FStatusRectangle;
      Align := TAlignLayout.Center;
      AutoSize := True;
      StyledSettings := [TStyledSetting.Family, TStyledSetting.Style];
      TextSettings.Font.Size := 12;
      TextSettings.HorzAlign := TTextAlign.Leading;
      TextSettings.FontColor := TAlphaColors.White;
      TextSettings.HorzAlign := TTextAlign.Center;
      WordWrap := false;
    end;
  end;

  FStatusRectangle.Fill.Color := TControllerStatusPedido.New.GetColor(value);
  FStatusLabel.Text := TControllerStatusPedido.New.GetText(value);
end;


end.
