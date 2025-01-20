unit Project.Modules.Cliente.Module;

interface

uses
  System.Generics.Collections,
  Project.Modules.Cliente.Controller, Project.Modules.Cliente.DAO;

type
  TClienteModule = class
  private
    FClienteDAO: TClienteDAO;
    FClienteController: TClienteController;
  public
    constructor Create();
    destructor Free();
    property ClienteController: TClienteController read FClienteController write FClienteController;
  end;

implementation

{ TClienteModule }

constructor TClienteModule.Create;
begin
  FClienteDAO := TClienteDAO.Create(nil);
  FClienteController := TClienteController.Create(FClienteDAO);
end;

destructor TClienteModule.Free;
begin
  FClienteDAO.Free();
  FClienteController.Free();
end;

end.
