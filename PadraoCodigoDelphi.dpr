program PadraoCodigoDelphi;

uses
  Vcl.Forms,
  Project.Modules.Cliente.Controller in 'src\AppModules\cliente\Project.Modules.Cliente.Controller.pas',
  Project.Modules.Cliente.DAO in 'src\AppModules\cliente\Project.Modules.Cliente.DAO.pas' {ClienteDAO: TDataModule},
  Project.Modules.Cliente.Entity in 'src\AppModules\cliente\Project.Modules.Cliente.Entity.pas',
  Project.Modules.Cliente.Module in 'src\AppModules\cliente\Project.Modules.Cliente.Module.pas',
  Project.Modules.Cliente.Repository in 'src\AppModules\cliente\Project.Modules.Cliente.Repository.pas' {ClienteRepository: TDataModule},
  Project.Modules.Cliente.View in 'src\AppModules\cliente\Project.Modules.Cliente.View.pas' {MainMenuView},
  Project.Modules.App.Repository in 'src\AppModules\Project.Modules.App.Repository.pas' {AppRepository: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClienteDAO, ClienteDAO);
  Application.CreateForm(TClienteRepository, ClienteRepository);
  Application.CreateForm(TMainMenuView, MainMenuView);
  Application.CreateForm(TAppRepository, AppRepository);
  Application.Run;
  ReportMemoryLeaksOnShutdown := True;
end.
