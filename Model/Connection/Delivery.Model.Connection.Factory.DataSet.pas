unit Ind.Model.Conexoes.Factory.DataSet;

interface

uses Ind.Model.Conexoes.Interfaces, Ind.Model.Conexoes.Firedac.Table;

Type
  TModelConexaoFactoryDataSet = class(TInterfacedObject, iModelFactoryDataSet)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelFactoryDataSet;
      function DataSetFiredac(Conexao : iModelConexao) : iModelDataSet;
  end;

implementation

{ TModelConexaoFactoryDataSet }

constructor TModelConexaoFactoryDataSet.Create;
begin

end;

function TModelConexaoFactoryDataSet.DataSetFiredac(Conexao : iModelConexao) : iModelDataSet;
begin
  Result := TModelConexoesFiredacTable.New(Conexao);
end;

destructor TModelConexaoFactoryDataSet.Destroy;
begin

  inherited;
end;

class function TModelConexaoFactoryDataSet.New: iModelFactoryDataSet;
begin
  Result := Self.Create;
end;

end.
