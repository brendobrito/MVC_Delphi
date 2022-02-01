unit Ind.Model.Conexoes.Interfaces;

interface

uses
  System.Classes, Data.DB, Ind.Model.DataSet.Interfaces, FireDAC.Comp.Client,
  FireDAC.Stan.Option;

type
  iModelConexaoParametros = interface;
  iModelConexaoParams = interface;
  iQuery = interface;

  TChangeDataSet = procedure of Object;

  iModelConexao = interface
    ['{E8538D27-DFF2-4485-A303-616176681A93}']
    function Conectar : iModelConexao;
    function Connected : Boolean overload;
    function Connected(Value : Boolean) : iModelConexao overload;
    function EndConexao: TComponent;
    function Parametros: iModelConexaoParametros;
    function Params: iModelConexaoParams;
    function Ping: Boolean;
    function DriverName : String;
    function FDCon: TFDCustomConnection;
  end;

  iModelConexaoParametros = interface
    ['{69BA62BF-43C2-495B-8E0B-C5B6D509FFCB}']
    function Database(Value: String): iModelConexaoParametros;
    function UserName(Value: String): iModelConexaoParametros;
    function Password(Value: String): iModelConexaoParametros;
    function DriverID(Value: String): iModelConexaoParametros;
    function Server(Value: String): iModelConexaoParametros;
    function Porta(Value: Integer): iModelConexaoParametros;
    function EndParametros: iModelConexao;
  end;

  iModelConexaoParams = interface
    ['{69BA62BF-43C2-495B-8E0B-C5B6D509FFCB}']
     function Add(Value: String): iModelConexaoParams;
     function &End: iModelConexao;
  end;

  iModelDataSet = interface
    ['{5CFF1908-225F-4A05-A633-914A35BF2858}']
    function Open(aTable: String): iModelDataSet;
    function EndDataSet: TComponent;
  end;

  iModelFactoryConexao = interface
    ['{30C0A523-319F-46E8-97F5-F4C7B32BDF95}']
    function ConexaoFiredac : iModelConexao;
  end;

  iModelFactoryDataSet = interface
    ['{EA1766BB-437B-4133-95D5-73AF1EA851D7}']
    function DataSetFiredac(Conexao : iModelConexao) : iModelDataSet;
  end;

  iModelFactoryQuery = interface
   ['{E5F8F293-D07D-4157-B76F-6A5B6800566C}']
   function Query : iQuery;
  end;

  iQuery = interface
    ['{BA7F4622-7AA4-413D-B9CD-CADAB16DF714}']
    function FetchOptions : TFDFetchOptions;
    function Open(aSQL: String): iQuery;
    function Close : iQuery;
    function SQL : TStrings;
    function Params : TParams;
    function ParamByName(Value : String) : TParam;
    function ExecSQL : iQuery; overload;
    function ExecSQL(aSQL : String) : iQuery; overload;
    function DataSet : TDataSet; overload;
    function DataSet(Value : TDataSet) : iQuery; overload;
    function DataSource(Value : TDataSource) : iQuery;
    function Fields : TFields;
    function &End: TComponent;
    function Tag(Value : Integer) : iQuery;
    function LocalSQL(Value : TComponent) : iQuery;
    function UpdateTableName(Tabela : String) : iQuery;
    function Connection(Conexao: iModelConexao;
      ConexaoSecundaria: iModelConexao): iQuery; overload;
    function Connection(Conexao: iModelConexao): iQuery; overload;
    function FieldByName(Value : string): TField;

  end;

  iDriver = interface
    ['{F8F3E0E2-4333-40CD-8A4E-7B7790F2FA73}']
    function Conexao : iModelConexao;
    function Query : iQuery;
    function DataSet : iDataSet;
    function Cache : iDriverProxy;
    function LimitCacheRegister(Value : Integer) : iDriver;
    function FConnection(const value : TFDConnection) : iDriver overload;
  end;                                  //remover firedac alterar p/ iconexao


implementation

end.