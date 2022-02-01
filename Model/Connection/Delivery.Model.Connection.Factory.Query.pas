unit Ind.Model.Conexoes.Factory.Query;

interface

uses Ind.Model.Conexoes.Interfaces, Ind.Controller.Conexoes.Factory.Conexao,
  Ind.Model.Conexoes.Firedac.Query;


Type
  TModelFactoryQuery = class(TInterfacedObject, iModelFactoryQuery)
    private
    FQuery : iQuery;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelFactoryQuery;
      function Query : iQuery;
  end;

implementation

{ TModelConexaoFactoryDataSet }

constructor TModelFactoryQuery.Create;
begin
  FQuery := TFiredacModelQuery.New();
end;

destructor TModelFactoryQuery.Destroy;
begin
  inherited;
end;

class function TModelFactoryQuery.New: iModelFactoryQuery;
begin
  Result := Self.Create;
end;

function TModelFactoryQuery.Query: iQuery;
begin
  Result := FQuery;
end;

end.
