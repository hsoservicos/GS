object _Areas: T_Areas
  Left = 323
  Top = 461
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Manuten'#231#227'o de '#193'reas'
  ClientHeight = 221
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 0
    Width = 326
    Height = 112
    Caption = 'Panel1'
    TabOrder = 6
    object dbgAreas: TDBGrid
      Left = 1
      Top = 1
      Width = 324
      Height = 110
      Align = alClient
      Ctl3D = False
      DataSource = dsAreas
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = dbgAreasKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'Descricao'
          Visible = True
        end>
    end
  end
  object dbnAreas: TDBNavigator
    Left = 3
    Top = 114
    Width = 152
    Height = 30
    Cursor = crHandPoint
    DataSource = dsAreas
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Flat = True
    Hints.Strings = (
      'Primeiro registro'
      'Registro anterior'
      'Proximo registro'
      'Ultimo registro')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object btnSair: TBitBtn
    Left = 252
    Top = 189
    Width = 75
    Height = 30
    Hint = 'Finaliza o modulo.'
    Caption = 'Sair'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnSairClick
    Glyph.Data = {
      0E060000424D0E06000000000000360000002800000016000000160000000100
      180000000000D805000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F4F0F5F1EBFFFA
      F6FFFEF9FFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFF0000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFB6CFDF09528600
      35680F4A6D2C5B77436C845E81937B96A29AA9B0A8B2B6E2DBDAFFFFFFFFFFFF
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6F0F45489B01756922A699D156094
      0060AA1272CC0C71C30067B7005EAD0053A2004D91004988003B7C446D7EFFFF
      FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2E5EF00518500214A0520
      450138620F75B8288BD9298DD9278CD9258AD82589D72287D82789DC026DD42E
      647FFFFFFEFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1E4EE00538709
      2F591832570B426E147ABF2B90DB2990D72B91D7278DD3278DD4268DD4268FD6
      0F7CD4285F7EFFFFF7FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDE2EC
      004B810D2F571531560A43701780C52D92DD2B92D92D95DA278ED52991D7288F
      D72A92D61783D91C5A7EFFFBF0FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFCDDFED004181112E551331570945731C86CC3096E02E94D8349CDF2A91D82D
      94D82C93D92B92D81F8BE0155881FFF3E9FFFFFF0000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFCFE1EA00396A0D234C13345C0A4A78218BCF2D88CD2170AB318BC4
      2F95D9329ADD3298DB2E96DA2893E6115681FCEBE4FFFFFF0000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFC0C9D300481C0D302F0B1F4F0E4E82177FC2166FB90454
      9A1A5F932C8BCB37A0E4379CDE3297DA2E99EA0E5581F4E5DDFFFFFF0000FEFE
      FEFFFFFFFFFFFFD1DCD18EBA935B9C6C2CA13A4AA3500B31250543751477C13A
      8DCF3E93D41D65A12584C53EA5E63BA2E2349BDC35A0EE095588EADFD5FFFFFF
      0000FEFEFEFFFFFFBDD3BA339C390F981D2FBA3F6EDD8280E69357B15D116473
      1D7DD276ACDA83B0D53A8CC32D94D742A6E641A7E5369DDD3BA7F005568CE2D7
      CFFFFFFF0000FFFFFFD4E3D4229A260AB81E2ECC474CCE5A6DD67F87E69B75D5
      7D1C7C7E2A8EE34DA4E04C9DD549ADE8379FE23FA5E644ABE9349DE03FACF400
      5991D8D0C9FFFFFF0000FFFFFF64B46300A0001FA72A5BB461429C673AAD4D67
      CC711B603D0B568733A1EB33A4E933A9E745B8F2319EE341B0E745B5EC34A1DE
      3CB0F8005996CAC9C4FFFFFF0000FFFFFF169415329F34BFDEBDD3DEDB558EAF
      006723215E4300234E0758995FB4E2ACCCDEA8C4DCC0DCE0C1D7DDAAC1DFB2CB
      E0C6D6DDAFD9E600599FBEC1C1FFFFFF0000F0F8EF2D882FD5DDD4FFFFFFF2F8
      FF4B8AB600364A112B540A2F5E10679A77B5E2AEA0E7B4A2EE9E8FECB4A5ED82
      72EBBEB1EFC5B2F4F1EDE70059A1B6BBBCFFFFFF0000FAFCFAD3E3D3FFFFFFFF
      FFFFE9F4F9367DA600285916345C08315A18709E78B5E7766DEB9B96F88483F4
      9594F5746FF3C9CDF99791FFF8EEEB0062ABACB3B8FFFFFF0000FFFFFFFFFFFF
      FFFFFFFFFFFFE7F2F83075A1002C5715355A07315B1E77A57DB5EC695EE98A85
      F66E6AF2837EF4625EF08684FF9480D1B0BDC6006DB3A0ADB3FFFFFF0000FFFF
      FFFFFFFFFFFFFFFFFFFFE7F1F7306E9D012B5217355A09345B1B76AB98CDF1B1
      A7F19B98FDC0C0FAD9D8FAC2BEF5D9CCF2EEDCCB73CCF60672B694A5AEFFFFFF
      0000FFFFFFFFFFFFFFFFFFFFFFFFE6EFF5245F8E001A4305274C002A521B78B2
      B6DDE8FFFFD2FFFFDBFFFDDAFFF7DCEBF0E1D5E9EA91D4F357CBFF006EBD8097
      A0FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFEBF1F5507FA91759922B6A9C1759
      8D0F6DB23DADF735A2E71C92DF0281D50075CB006ABB0064AD005EA2015A960F
      5186BACCD5FFFFFF0000FFFFFFFFFFFFFFFFFFFEFEFEFEFDFBFFFFFFFFFFFFFF
      FFFFB3C9D900528E005A961F69984278A1668BAB719AB483AAC0A6C1D0C5D5DF
      E5EDF0FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFDFFFFFEFEFEFFFFFE
      FFFFFEFFFFFFFFFFFFF5F8F8F9F9F8FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF0000}
  end
  object gbDescricao: TGroupBox
    Left = 3
    Top = 144
    Width = 323
    Height = 43
    Caption = '[ Descri'#231#227'o da '#193'rea ]'
    TabOrder = 5
    object edtDescricao: TEdit
      Left = 4
      Top = 16
      Width = 315
      Height = 19
      Hint = 'Descri'#231#227'o de '#225'rea'
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 50
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
      OnExit = edtDescricaoExit
    end
  end
  object btnNova: TBitBtn
    Left = 4
    Top = 189
    Width = 75
    Height = 30
    Hint = 'Registra um nova '#225'rea.'
    Caption = 'Nova'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = btnNovaClick
    Glyph.Data = {
      0E060000424D0E06000000000000360000002800000016000000160000000100
      180000000000D8050000120B0000120B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
      FFFFFFFFF7F0E7DCB58CDFBC97DFBC97DFBC97DFBC97DFBC97DFBC97DFBC97DF
      BC96DFBC97DFBC97DFBC96DFBC96DFBC97DDB78EF4E8DCFFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFF1DECCFFE3D6FFFEFFFFFBFCFFF6F4FFF5F3FFF5F3FFF5F3
      FFF5F2FFF4F2FFF4F1FFF4F1FFF4F1FFF3F1FFF5F3FAE7DDE8D0B5FFFFFFFFFF
      FFFFFFFF0000FFFFFFFFFFFFDEDBC6A2AE85B1B289ACB081FFDDC5FFDBC2FFDA
      C0FFD8BDFFD7BBFFD6BBFFD6BAFFD5B9FFD4B7FFD4B5FFDCC5F8E6DCE9D2B8FF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFA4C9A600980307AD1B008300F9D9C5FF
      E0CCFFDEC6FFD9BFFFD9BEFFD8BDFFD7BCFFD6BAFFD6B9FFD4B6FFDCC5F8E7DD
      E9D2B8FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFB3CDB115B22A2ECC44089818
      FFDFD4FFEADDFFE6D5FFDDC4FFDCC3FFDBC2FFDAC2FFDABFFFD9BEFFD7BCFFDF
      CAF8E7DEE9D2B8FFFFFFFFFFFFFFFFFF00004C9B4F53A65838953D31C94C3BD7
      5921AF374A944148994377A161FFE6D4FFDEC8FFDDC7FFDDC6FFDCC4FFDBC3FF
      DBC0FFE1CDF8E8DFE9D2B8FFFFFFFFFFFFFFFFFF00001FA4344DF1794AEA724A
      E36E47E06A45E0693EE06437E46142973FFFE9DDFFE1CCFFE1CBFFDFC9FFDEC8
      FFDFC7FFDCC5FFE4D1F8E9DFE9D2B8FFFFFFFFFFFFFFFFFF000029AD4260FF95
      5BFB8C58F18454ED7E55F08050F27E4BF67D469C45FFECE1FFE4D1FFE3D0FFE2
      CDFFE2CDFFE0CCFFDFC9FFE5D4F8E9E0E9D2B8FFFFFFFFFFFFFFFFFF0000499C
      4E55AF613E9F4858F18867FF9A41D0664A9C4B4AA55071A464FFEDE2FFE6D5FF
      E4D4FFE5D2FFE4D1FFE3D0FFE2CEFFE7D8F8EAE1E9D2B8FFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFAEC9AB4AE77A6DFFA430BD51FFE5DEFFF4F0FFF2EAFFE9DA
      FFE9D9FFE8D7FFE7D6FFE6D5FFE6D4FFE4D2FFE9DCF8EAE2E9D2B8FFFFFFFFFF
      FFFFFFFF0000FFFFFFFFFFFFA3C8A437DE6959FF921DB440F3E6DBFFF4ECFFF0
      E6FFECDEFFEBDEFFEADCFFEADBFFE9DAFFE8D9FFE7D7FFECE0F8EBE2E9D2B7FF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFDAD9C38DA3739CB28A99B387FFF4ECFF
      F1E8FFF0E6FFEEE3FFEEE2FFEDE0FFECDFFFEBDEFFEBDDFFEADBFFEEE3F8ECE3
      E9D2B7FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFF2DFCDFEE8DDFFFEFEFFFAF7
      FFF3EBFFF2E9FFF1E8FFF1E7FFF1E7FFF0E4FFEEE3FFEEE2FFEEE1FFECE0FFF0
      E7F8ECE4E9D2B7FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFEEDECBF3E3D3FFFA
      F7FFF7F1FFF6EFFFF5EEFFF4EDFFF4ECFFF3EBFFF1E9FFF2E8FFF1E7FFEFE6FF
      EFE4FFF3EAF8ECE5E9D1B7FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFEEDECBF3
      E2D4FFFDFAFFF9F5FFF8F3FFF7F2FFF7F1FFF6F0FFF5EFFFF5EDFFF4ECFFF3EB
      FFF4ECFFF3ECFFF6F1F9EFE7E9D1B7FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
      EEDDCBF3E3D5FFFFFFFFFBFAFFFAF7FFFAF6FFF9F5FFF8F4FFF8F4FFF7F1FFF6
      F0FFF8F2FBEEE5F6E7DBF7EBE0F2E3D4E9D1B6FFFFFFFFFFFFFFFFFF0000FFFF
      FFFFFFFFEEDDCBF3E4D5FFFFFFFFFFFEFFFDFCFFFCFBFFFCFAFFFBF9FFFAF8FF
      F9F6FFF9F5FFFFFFD69F64ECB174EDB174CC8B46F9F3EDFFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFEEDDCBF3E4D6FFFFFFFFFFFFFFFFFFFFFEFFFFFFFEFFFDFD
      FFFDFDFFFCFAFFFBF9FFFFFFE0AE7AFFD3A0DEA569F7F1EBFFFFFFFFFFFFFFFF
      FFFFFFFF0000FFFFFFFFFFFFEEDDCBF5E8DCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1AF7ADFA467F5F0E9FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFEFDFCEDCB58CE6CCAFE5CAACE5CAACE5
      CAACE5CAACE5CAACE5CAACE5CAACE5CAACE8CFB5CB9153F7F0E8FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFCFAF8FCF9F6FCF9F6
      FCF9F6FCF9F6FCF9F6FCF9F6FCF9F6FCF9F6FCF9F6FCF9F6FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
  end
  object btnAlterar: TBitBtn
    Left = 80
    Top = 189
    Width = 75
    Height = 30
    Hint = 'Altera dados da '#225'rea.'
    Caption = 'Alterar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnAlterarClick
    Glyph.Data = {
      0E060000424D0E06000000000000360000002800000016000000160000000100
      180000000000D8050000120B0000120B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
      FFFFFFFFF7F0E7DCB58CDFBC97DFBC97DFBC97DFBC97DFBC97DFBC97DFBC97DF
      BC96DFBC97DFBC97DFBC96DFBC96DFBC97DDB78EF4E8DCFFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFEEDDCAF4DECDFFF9F9FFF6F4FFF6F4FFF5F3FFF5F3FFF5F3
      FFF5F2FFF4F2FFF4F1FFF4F1FFF4F1FFF3F1FFF5F3FAE7DDE8D0B5FFFFFFFFFF
      FFFFFFFF0000FFFFFFFFFFFFEEDECCF3DDCDFFDFC9FFDBC1FFDAC0FFD9C0FFD9
      BFFFD8BEFFD7BBFFD6BBFFD6BAFFD5B9FFD4B7FFD4B5FFDCC5F8E6DCE9D2B8FF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFEEDECCF3DDCDFFE1CCFFDCC4FFDBC3FF
      DBC2FFDBC2FFD9BFFFD9BEFFD8BDFFD7BCFFD6BAFFD6B9FFD4B6FFDCC5F8E7DD
      E9D2B8FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFEEDECCF3DECEFFE4D0FFDFC9
      FFE0C9FFDFC8FFDDC7FFDDC4FFDCC3FFDBC2FFDAC2FFDABFFFD9BEFFD7BCFFDF
      CAF8E7DEE9D2B8FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFEEDECCF3DFCFFFE6
      D4FFE3CEF5DBCCFFE3D0FFEBCDFFE5CAFFE0C8FFDDC7FFDDC6FFDCC4FFDBC3FF
      DBC0FFE1CDF8E8DFE9D2B8FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFEEDECCF3
      E0D0FFE9D9FFEED47887BB29488D6B78ABC4B6C1FADBC9FFEACDFFDFCAFFDEC8
      FFDFC7FFDCC5FFE4D1F8E9DFE9D2B8FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
      EEDECCF3E0D0FFEBDEFFEBD7DACED53848639CBCD07DACED4C81CC8C90BAFFF1
      D0FFE2CDFFE0CCFFDFC9FFE5D4F8E9E0E9D2B8FFFFFFFFFFFFFFFFFF0000FFFF
      FFFFFFFFEEDECCF3E0D0FFEDE1FFEBDBFFEBDA5A7EC5D8F8FFABEDFF95FFFF48
      B0E5898BB9FFF3D4FFE3D0FFE2CEFFE7D8F8EAE1E9D2B8FFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFEEDECCF3E0D1FFF0E6FFECDFFFF5DF7B8BC39BE0FC7DEFFF
      8EEFFF94FAFF38ACE58C8CBBFFF6D8FFE5D2FFE9DCF8EAE2E9D2B8FFFFFFFFFF
      FFFFFFFF0000FFFFFFFFFFFFEEDECCF3E1D1FFF2EAFFEFE4FFF3E3D3C6D3228F
      D799FAFF92EDFF96EEFF97F9FF27A6E58C90BFFFF4D9FFECE0F8EBE2E9D2B7FF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFEEDECBF3E2D2FFF6EEFFF1E8FFF0E6FF
      FBE89DA2C9349BDDA4FAFF9EEEFFA1EEFF9CFAFF189FE38D93C0FFFCE7F9ECE3
      E9D2B7FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFEEDECBF3E2D3FFF8F3FFF4EC
      FFF3EAFFF3E9FFFFED9099C82692DAB8FFFFABF0FFB1F0FFA6FAFF089BE28E97
      C9FFFDEEE9D2B8FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFEEDECBF3E3D3FFFA
      F7FFF7F1FFF6EFFFF5EEFFF4EDFFFFF0808EC62290DACCFFFFBFF3FFC5F4FFB8
      FFFF0098E4A5838AF2DDC4FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFEEDECBF3
      E2D4FFFDFAFFF9F5FFF8F3FFF7F2FFF7F1FFF6F0FFFFF57E8EC7218FD9E6FFFF
      DDFEFFCBDCDCB7886BF0C5B4CA9072FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
      EEDDCBF3E3D5FFFFFFFFFBFAFFFAF7FFFAF6FFF9F5FFF8F4FFF9F4FFFFF77C90
      C92F96DDD2F4F5C98261FFDCD1FFEBD9FBCCB8C38563FFFFFFFFFFFF0000FFFF
      FFFFFFFFEEDDCBF3E4D5FFFFFFFFFFFEFFFDFCFFFCFBFFFCFAFFFBF9FFFAF8FF
      FAF6FFFFFB7595D55E5B66FFCCBAFFEDD8A584AE0000CD0000B0C2B4C8FFFFFF
      0000FFFFFFFFFFFFEEDDCBF3E4D6FFFFFFFFFFFFFFFFFFFFFEFFFFFFFEFFFDFD
      FFFDFDFFFCFAFFFCFAFFFFFFC87F54FFE0D2CBB0C60000BF0000E5192EF80013
      B7FFFFFE0000FFFFFFFFFFFFEEDDCBF5E8DCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1AF78D2884C4631950000B94D60DD59
      ACFF1C39C0FFFFFF0000FFFFFFFFFFFFEFDFCEDCB58CE6CCAFE5CAACE5CAACE5
      CAACE5CAACE5CAACE5CAACE5CAACE5CAACE8CFB5CC9255FFFAEDB3878300009A
      A2D2FF002AC2C5C0E3FFFFFF0000FFFFFFFFFFFFFFFFFFFCFAF8FCF9F6FCF9F6
      FCF9F6FCF9F6FCF9F6FCF9F6FCF9F6FCF9F6FCF9F6FCF9F6FFFFFFFFFFFFFFFF
      FFE4E4F37775C6EFEBF5FFFFFFFFFFFF0000}
  end
  object btnExcluir: TBitBtn
    Left = 156
    Top = 189
    Width = 75
    Height = 30
    Hint = 'Exclus'#227'o de uma '#225'rea.'
    Caption = 'Excluir'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnExcluirClick
    Glyph.Data = {
      0E060000424D0E06000000000000360000002800000016000000160000000100
      180000000000D8050000120B0000120B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF4F4F3EFEEEDEAE9E8EA
      EAE8EBEAE9F1F1F0F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D5D2B0A49EB09F98B7A49DBCA69F
      C0A8A2C0A8A2BFA8A1B9A49EB4A19BA99A93BEB5B1F8F8F8FFFFFFFFFFFFFFFF
      FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFDBD9D6B8A49DEDD6D3EDD5D1E6CC
      C8E9D1CDD7BCB9D7BBB8DEC4C1E9D0CDE7CECAEED5D2DBC1BC9F9089FFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFCECAC7E2CFCAD9C1BFC1
      A4A2CDB3B0E6CFCBBA9B99BA9A98CDAFADE2CAC6BC9C9AC5A8A5E6CCC9AA9891
      FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFCFCBC8E3D2CE
      C3A8A6C2A7A6D2B9B6EAD4D0BD9E9CBC9D9BCFB1AEE3CBC7BD9D9BBB9B99D6BA
      B7AB9992FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFCFCA
      C7E6D7D4C8AEACC7ADABD5BFBBEEDAD6C0A3A1BC9E9BCFB1AEE3CBC7BD9D9CBC
      9C9BD7BBB9AB9A92FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
      FFFFCFCAC7E9DDD9CBB3B1C9B1AED9C3C0F1DFDCC2A8A5BEA39FCEB3B0E3CBC6
      BD9D9CBC9C9BD7BBB9AB9A92FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
      FFFFFFFFFFFFCEC9C6ECE1DECDB8B6CCB5B3DBC7C5F4E4E2C6ACAAC2A7A4D1B8
      B6E6CECBBD9E9BBC9C9AD7BBB9AB9A92FFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
      FFFFFFFFFFFFFFFFFFFFCEC9C5EFE6E2D3BFBDD0BBB9DECCCAF7E9E7C9B0AEC6
      ABA9D4BCBAE8D3D0BEA29EBC9C9BD7BBB8AB9A92FFFFFFFFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFFFFFFFFFFFFFCEC8C5F0EAE8D9C7C7D4C3C2E4D2D1FBEFED
      CBB4B3C8AFADD9C1BEEDD9D6C2A6A4BEA19FD8BBB9AB9992FFFFFFFFFFFFFFFF
      FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFCDC8C4F1EFEDDFCFCFDBCBCAE8DA
      D9FEF4F2D0BCBBCCB6B4DBC7C5F0DEDAC5AAA9C2A6A3DAC0BEAC9A94FFFFFFFF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFCDC8C4F2F0EFE5D8D8E1
      D3D2ECE0DFFFF9F7D8C4C3D2BFBDE0CECCF3E2E1C9AFADC5AAA8DEC6C3AD9D96
      FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFCEC9C5F7F5F5
      F0E5E5EADFDFF4ECEAFFFFFFE1D0CFDCCAC9E9D8D7F9ECEAD0B9B7CBB2B1E5CF
      CCB0A19AFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFC5BE
      BBCFCCC7CFC6C4CCC2BFD3CBC8DFDBD9C6B8B4C1B3AFCABDBAD6CBC7B8A5A2B3
      A09CC7B5B19D8E87FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFDF
      DDDBB4A39CDDCECAD2BFBAD0BBB6CEB7B2CBB4AECCB5AFCDB6B0CCB6B0CCB5B0
      CDB7B1CEB8B2CEB7B2C8B1ABA59993FFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
      FFFFFFC8C3C0EFE3E0FFFFFFF3DEDBF0DDDBEED8D6EBD5D1E9D1CDE6CECAE7CE
      CAE7CECAE7CECBE7CFCBE7CFCBEDD4D0AC9B94FFFFFFFFFFFFFFFFFF0000FFFF
      FFFFFFFFFFFFFFC9C3C0F1E9E8FFFFFFFDF9F8FAF2F0F8ECEBF5E8E6F1E1DFEE
      DCD9E8D3D0E6D1CDE6CFCCE6D0CCE6CECAECD3CFAC9C95FFFFFFFFFFFFFFFFFF
      0000FFFFFFFFFFFFFFFFFFD2CDCAD9D0CBFFFFFFFFFFFFFFFCFAFFF8F7FCF5F4
      FBF3F2F9F0EFF8EFEEF8ECEBF5E7E4F5E5E1F4E2DEEED7D4A4958DFFFFFFFFFF
      FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFBFB7B3B7ACA6D1C5C1E6DAD7F4E6
      E4FAEBEAFEEEEDFAE9E7F7E4E1E9D5D2DEC8C3CAB3AEB49E98A69892E6E4E3FF
      FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8E4E1DFD0
      CBC8C2BBB7BAB1ACB2A9A3B2A9A3B3A9A3BEB5B1C9C3BFD8D4D2F0F0EFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
  end
  object pnlCodArea: TPanel
    Left = 156
    Top = 114
    Width = 172
    Height = 30
    Caption = 'pnlCodArea'
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object dsAreas: TDataSource
    DataSet = _dm.qr01
    OnDataChange = dsAreasDataChange
    Left = 268
    Top = 62
  end
end
