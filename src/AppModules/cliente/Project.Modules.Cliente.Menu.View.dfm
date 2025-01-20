object ClienteMenuView: TClienteMenuView
  Left = 0
  Top = 0
  Caption = 'ClienteMenuView'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnInserir: TButton
    Left = 552
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 0
    OnClick = btnInserirClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 132
    Width = 619
    Height = 159
    DataSource = dtsClientes
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeFantasia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RazaoSocial'
        Visible = True
      end>
  end
  object EdtCodigo: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'EdtCodigo'
  end
  object EdtNomeFantasia: TEdit
    Left = 135
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'EdtNomeFantasia'
  end
  object EdtRazaoSocial: TEdit
    Left = 262
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'EdtRazaoSocial'
  end
  object EdtDataCriacao: TEdit
    Left = 8
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'EdtDataCriacao'
  end
  object EdtXML: TEdit
    Left = 135
    Top = 35
    Width = 248
    Height = 21
    TabOrder = 6
    Text = 'EdtXML'
  end
  object btnDetalhar: TButton
    Left = 552
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Detalhar'
    TabOrder = 7
    OnClick = btnDetalharClick
  end
  object btnBuscarTudo: TButton
    Left = 552
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Buscar tudo'
    TabOrder = 8
    OnClick = btnBuscarTudoClick
  end
  object btnAtualizar: TButton
    Left = 552
    Top = 101
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    TabOrder = 9
  end
  object dtsClientes: TDataSource
    DataSet = cdsClientes
    Left = 312
    Top = 152
  end
  object cdsClientes: TClientDataSet
    PersistDataPacket.Data = {
      6A0000009619E0BD0100000018000000030000000000030000006A0006436F64
      69676F04000100000000000C4E6F6D6546616E74617369610100490000000100
      0557494454480200020014000B52617A616F536F6369616C0100490000000100
      0557494454480200020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 184
    object cdsClientesCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsClientesNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
    end
    object cdsClientesRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
    end
  end
end
