unit Ind.Model.Conexoes.Firedac.Table;

interface

uses Ind.Model.Conexoes.Interfaces, FireDAC.Comp.Client, System.Classes;

Type

  TModelConexoesFiredacTable = class(TInterfacedObject, iModelDataSet)
  private
    FTable: TFDTable;
  public
    constructor Create(Conexao: iModelConexao);
    destructor Destroy; override;
    class function New(Conexao: iModelConexao): iModelDataSet;
    function Open(aTable: String): iModelDataSet;
    function EndDataSet: TComponent;
  end;

implementation

{ TModelConexoesTableFiredac }

constructor TModelConexoesFiredacTable.Create(Conexao: iModelConexao);
begin
  FTable := TFDTable.Create(nil);
  FTable.Connection := (Conexao.EndConexao as TFDConnection);
end;

destructor TModelConexoesFiredacTable.Destroy;
begin
  FTable.Free;
  inherited;
end;

function TModelConexoesFiredacTable.EndDataSet: TComponent;
begin
  Result := FTable;
end;

class function TModelConexoesFiredacTable.New(Conexao: iModelConexao)
  : iModelDataSet;
begin
  Result := Self.Create(Conexao);
end;

function TModelConexoesFiredacTable.Open(aTable: String): iModelDataSet;
begin
  Result := Self;
  FTable.Open(aTable);
end;

end.
