object ClienteDAO: TClienteDAO
  OldCreateOrder = False
  Height = 150
  Width = 319
  object qryGetAll: TUniQuery
    Connection = AppDAO.UniConnection
    SQL.Strings = (
      
        'SELECT Codigo, NomeFantasia, RazaoSocial, DataCriacao FROM clien' +
        'tes')
    Left = 144
    Top = 48
    object qryGetAllCodigo: TIntegerField
      FieldName = 'Codigo'
      ReadOnly = True
      Required = True
    end
    object qryGetAllNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Required = True
      Size = 50
    end
    object qryGetAllRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Required = True
      Size = 50
    end
    object qryGetAllDataCriacao: TDateTimeField
      FieldName = 'DataCriacao'
      Required = True
    end
  end
  object tabClientes: TUniTable
    TableName = 'clientes'
    Connection = AppDAO.UniConnection
    Left = 48
    Top = 48
    object tabClientesCodigo: TIntegerField
      FieldName = 'Codigo'
      ReadOnly = True
      Required = True
    end
    object tabClientesNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Size = 50
    end
    object tabClientesRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 50
    end
    object tabClientesXML: TMemoField
      FieldName = 'XML'
      BlobType = ftMemo
    end
    object tabClientesDataCriacao: TDateTimeField
      FieldName = 'DataCriacao'
      Required = True
    end
  end
  object qryGetByCodigo: TUniQuery
    Connection = AppDAO.UniConnection
    SQL.Strings = (
      'SELECT * FROM clientes'
      'WHERE Codigo = :Codigo')
    Left = 216
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Codigo'
        ParamType = ptInput
        Value = nil
      end>
    object qryGetByCodigoCodigo: TIntegerField
      FieldName = 'Codigo'
      ReadOnly = True
      Required = True
    end
    object qryGetByCodigoNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Required = True
      Size = 50
    end
    object qryGetByCodigoRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Required = True
      Size = 50
    end
    object qryGetByCodigoXML: TMemoField
      FieldName = 'XML'
      BlobType = ftMemo
    end
    object qryGetByCodigoDataCriacao: TDateTimeField
      FieldName = 'DataCriacao'
      Required = True
    end
  end
end
