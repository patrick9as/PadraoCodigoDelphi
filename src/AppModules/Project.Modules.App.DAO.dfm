object AppDAO: TAppDAO
  OldCreateOrder = False
  Height = 150
  Width = 215
  object UniConnection: TUniConnection
    ProviderName = 'sQL Server'
    Database = 'Teste'
    Username = 'sa'
    Server = '.'
    Connected = True
    Left = 88
    Top = 56
    EncryptedPassword = 
      'BFFFB8FF8CFF9DFF8DFF9EFF8CFF96FF93FFCEFFCDFFCFFFCEFFCFFFCAFFC6FF' +
      'CFFF'
  end
  object SQLServerUniProvider1: TSQLServerUniProvider
    Left = 96
    Top = 64
  end
end
