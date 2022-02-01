unit Ind.Model.Conexoes.Firedac.Conexao;

interface

uses Ind.Model.Conexoes.Interfaces, FireDAC.Comp.Client, System.Classes,
   FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.FMXUI.Wait, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Comp.UI, Data.DB, FireDAC.DApt, FireDAC.Phys.MySQL,
  FireDAC.Phys.SQLite, FireDAC.Phys.MSAcc;

Type
  TModelConexaoFiredac = class(TInterfacedObject, iModelConexao,
    iModelConexaoParametros, iModelConexaoParams)
  private
    FConexao: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink;
    FDatabase: String;
    FUserName: String;
    FPassword: String;
    FDriverID: String;
    FServer: String;
    FPorta: Integer;
    FParams : TStringList;

    procedure LerParametros;
    function Params: iModelConexaoParams;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConexao;
    function EndConexao: TComponent;
    function Database(Value: String): iModelConexaoParametros;
    function UserName(Value: String): iModelConexaoParametros;
    function Password(Value: String): iModelConexaoParametros;
    function DriverID(Value: String): iModelConexaoParametros;
    function Server(Value: String): iModelConexaoParametros;
    function Porta(Value: Integer): iModelConexaoParametros;
    function EndParametros: iModelConexao;
    function Parametros : iModelConexaoParametros;
    function Conectar : iModelConexao;
    function Connected : Boolean overload;
    function Connected(Value : Boolean) : iModelConexao overload;
    function Ping: Boolean;
    function DriverName : String;
    function Add(Value: String): iModelConexaoParams;
    function FDCon: TFDCustomConnection;
    function &End: iModelConexao;
  end;

implementation

uses
  System.SysUtils;

{ TModelConexaoFiredac }

function TModelConexaoFiredac.Add(Value: String): iModelConexaoParams;
begin
  Result := self;
  FParams.Add(Value);
end;

function TModelConexaoFiredac.&End: iModelConexao;
begin
  Result := self;
end;

function TModelConexaoFiredac.Conectar: iModelConexao;
begin
  Result := Self;
  LerParametros;
  FConexao.Connected := true;

end;

function TModelConexaoFiredac.Connected: Boolean;
begin
  Result := FConexao.Connected;
end;

function TModelConexaoFiredac.Connected(Value: Boolean): iModelConexao;
begin
  FConexao.Connected := Value;
end;

constructor TModelConexaoFiredac.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FParams := TStringList.Create;
  FDGUIxWaitCursor1 := TFDGUIxWaitCursor.Create(nil);
  FDGUIxWaitCursor1.ScreenCursor := gcrNone;

  FDPhysFBDriverLink1 := TFDPhysFBDriverLink.Create(nil);
  FDPhysMySQLDriverLink1 := TFDPhysMySQLDriverLink.Create(nil);
  FDPhysSQLiteDriverLink1 := TFDPhysSQLiteDriverLink.Create(nil);
  FDPhysMSAccessDriverLink1 := TFDPhysMSAccessDriverLink.Create(nil);
end;

function TModelConexaoFiredac.Database(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FDatabase := Value;
end;

destructor TModelConexaoFiredac.Destroy;
begin
  FDGUIxWaitCursor1.Free;
  FDPhysMySQLDriverLink1.Free;
  FDPhysSQLiteDriverLink1.Free;
  FDPhysMSAccessDriverLink1.Free;
  FDPhysFBDriverLink1.Free;
  FConexao.Free;
  FParams.Free;
  inherited;
end;

function TModelConexaoFiredac.DriverID(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FDriverID := Value;
end;

function TModelConexaoFiredac.EndConexao: TComponent;
begin
  Result := FConexao;
end;

function TModelConexaoFiredac.EndParametros: iModelConexao;
begin
  Result := Self;
end;

function TModelConexaoFiredac.FDCon: TFDCustomConnection;
begin
  Result := FConexao;
end;

procedure TModelConexaoFiredac.LerParametros;
var
i : integer;

begin
  FConexao.Params.Database := FDatabase;
  FConexao.Params.UserName := FUserName;
  FConexao.Params.Password := FPassword;
  FConexao.Params.DriverID := FDriverID;
  FConexao.Params.Add('Server=' + FServer);
  FConexao.Params.Add('Port=' + IntToStr(FPorta));


  if FParams.Count > 0 then
  for I := 0 to FParams.Count-1 do
   FConexao.Params.Add(FParams.Strings[i]);

end;

class function TModelConexaoFiredac.New: iModelConexao;
begin
  Result := Self.Create;
end;

function TModelConexaoFiredac.Parametros: iModelConexaoParametros;
begin
  Result := Self;
end;

function TModelConexaoFiredac.Params: iModelConexaoParams;
begin
  Result := Self;
end;

function TModelConexaoFiredac.Password(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FPassword := Value;
end;


function TModelConexaoFiredac.Ping: Boolean;
begin
 Result := FConexao.Ping;
end;

function TModelConexaoFiredac.DriverName: String;
begin
 Result := FConexao.DriverName;
end;

function TModelConexaoFiredac.Porta(Value: Integer): iModelConexaoParametros;
begin
  Result := Self;
  FPorta := Value;
end;

function TModelConexaoFiredac.Server(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FServer := Value;
end;

function TModelConexaoFiredac.UserName(Value: String): iModelConexaoParametros;
begin
  Result := Self;
  FUserName := Value;
end;

end.