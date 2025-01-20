unit ClienteTest;

interface
uses
  DUnitX.TestFramework, System.Generics.Collections, System.SysUtils,
  Project.Modules.Cliente.Controller,
  Project.Modules.Cliente.Entity;
type

  [TestFixture]
  TMockDAO = class(TInterfacedObject, IClienteDAO)
  public
    function GetByCodigo(ACodigo: Integer): TClienteEntity;
    function Insert(ACliente: TInsertClienteDTO): Integer;
    function GetAll: TObjectList<TGetAllClienteDTO>;
  end;

  TClienteControllerTests = class
  private
    FMockDAO: IClienteDAO;
    FController: TClienteController;
  public
    [Setup]
    procedure Setup;

    [Teardown]
    procedure Teardown;

    [Test]
    procedure TestGetAll;

    [Test]
    procedure TestGetByCodigo;

    [Test]
    procedure TestInsert;
  end;

implementation

{ TClienteControllerTests }

procedure TClienteControllerTests.Setup;
begin
  FMockDAO := TMockDAO.Create;
  FController := TClienteController.Create(FMockDAO);
end;

procedure TClienteControllerTests.Teardown;
begin
  FController.Free;
end;

procedure TClienteControllerTests.TestGetAll;
var
  ClientesMock: TObjectList<TGetAllClienteDTO>;
begin
  ClientesMock := FController.GetAll;

  if not Assigned(ClientesMock) then
    raise Exception.Create('Lista não instanciada corretamente');

  if (ClientesMock.Count = 0) then
    raise Exception.Create('Nenhum cliente foi retornado');

  if (ClientesMock[0].NomeFantasia.Length = 0) then
    raise Exception.Create('Nome fantasia não encontrado');

  ClientesMock.Free;
end;

procedure TClienteControllerTests.TestGetByCodigo;
var
  Cliente: TClienteEntity;
begin
  Cliente := FController.GetByCodigo(1);

  if not Assigned(Cliente) then
    raise Exception.Create('Cliente não instanciado corretamente');

  if Cliente.Codigo = 0 then
    raise Exception.Create('Código inválido');

  if Cliente.NomeFantasia.Length = 0 then
    raise Exception.Create('Nome do cliente não pode ser vazio');
end;

procedure TClienteControllerTests.TestInsert;
var
  Cliente: TInsertClienteDTO;
  Codigo: Integer;
begin
  Cliente := TInsertClienteDTO.Create();
  Cliente.NomeFantasia := 'Patrick';
  Cliente.RazaoSocial := 'Patrick';
  Cliente.XML := '<xml>xmlTeste</xml>';
  Codigo := FController.Insert(Cliente);

  if Codigo = 0 then
    raise Exception.Create('Cliente não inserido corretamente');
end;

{ TMockDAO }

function TMockDAO.GetAll: TObjectList<TGetAllClienteDTO>;
var
  cliente: TGetAllClienteDTO;
  I: Integer;
begin
  Result := TObjectList<TGetAllClienteDTO>.Create();

  for I := 0 to 30 do
  begin

    cliente := TGetAllClienteDTO.Create();
    cliente.Codigo := I + 1;
    cliente.DataCriacao := Now();
    cliente.NomeFantasia := 'Patrick ' + (I + 1).ToString;
    cliente.RazaoSocial := 'Patrick ' + (I + 1).ToString;

    Result.Add(cliente);
  end;
end;

function TMockDAO.GetByCodigo(ACodigo: Integer): TClienteEntity;
begin

end;

function TMockDAO.Insert(ACliente: TInsertClienteDTO): Integer;
begin

end;


initialization
  TDUnitX.RegisterTestFixture(TClienteControllerTests);

end.
