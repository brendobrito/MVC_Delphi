    unit Delivery.Model.Firedac.Query;

interface

uses
  Delivery.Model.Connection.Interfaces, Firedac.Stan.Intf, Firedac.Stan.Option,
  Firedac.Stan.Param, Firedac.Stan.Error, Firedac.DatS, Firedac.Phys.Intf,
  Firedac.DApt.Intf, Firedac.Stan.Async, Firedac.DApt, Firedac.Comp.DataSet,
  Firedac.Comp.Client,
  Data.DB, System.Classes;

Type
  TModelFiredacQuery = class(TInterfacedObject, iModelQuery, iModelQuerySQL)
  private
    FQuery: TFDQuery;
    FConexao: iModelConexao;

  public
    destructor Destroy; override;
    constructor Create; overload;
    class function New: iModelQuery; overload;
    function Query: TDataSet;
    function DataSet: TDataSet;
    function Open(aSQL: String): iModelQuery; overload;
    function Open: iModelQuery; overload;
    function ExecSQL(aSQL: String): integer; overload;
    function ExecSQL: iModelQuery; overload;
    function Fields: TFields;
    function SQL: iModelQuerySQL;
    function Close: iModelQuery;
    function Connection(aValue: iModelConexao): iModelQuery; overload;
    function FieldByName(aValue: string): TField;
    function FetchOptions: TFDFetchOptions;
    function ParamByName(aValue : string) : TFDParam;
    function Add(value : string) : iModelQuerySQL;
    function ClearSQL : iModelQuerySQL;
    function Clear : iModelQuerySQL;
    function Text : string; overload;
    function Text(value : string) : iModelQuery; overload;
    function &End : iModelQuery;
  end;

implementation

uses
  System.SysUtils, Delivery.Model.Firedac.Connection;

{ TModelQueryFiredac }

function TModelFiredacQuery.ParamByName(aValue : string) : TFDParam;
begin
  Result := FQuery.ParamByName(aValue);
end;

function TModelFiredacQuery.Add(value: string): iModelQuerySQL;
begin
  Result := self;
  FQuery.SQL.Add(value);
end;

function TModelFiredacQuery.Clear: iModelQuerySQL;
begin
  Result := self;
  FQuery.SQL.Clear;
end;

function TModelFiredacQuery.ClearSQL: iModelQuerySQL;
begin
  Result := self;
  FQuery.SQL.Clear;
end;

function TModelFiredacQuery.&End: iModelQuery;
begin
  Result := self;
end;

function TModelFiredacQuery.Close: iModelQuery;
begin
  Result := self;
  FQuery.Close;
  FQuery.SQL.Clear;
end;

function TModelFiredacQuery.Connection(aValue: iModelConexao): iModelQuery;
begin
  Result := self;
  FConexao := aValue;
  FQuery.Connection := TFDConnection(FConexao.Connection);
end;

constructor TModelFiredacQuery.Create;
begin
  FQuery := TFDQuery.Create(nil);

  try
   FConexao :=
     TModelFiredacConexao
       .New
       .Database(PChar(GetCurrentDir + '\db.db'))
       .UserName('')
       .Password('')
       .DriverID('SQLite')
       .IP('')
       .AddParam('LockingMode=Normal')
       .AddParam('SharedCache=True')
     .Connect;

  except
  on e:Exception do
    raise Exception.Create(e.message);
  end;

  FQuery.Connection := TFDConnection(FConexao.Connection);
end;


function TModelFiredacQuery.DataSet: TDataSet;
begin
  Result := FQuery;
end;

destructor TModelFiredacQuery.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TModelFiredacQuery.ExecSQL: iModelQuery;
begin
  try
    Result := self;
    FQuery.ExecSQL;
  except
    on E:exception do begin
      {
      TLog.New.Gravar(PChar(GetCurrentDir + '\Log\Query.ind'),'Data/Hora: '+datetimetostr(now));
      TLog.New.Gravar(PChar(GetCurrentDir + '\Log\Query.ind'),'Mensagem: '+E.Message);
      TLog.New.Gravar(PChar(GetCurrentDir + '\Log\Query.ind'),'SQL: '+FQuery.SQL.Text);
      TLog.New.Gravar(PChar(GetCurrentDir + '\Log\Query.ind'),'======================');        }
    end;
  end;
end;

function TModelFiredacQuery.ExecSQL(aSQL: String): integer;
begin

  try
    Result := FQuery.ExecSQL(aSQL);
  except
    on E:exception do begin
      {
      TLog.New.Gravar(PChar(GetCurrentDir + '\Log\Query.ind'),'Data/Hora: '+datetimetostr(now));
      TLog.New.Gravar(PChar(GetCurrentDir + '\Log\Query.ind'),'Mensagem: '+E.Message);
      TLog.New.Gravar(PChar(GetCurrentDir + '\Log\Query.ind'),'SQL: '+aSQL);
      TLog.New.Gravar(PChar(GetCurrentDir + '\Log\Query.ind'),'======================');
      }
    end;
  end;
end;

function TModelFiredacQuery.FetchOptions: TFDFetchOptions;
begin
  Result := FQuery.FetchOptions;
end;

function TModelFiredacQuery.FieldByName(aValue: string): TField;
begin
  Result := FQuery.FieldByName(aValue);
end;

function TModelFiredacQuery.Fields: TFields;
begin
  Result := Query.Fields;
end;

class function TModelFiredacQuery.New: iModelQuery;
begin
  Result := self.Create;
end;

function TModelFiredacQuery.Open: iModelQuery;
begin
  Result := self;
  FQuery.Open;
end;

function TModelFiredacQuery.Open(aSQL: String): iModelQuery;
begin
  Result := self;
  FQuery.Open(aSQL);
end;

function TModelFiredacQuery.Query: TDataSet;
begin
  Result := FQuery;
end;

function TModelFiredacQuery.SQL: iModelQuerySQL;
begin
  Result := self;
end;

function TModelFiredacQuery.Text(value: string): iModelQuery;
begin
  Result := self;
  Fquery.SQL.Text := value;
end;

function TModelFiredacQuery.Text: string;
begin
  Result := FQuery.SQL.Text;
end;

end.
