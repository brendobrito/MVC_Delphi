unit Delivery.Model.Connection.Interfaces;

interface

uses
  Data.DB, System.Classes, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Comp.Client;

type
  TTypeConnection = (tpFiredacMySQL, tpFiredacConfigs);

  iModelQuery = interface;
  iModelQuerySQL = interface;

  iModelConexao = interface
    ['{DFEF8A11-246E-4D60-ABD2-50867699AA3E}']
    function Connection: TCustomConnection;
    function Database(aValue: String): iModelConexao;
    function UserName(aValue: String): iModelConexao;
    function Password(aValue: String): iModelConexao;
    function DriverID(aValue: String): iModelConexao;
    function DriverName: string;
    function IP(aValue: String): iModelConexao;
    function Porta(aValue: Integer): iModelConexao;
    function AddParam(aValue: string): iModelConexao;
    function StartTransaction: iModelConexao;
    function Commit: iModelConexao;
    function Connect: iModelConexao;
    function Desconnect: iModelConexao;
    function RollBack: iModelConexao;
  end;

  iModelConexaoFactory = interface
    ['{D5383A0B-A7DB-42B8-BD59-538E7AF49850}']
    function Conexao: iModelConexao;
    function Query: iModelQuery;
    function TipoConexao: TTypeConnection; overload;
    function TipoConexao(aValue: TTypeConnection)
      : iModelConexaoFactory; overload;
  end;

  iModelQuery = interface
    ['{9D8E55AB-22E0-440D-A77F-820B8B7F6D5C}']
    function Query: TDataSet;
    function DataSet: TDataSet;
    function Open(aSQL: String): iModelQuery; overload;
    function Open: iModelQuery; overload;
    function ExecSQL(aSQL: String): integer; overload;
    function ExecSQL: iModelQuery; overload;
    function Fields: TFields;
    function ParamByName(aValue: string): TFDParam;
    function SQL: iModelQuerySQL;
    function Close: iModelQuery;
    function Connection(aValue: iModelConexao): iModelQuery; overload;
    function FieldByName(aValue: string): TField;
    function FetchOptions: TFDFetchOptions;
    function ClearSQL : iModelQuerySQL;
  end;

  iModelQuerySQL = interface
    ['{04456437-FFEF-438E-AF26-E8933BBA5CDD}']
    function Clear : iModelQuerySQL;
    function Add(value : string) : iModelQuerySQL;
    function Text : string; overload;
    function Text(value : string) : iModelQuery; overload;
    function &End : iModelQuery;
  end;

implementation

end.
