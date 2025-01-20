unit Project.Modules.App.DAO;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, Uni, UniProvider,
  SQLServerUniProvider;

type
  TAppDAO = class(TDataModule)
    UniConnection: TUniConnection;
    SQLServerUniProvider1: TSQLServerUniProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AppDAO: TAppDAO;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
