unit Ind.Model.Conexoes.Firedac.Query;

interface

uses
  Data.DB, System.Classes, Firedac.Comp.Client,
  System.SysUtils, Ind.Model.DataSet.Proxy,
  Ind.Model.DataSet.Interfaces, Ind.Model.DataSet.Factory,
  Ind.Model.DataSet.Observer, System.Generics.Collections,
  Ind.Model.Conexoes.Interfaces, Firedac.Stan.Option;


Type
  TFiredacModelQuery = class(TInterfacedObject, iQuery)
    private
      FSQL : String;
      FKey : Integer;
      FConexao : TFDConnection;
      FConexaoSecundaria : TFDConnection;
      FDriver : iDriver;
      FQuery : TList<TFDQuery>;
      FDataSource : TDataSource;
      FDataSet : TDictionary<integer, iDataSet>;
      FChangeDataSet : TChangeDataSet;
      FParams : TParams;


      procedure InstanciaQuery;
      function GetDataSet : iDataSet;
      function GetQuery : TFDQuery;
      procedure SetQuery(Value : TFDQuery);
    public
      constructor Create(Conexao : TFDConnection; Driver : iDriver);
      destructor Destroy; override;
      class function New(Conexao : TFDConnection; Driver : iDriver) : iQuery;
      //iObserver
      procedure ApplyUpdates(DataSet : TDataSet);
      //iQuery
      function Open(aSQL: String): iQuery;
      function ExecSQL(aSQL : String) : iQuery; overload;
      function DataSet : TDataSet; overload;
      function DataSet(Value : TDataSet) : iQuery; overload;
      function DataSource(Value : TDataSource) : iQuery;
      function Fields : TFields;
      function ChangeDataSet(Value : TChangeDataSet) : iQuery;
      function &End: TComponent;
      function Tag(Value : Integer) : iQuery;
      function LocalSQL(Value : TComponent) : iQuery;
      function Close : iQuery;
      function SQL : TStrings;
      function Params : TParams;
      function ParamByName(Value : String) : TParam;
      function ExecSQL : iQuery; overload;
      function UpdateTableName(Tabela : String) : iQuery;
      function FetchOptions : TFDFetchOptions;
      function Connection(Conexao: iModelConexao;
      ConexaoSecundaria: iModelConexao): iQuery; overload;
      function Connection(Conexao: iModelConexao): iQuery; overload;
      function FieldByName(Value : string): TField;
  end;

implementation

uses
  FireDAC.Stan.Param;

{ TFiredacModelQuery }

function TFiredacModelQuery.&End: TComponent;
begin
  Result := GetQuery;
end;

function TFiredacModelQuery.ExecSQL: iQuery;
begin
  Result := Self;
  if Assigned(FParams) then
    GetQuery.Params.Assign(FParams);
  GetQuery.ExecSQL;
  ApplyUpdates(nil);
end;

procedure TFiredacModelQuery.InstanciaQuery;
var
  Query : TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := FConexao;
  Query.AfterPost := ApplyUpdates;
  Query.AfterDelete := ApplyUpdates;
  FQuery.Add(Query);
end;

function TFiredacModelQuery.ExecSQL(aSQL: String): iQuery;
begin
  FSQL := aSQL;
  GetQuery.SQL.Text := FSQL;
  GetQuery.ExecSQL;
  ApplyUpdates(nil);
end;

function TFiredacModelQuery.Fields: TFields;
begin
  Result := GetQuery.Fields;
end;

function TFiredacModelQuery.GetDataSet: iDataSet;
begin
  Result := FDataSet.Items[FKey];
end;

function TFiredacModelQuery.GetQuery: TFDQuery;
begin
  Result := FQuery.Items[Pred(FQuery.Count)];
end;

function TFiredacModelQuery.LocalSQL(Value: TComponent): iQuery;
begin
  Result := Self;
  GetQuery.LocalSQL := TFDCustomLocalSQL(Value);
end;

procedure TFiredacModelQuery.ApplyUpdates(DataSet: TDataSet);
begin
  FDriver.Cache.ReloadCache('');
end;

function TFiredacModelQuery.ChangeDataSet(Value: TChangeDataSet): iQuery;
begin
  Result := Self;
  FChangeDataSet := Value;
end;

function TFiredacModelQuery.Close: iQuery;
begin
  Result := Self;
  GetQuery.Close;
end;

constructor TFiredacModelQuery.Create(Conexao : TFDConnection; Driver : iDriver);
begin
  FDriver := Driver;
  FConexao := Conexao;
  FKey := 0;
  FQuery := TList<TFDQuery>.Create;
  FDataSet := TDictionary<integer, iDataSet>.Create;
  InstanciaQuery;
end;

function TFiredacModelQuery.DataSet: TDataSet;
begin
  Result := TDataSet(GetQuery);
end;

function TFiredacModelQuery.DataSet(Value: TDataSet): iQuery;
begin
  Result := Self;
  GetDataSet.DataSet(Value);
end;

function TFiredacModelQuery.DataSource(Value : TDataSource) : iQuery;
begin
  Result := Self;
  FDataSource := Value;
end;

destructor TFiredacModelQuery.Destroy;
begin
  FreeAndNil(FQuery);
  FreeAndNil(FDataSet);
  inherited;
end;

class function TFiredacModelQuery.New(Conexao : TFDConnection; Driver : iDriver) : iQuery;
begin
  Result := Self.Create(Conexao, Driver);
end;

function TFiredacModelQuery.Open(aSQL: String): iQuery;
var
  Query : TFDQuery;
  DataSet : iDataSet;
begin
  Result := Self;
  FSQL := aSQL;
  if not FDriver.Cache.CacheDataSet(FSQL, DataSet) then
  begin
    InstanciaQuery;
    DataSet.DataSet(GetQuery);
    DataSet.SQL(FSQL);
    GetQuery.Close;
    GetQuery.Open(aSQL);
    FDriver.Cache.AddCacheDataSet(DataSet.GUUID, DataSet);
  end
  else
    SetQuery(TFDQuery(DataSet.DataSet));
  FDataSource.DataSet := DataSet.DataSet;
  Inc(FKey);
  FDataSet.Add(FKey, DataSet);
end;

function TFiredacModelQuery.ParamByName(Value: String): TParam;
begin
  Result := TParam(GetQuery.ParamByName(Value));
end;

function TFiredacModelQuery.Params: TParams;
begin
  if not Assigned(FParams) then
    FParams := TParams.Create(nil);

  FParams.Assign(GetQuery.Params);
  Result := FParams;
end;

procedure TFiredacModelQuery.SetQuery(Value: TFDQuery);
begin
  FQuery.Items[Pred(FQuery.Count)] := Value;
end;

function TFiredacModelQuery.SQL: TStrings;
begin
 Result := GetQuery.SQL;
end;

function TFiredacModelQuery.Tag(Value: Integer): iQuery;
begin
  Result := Self;
  GetQuery.Tag := Value;
end;

function TFiredacModelQuery.UpdateTableName(Tabela: String): iQuery;
begin
  Result := Self;
end;

function TFiredacModelQuery.FetchOptions: TFDFetchOptions;
begin
  Result := GetQuery.FetchOptions;
end;

function TFiredacModelQuery.Connection(Conexao: iModelConexao;
  ConexaoSecundaria: iModelConexao): iQuery;
begin
  GetQuery.Connection := (Conexao.EndConexao as TFDConnection);
  FConexao := (Conexao.EndConexao as TFDConnection);
  FConexaoSecundaria := (ConexaoSecundaria.EndConexao as TFDConnection);
end;

function TFiredacModelQuery.Connection(Conexao: iModelConexao): iQuery;
begin
  GetQuery.Connection := (Conexao.EndConexao as TFDConnection);
  FConexao := (Conexao.EndConexao as TFDConnection);
  FConexaoSecundaria := (Conexao.EndConexao as TFDConnection);
end;

function TFiredacModelQuery.FieldByName(Value: string): TField;
begin
  Result := GetQuery.FieldByName(Value);
end;

end.
