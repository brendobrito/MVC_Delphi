unit Delivery.Model.Firedac.Connection;

interface

uses
  Delivery.Model.Connection.Interfaces, Firedac.Stan.Intf, Firedac.Stan.Option,
  Firedac.Stan.Error, Firedac.UI.Intf, Firedac.Phys.Intf, Firedac.Stan.Def,
  Firedac.Stan.Pool, Firedac.Stan.Async, Firedac.Phys, Firedac.Phys.FB,
  Firedac.Phys.FBDef, Firedac.VCLUI.Wait, Data.DB, Firedac.Comp.Client, FireDAC.DApt, FireDAC.Phys.MySQL,
  FireDAC.Phys.SQLite, FireDAC.Phys.MSAcc,FireDAC.Comp.UI, System.Classes;

Type
  TModelFiredacConexao = class(TInterfacedObject, iModelConexao)
  private
    FConexao: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FParams : TStringList;
    function Caminho: string;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConexao;
    function Connection: TCustomConnection;
    function Database(aValue: String): iModelConexao;
    function UserName(aValue: String): iModelConexao;
    function Password(aValue: String): iModelConexao;
    function DriverID(aValue: String): iModelConexao;
    function DriverName : string;
    function IP(aValue: String): iModelConexao;
    function Porta(aValue: Integer): iModelConexao;
    function AddParam(aValue : string) : iModelConexao;
    function Connect: iModelConexao;
    function Desconnect: iModelConexao;
    function StartTransaction : iModelConexao;
    function Commit : iModelConexao;
    function RollBack : iModelConexao;

  end;

implementation

uses
  System.SysUtils;

{ TModelFiredacConexao }

function TModelFiredacConexao.AddParam(aValue: string): iModelConexao;
begin
  Result := self;

  if not Assigned(FParams) then
    FParams := TStringList.Create;

  FParams.Add(aValue);
end;

function TModelFiredacConexao.Commit: iModelConexao;
begin
  Result := self;
  FConexao.Commit;
end;

function TModelFiredacConexao.Connect: iModelConexao;
var
i : integer;

begin
  Result := self;

  if Assigned(FParams) then
  if FParams.Count > 0 then
  for I := 0 to FParams.Count-1 do
   FConexao.Params.Add(FParams.Strings[i]);

  try
    FConexao.Connected := true;
  except
    on Erro: Exception do
      raise Exception.Create('Erro de conexão: ' + Erro.Message);
  end;
end;

function TModelFiredacConexao.Connection: TCustomConnection;
begin
  Result := FConexao;
end;

constructor TModelFiredacConexao.Create;
begin
  FDGUIxWaitCursor1 := TFDGUIxWaitCursor.Create(nil);
  FDGUIxWaitCursor1.ScreenCursor := gcrNone;

  FDPhysSQLiteDriverLink1 := TFDPhysSQLiteDriverLink.Create(nil);
  FConexao := TFDConnection.Create(nil);
end;

function TModelFiredacConexao.Caminho : string;
begin
  Result := StringReplace(GetCurrentDir, '\', '/', [rfReplaceAll, rfIgnoreCase]);
end;

function TModelFiredacConexao.Database(aValue: String): iModelConexao;
begin
  Result := self;
  FConexao.Params.Database := aValue;
end;

function TModelFiredacConexao.Desconnect: iModelConexao;
begin
  Result := self;
  FConexao.Connected := false;
end;

destructor TModelFiredacConexao.Destroy;
begin
  FreeAndNil(FDGUIxWaitCursor1);
  FreeAndNil(FDPhysSQLiteDriverLink1);
  FreeAndNil(FConexao);
  FreeAndNil(FParams);
  inherited;
end;

function TModelFiredacConexao.DriverID(aValue: String): iModelConexao;
begin
  Result := self;
  FConexao.Params.DriverID := aValue;
end;

function TModelFiredacConexao.DriverName: string;
begin
  Result := FConexao.DriverName;
end;

class function TModelFiredacConexao.New: iModelConexao;
begin
  Result := self.Create;
end;

function TModelFiredacConexao.Password(aValue: String): iModelConexao;
begin
  Result := self;
  FConexao.Params.Password := aValue;
end;

function TModelFiredacConexao.Porta(aValue: Integer): iModelConexao;
begin
  Result := self;
  FConexao.Params.Add('Port=' + IntToStr(aValue));
end;

function TModelFiredacConexao.RollBack: iModelConexao;
begin
  Result := self;
  FConexao.Rollback;
end;

function TModelFiredacConexao.StartTransaction: iModelConexao;
begin
  Result := self;
  FConexao.StartTransaction;
end;

function TModelFiredacConexao.IP(aValue: String): iModelConexao;
begin
  Result := self;
  FConexao.Params.Add('Server=' + aValue);
end;

function TModelFiredacConexao.UserName(aValue: String): iModelConexao;
begin
  Result := self;
  FConexao.Params.UserName := aValue;
end;

end.
