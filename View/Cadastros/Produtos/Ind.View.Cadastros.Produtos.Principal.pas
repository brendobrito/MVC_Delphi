unit Ind.View.Cadastros.Produtos.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.ListBox, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfrmCadastrosProdutos = class(TForm)
    Rectangle1: TRectangle;
    cbDepartamento: TComboBox;
    Rectangle2: TRectangle;
    lbDeparatemento: TLabel;
    cbSecao: TComboBox;
    lbSecao: TLabel;
    LbSetor: TLabel;
    cbSetor: TComboBox;
    cbSubsetor: TComboBox;
    lbSubsetor: TLabel;
    GridPanelLayout1: TGridPanelLayout;
    lytDepartamento: TLayout;
    lytSecao: TLayout;
    lytSetor: TLayout;
    lytSubsetor: TLayout;
    Line1: TLine;
    StyleBook1: TStyleBook;
    Line2: TLine;
    Line3: TLine;
    Line4: TLine;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    Rectangle3: TRectangle;
    Lbl_Btn_Fornecedor: TText;
    Img_Btn_Fornecedor: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastrosProdutos: TfrmCadastrosProdutos;

implementation

{$R *.fmx}

procedure TfrmCadastrosProdutos.FormCreate(Sender: TObject);
begin
//
end;

initialization
  RegisterFmxClasses([TfrmCadastrosProdutos]);
end.
