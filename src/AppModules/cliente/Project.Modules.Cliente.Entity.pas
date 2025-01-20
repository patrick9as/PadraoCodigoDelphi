unit Project.Modules.Cliente.Entity;

interface

uses
  System.Generics.Collections;

type
  TClienteEntity = class
  private
    FCodigo: Integer;
    FNomeFantasia: string;
    FRazaoSocial: string;
    FDataCriacao: TDateTime;
    FXML: string;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property DataCriacao: TDateTime read FDataCriacao write FDataCriacao;
    property XML: string read FXML write FXML;
  end;

  TInsertClienteDTO = class
  private
    FNomeFantasia: string;
    FRazaoSocial: string;
    FXML: string;
  public
    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property XML: string read FXML write FXML;
  end;

  TGetAllClienteDTO = class
  private
    FCodigo: Integer;
    FNomeFantasia: string;
    FRazaoSocial: string;
    FDataCriacao: TDateTime;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property DataCriacao: TDateTime read FDataCriacao write FDataCriacao;
  end;

  IClienteDAO = interface
    function Insert(ACliente: TInsertClienteDTO): Integer;
    function GetAll(): TObjectList<TGetAllClienteDTO>;
    function GetByCodigo(ACodigo: Integer): TClienteEntity;
  end;

implementation

end.
