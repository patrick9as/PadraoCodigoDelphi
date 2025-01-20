unit Project.Modules.Cliente.DAO;

interface

uses
  System.Generics.Collections,
  System.SysUtils, System.Classes, Project.Modules.App.DAO, Uni,
  Data.DB, MemDS, DBAccess, Project.Modules.Cliente.Entity;

type
  TClienteDAO = class(TDataModule, IClienteDAO)
    qryGetAll: TUniQuery;
    tabClientes: TUniTable;
    tabClientesCodigo: TIntegerField;
    tabClientesNomeFantasia: TStringField;
    tabClientesRazaoSocial: TStringField;
    qryGetByCodigo: TUniQuery;
    tabClientesXML: TMemoField;
    tabClientesDataCriacao: TDateTimeField;
    qryGetAllCodigo: TIntegerField;
    qryGetAllNomeFantasia: TStringField;
    qryGetAllRazaoSocial: TStringField;
    qryGetAllDataCriacao: TDateTimeField;
    qryGetByCodigoCodigo: TIntegerField;
    qryGetByCodigoNomeFantasia: TStringField;
    qryGetByCodigoRazaoSocial: TStringField;
    qryGetByCodigoXML: TMemoField;
    qryGetByCodigoDataCriacao: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
    function Insert(ACliente: TInsertClienteDTO): Integer;
    function GetAll(): TObjectList<TGetAllClienteDTO>;
    function GetByCodigo(ACodigo: Integer): TClienteEntity;
  end;

var
  ClienteDAO: TClienteDAO;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TClienteRepository }

function TClienteDAO.GetAll: TObjectList<TGetAllClienteDTO>;
var
  cliente: TGetAllClienteDTO;
begin
  Result := TObjectList<TGetAllClienteDTO>.Create();

  qryGetAll.Close();
  qryGetAll.Open();

  qryGetAll.First();
  while not qryGetAll.Eof do
  begin
    cliente := TGetAllClienteDTO.Create();

    cliente.Codigo := qryGetAllCodigo.AsInteger;
    cliente.DataCriacao := qryGetAllDataCriacao.AsDateTime;
    cliente.NomeFantasia := qryGetAllNomeFantasia.AsString;
    cliente.RazaoSocial := qryGetAllRazaoSocial.AsString;

    Result.Add(cliente);

    qryGetAll.Next();
  end;
end;

function TClienteDAO.GetByCodigo(ACodigo: Integer): TClienteEntity;
begin
  qryGetByCodigo.Close();
  qryGetByCodigo.ParamByName('Codigo').AsInteger := ACodigo;
  qryGetByCodigo.Open();

  Result := TClienteEntity.Create();
  Result.Codigo := qryGetByCodigoCodigo.AsInteger;
  Result.NomeFantasia := qryGetByCodigoNomeFantasia.AsString;
  Result.RazaoSocial := qryGetByCodigoRazaoSocial.AsString;
  Result.DataCriacao := qryGetByCodigoDataCriacao.AsDateTime;
  Result.XML := qryGetByCodigoXML.AsString;
end;

function TClienteDAO.Insert(ACliente: TInsertClienteDTO): Integer;
begin
  tabClientes.Close();
  tabClientes.FilterSQL := '1 = -1';
  tabClientes.Open();
  tabClientes.Append();

  tabClientesNomeFantasia.AsString := ACliente.NomeFantasia;
  tabClientesRazaoSocial.AsString := ACliente.RazaoSocial;
  tabClientesXML.AsString := ACliente.XML;
  tabClientesDataCriacao.AsDateTime := Now();

  tabClientes.Post();
end;

end.
