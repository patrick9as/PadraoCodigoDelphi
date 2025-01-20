unit Project.Modules.Cliente.Menu.View;

interface

uses
  System.Generics.Collections,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Project.Modules.Cliente.Module,
  Vcl.StdCtrls, Project.Modules.Cliente.Entity, Data.DB, Datasnap.Provider,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids;

type
  TClienteMenuView = class(TForm)
    btnInserir: TButton;
    DBGrid1: TDBGrid;
    dtsClientes: TDataSource;
    cdsClientes: TClientDataSet;
    cdsClientesCodigo: TIntegerField;
    cdsClientesNomeFantasia: TStringField;
    cdsClientesRazaoSocial: TStringField;
    EdtCodigo: TEdit;
    EdtNomeFantasia: TEdit;
    EdtRazaoSocial: TEdit;
    EdtDataCriacao: TEdit;
    EdtXML: TEdit;
    btnDetalhar: TButton;
    btnBuscarTudo: TButton;
    btnAtualizar: TButton;
    procedure btnInserirClick(Sender: TObject);
    procedure btnBuscarTudoClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FClienteModule: TClienteModule;
  public
    { Public declarations }
  end;

var
  ClienteMenuView: TClienteMenuView;

implementation

{$R *.dfm}

procedure TClienteMenuView.btnBuscarTudoClick(Sender: TObject);
var
  clientes: TObjectList<TGetAllClienteDTO>;
  I: Integer;
begin
  clientes := FClienteModule.ClienteController.getAll();
  try
    cdsClientes.Close();
    cdsClientes.Open();
    for I := 0 to clientes.Count - 1 do
    begin
      cdsClientes.Append();
      cdsClientesCodigo.AsInteger := clientes[I].Codigo;
      cdsClientesNomeFantasia.AsString := clientes[I].NomeFantasia;
      cdsClientesRazaoSocial.AsString := clientes[I].RazaoSocial;
      cdsClientes.Post();
    end;
  finally
    clientes.Free();
  end;
end;

procedure TClienteMenuView.btnDetalharClick(Sender: TObject);
var
  Cliente: TClienteEntity;
begin
  Cliente := FClienteModule.ClienteController.getByCodigo(cdsClientesCodigo.AsInteger);
  try
    EdtCodigo.Text := Cliente.Codigo.ToString;
    EdtNomeFantasia.Text := Cliente.NomeFantasia;
    EdtRazaoSocial.Text := Cliente.RazaoSocial;
    EdtDataCriacao.Text := DateTimeToStr(Cliente.DataCriacao);
    EdtXML.Text := Cliente.XML;
  finally
    Cliente.Free();
  end;
end;

procedure TClienteMenuView.btnInserirClick(Sender: TObject);
var
  Cliente: TInsertClienteDTO;
begin
  Cliente := TInsertClienteDTO.Create();
  try
    Cliente.NomeFantasia := 'Teste';
    Cliente.RazaoSocial := 'Testee';
    Cliente.XML := '<xml>xml muito grande</xml>';

    FClienteModule.ClienteController.insert(Cliente);

  finally
    Cliente.Free();
  end;
end;

procedure TClienteMenuView.FormCreate(Sender: TObject);
begin
  FClienteModule := TClienteModule.Create();
end;

procedure TClienteMenuView.FormDestroy(Sender: TObject);
begin
  FClienteModule.Free();
end;

end.
