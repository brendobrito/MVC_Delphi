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
    ['{E2F0AC9B-79B3-4DAC-8991-D99F03AA4E8D}']
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
  ['{2C5A618E-1A69-441B-92E6-5BA65BA0CCF7}']
    function Conexao: iModelConexao;
    function Query: iModelQuery;
    function TipoConexao: TTypeConnection; overload;
    function TipoConexao(aValue: TTypeConnection)
      : iModelConexaoFactory; overload;
  end;

  iModelQuery = interface
   ['{2026F4BD-8BDC-437A-8E45-B88846057DFF}']
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
   ['{02135FC3-01A7-4D7F-8E59-7B4780A11EB0}']
    function Clear : iModelQuerySQL;
    function Add(value : string) : iModelQuerySQL;
    function Text : string; overload;
    function Text(value : string) : iModelQuery; overload;
    function &End : iModelQuery;
  end;

implementation

end.
