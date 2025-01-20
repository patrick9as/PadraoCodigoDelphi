program PadraoCodigoDelphi;

uses
  Vcl.Forms,
  Project.Modules.Cliente.Controller in 'src\AppModules\cliente\Project.Modules.Cliente.Controller.pas',
  Project.Modules.Cliente.DAO in 'src\AppModules\cliente\Project.Modules.Cliente.DAO.pas' {ClienteDAO: TDataModule},
  Project.Modules.Cliente.Entity in 'src\AppModules\cliente\Project.Modules.Cliente.Entity.pas',
  Project.Modules.Cliente.Module in 'src\AppModules\cliente\Project.Modules.Cliente.Module.pas',
  Project.Modules.Cliente.Menu.View in 'src\AppModules\cliente\Project.Modules.Cliente.Menu.View.pas' {ClienteMenuView},
  Project.Modules.App.DAO in 'src\AppModules\Project.Modules.App.DAO.pas' {AppDAO: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClienteDAO, ClienteDAO);
  Application.CreateForm(TClienteMenuView, ClienteMenuView);
  Application.CreateForm(TAppDAO, AppDAO);
  Application.Run;
  ReportMemoryLeaksOnShutdown := True;
end.
