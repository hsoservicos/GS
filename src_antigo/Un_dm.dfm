object _dm: T_dm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 1225
  Top = 282
  Height = 440
  Width = 136
  object gs: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=BD_GS.mdb;Persist S' +
      'ecurity Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 22
    Top = 12
  end
  object qr01: TADOQuery
    Connection = gs
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from AREA order by Descricao')
    Left = 22
    Top = 70
  end
  object qr02: TADOQuery
    Connection = gs
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from CLIENTES order by NomeCliente')
    Left = 22
    Top = 114
    object qr02CodCliente: TAutoIncField
      FieldName = 'CodCliente'
      ReadOnly = True
    end
    object qr02NomeCliente: TWideStringField
      FieldName = 'NomeCliente'
      Size = 120
    end
    object qr02Endereco: TWideStringField
      FieldName = 'Endereco'
      Size = 120
    end
    object qr02Bairro: TWideStringField
      FieldName = 'Bairro'
      Size = 30
    end
    object qr02Cidade: TWideStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object qr02CEP: TWideStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qr02Fone1: TWideStringField
      FieldName = 'Fone1'
      Size = 9
    end
    object qr02Fone2: TWideStringField
      FieldName = 'Fone2'
      Size = 8
    end
    object qr02Fax: TWideStringField
      FieldName = 'Fax'
      Size = 8
    end
    object qr02Celular: TWideStringField
      FieldName = 'Celular'
      Size = 9
    end
    object qr02Obs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object qr02email: TWideStringField
      FieldName = 'e-mail'
      Size = 50
    end
  end
  object qr03: TADOQuery
    Connection = gs
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from [Tipo de equipamento] order by Descricao')
    Left = 22
    Top = 158
  end
  object qr04: TADOQuery
    Connection = gs
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Situacao order by Descricao')
    Left = 22
    Top = 202
  end
  object qr05: TADOQuery
    Connection = gs
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Funcionarios order by NomeCompleto')
    Left = 22
    Top = 246
  end
  object qr06: TADOQuery
    Connection = gs
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Servicos order by OS')
    Left = 22
    Top = 291
  end
  object qr07: TADOQuery
    Connection = gs
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Servicos order by OS')
    Left = 78
    Top = 70
    object qr07OS: TIntegerField
      FieldName = 'OS'
    end
    object qr07CodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object qr07Situacao: TIntegerField
      FieldName = 'Situacao'
    end
    object qr07Equipamento: TIntegerField
      FieldName = 'Equipamento'
    end
    object qr07Complemento: TWideStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object qr07NSerie: TWideStringField
      FieldName = 'NSerie'
      Size = 50
    end
    object qr07Defeito: TWideStringField
      FieldName = 'Defeito'
      Size = 100
    end
    object qr07DataEntrada: TDateTimeField
      FieldName = 'DataEntrada'
    end
    object qr07Executante: TIntegerField
      FieldName = 'Executante'
    end
    object qr07Tecnico: TIntegerField
      FieldName = 'Tecnico'
    end
    object qr07Pago: TBooleanField
      FieldName = 'Pago'
    end
    object qr07DataSaida: TDateTimeField
      FieldName = 'DataSaida'
    end
    object qr07ValorOrcamento: TBCDField
      FieldName = 'ValorOrcamento'
      Precision = 19
    end
    object qr07Valor: TBCDField
      FieldName = 'Valor'
      DisplayFormat = '##,##0.00'
      Precision = 19
    end
    object qr07PrevisaoPagamento: TDateTimeField
      FieldName = 'PrevisaoPagamento'
    end
    object qr07ServicoExecutado: TWideStringField
      FieldName = 'ServicoExecutado'
      Size = 120
    end
    object qr07Area: TIntegerField
      FieldName = 'Area'
    end
    object qr07Obs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object qr07Anterior: TIntegerField
      FieldName = 'Anterior'
    end
  end
  object qr08: TADOQuery
    Connection = gs
    Parameters = <>
    Left = 78
    Top = 114
  end
  object qr09: TADOQuery
    Connection = gs
    Parameters = <>
    Left = 78
    Top = 158
  end
  object qr10: TADOQuery
    Connection = gs
    Parameters = <>
    Left = 78
    Top = 202
  end
  object qr11: TADOQuery
    Connection = gs
    Parameters = <>
    Left = 78
    Top = 246
  end
  object qr12: TADOQuery
    Connection = gs
    Parameters = <>
    Left = 78
    Top = 291
  end
  object qrAux: TADOQuery
    Connection = gs
    CursorType = ctStatic
    Parameters = <>
    Left = 42
    Top = 344
  end
end
