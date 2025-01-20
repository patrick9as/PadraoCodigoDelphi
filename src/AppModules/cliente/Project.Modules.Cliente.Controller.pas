unit Project.Modules.Cliente.Controller;

interface

uses
  System.Generics.Collections,
  Project.Modules.Cliente.DAO, Project.Modules.Cliente.Entity;

type
  TClienteController = class
  private
    FClienteDAO: IClienteDAO;
  public
    constructor Create(AClienteDAO: IClienteDAO);
    function Insert(ACliente: TInsertClienteDTO): Integer;
    function GetAll(): TObjectList<TGetAllClienteDTO>;
    function GetByCodigo(ACodigo: Integer): TClienteEntity;
  end;

implementation

{ TClienteController }

constructor TClienteController.Create(AClienteDAO: IClienteDAO);
begin
  FClienteDAO := AClienteDAO;
end;

function TClienteController.GetAll: TObjectList<TGetAllClienteDTO>;
begin
  Result := FClienteDAO.GetAll();
end;

function TClienteController.GetByCodigo(ACodigo: Integer): TClienteEntity;
begin
  Result := FClienteDAO.GetByCodigo(ACodigo);
end;

function TClienteController.Insert(ACliente: TInsertClienteDTO): Integer;
begin
  //Regras de negócio
  Result := FClienteDAO.Insert(ACliente);
end;

end.
