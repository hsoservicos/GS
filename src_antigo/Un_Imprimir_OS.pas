unit Un_Imprimir_OS;

interface

uses
   Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, DB;

type
  T_Imprimir_OS = class(TQuickRep)
    TitleBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    lblNOs: TQRLabel;
    QRShape2: TQRShape;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    lblCodCliente: TQRLabel;
    lblNomeCliente: TQRLabel;
    lblEndereco: TQRLabel;
    lblComlemento1: TQRLabel;
    lblComlemento2: TQRLabel;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    lblAparelho: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    lblDefeito: TQRLabel;
    lblDataEmissao: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape4: TQRShape;
    lblClienteAssina: TQRLabel;
    QRShape5: TQRShape;
    lblDado1: TQRLabel;
    lblDado2: TQRLabel;
    lblDado3: TQRLabel;
    lblDado4: TQRLabel;
    lblDado5: TQRLabel;
    lblDataCiente: TQRLabel;
    QRShape6: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    lblRetornoNumero: TQRLabel;
    lblRetornoTexto: TQRLabel;
    QRLabel13: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private

  public
   nOs : String;
  end;

var
  _Imprimir_OS: T_Imprimir_OS;

implementation

uses Un_dm, Un_UDF, Un_Main;

{$R *.DFM}

procedure T_Imprimir_OS.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
Var
   cEquip, cArea : String;
begin
   _Imprimir_OS.ReportTitle := 'OS ' + lblNOs.Caption;
   _dm.qr10.Close;
   _dm.qr10.SQL.Text := 'select * from Servicos';
   _dm.qr10.Open;
   _dm.qr10.Locate( 'OS', nOs, [] ); // lblNOs.Caption

   lblDataEmissao.Caption := _dm.qr10.FieldByName( 'DataEntrada' ).AsString;
   lblDataCiente.Caption  := 'Data de Entrada: ' + _dm.qr10.FieldByName( 'DataEntrada' ).AsString + '.';

   lblCodCliente.Caption := _dm.qr10.FieldByName( 'CodCliente' ).AsString;

   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from Clientes';
   _dm.qr11.Open;
   _dm.qr11.Locate( 'CodCliente', _dm.qr10.FieldByName( 'CodCliente' ).AsString, [] );
   lblNomeCliente.Caption   := _dm.qr11.FieldByName( 'NomeCliente' ).AsString;
   lblClienteAssina.Caption := _dm.qr11.FieldByName( 'NomeCliente' ).AsString;
   lblEndereco.Caption      := _dm.qr11.FieldByName( 'Endereco' ).AsString;
   lblComlemento1.Caption   := _dm.qr11.FieldByName( 'Bairro' ).AsString + ' - ' +
                               _dm.qr11.FieldByName( 'Cidade' ).AsString + ' - ' +
                               _dm.qr11.FieldByName( 'CEP' ).AsString;
   lblComlemento2.Caption   := 'Fone(s): ' + _dm.qr11.FieldByName( 'Fone1' ).AsString +
                               Iif( _dm.qr11.FieldByName( 'Fone2' ).AsString, '', '', ', ' + _dm.qr11.FieldByName( 'Fone2' ).AsString ) +
                               Iif( _dm.qr11.FieldByName( 'Fax' ).AsString, '', '', ', ' + _dm.qr11.FieldByName( 'Fax' ).AsString ) +
                               Iif( _dm.qr11.FieldByName( 'Celular' ).AsString, '', '', ', ' + _dm.qr11.FieldByName( 'Celular' ).AsString ) +
                               Iif( _dm.qr11.FieldByName( 'e-mail' ).AsString, '', '', ', Email: ' + _dm.qr11.FieldByName( 'e-mail' ).AsString + '.' );

   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from [Tipo de equipamento]';
   _dm.qr11.Open;
   _dm.qr11.Locate( 'CodEquipamento', _dm.qr10.FieldByName( 'Equipamento' ).AsString, [] );
   cEquip := _dm.qr11.FieldByName( 'Descricao' ).AsString;
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from Area order by Descricao';
   _dm.qr11.Open;
   cArea := _dm.qr11.FieldByName( 'Descricao' ).AsString;;
   lblAparelho.Caption := '' + cEquip + ', ' +
                          _dm.qr10.FieldByName( 'Complemento' ).AsString + ', ' +
                          'Nº de Série: ' + _dm.qr10.FieldByName( 'NSerie' ).AsString + ', Área: ' + cArea;

   If _dm.qr10.FieldByName( 'Anterior' ).AsString <> '' Then
   Begin
      lblRetornoTexto.Caption  := 'Retorno da O.S.:';
      lblRetornoNumero.Caption := _dm.qr10.FieldByName( 'Anterior' ).AsString;
   End
   Else
   Begin
      lblRetornoTexto.Caption  := '';
      lblRetornoNumero.Caption := '';
   End;

   lblDefeito.Caption  := _dm.qr10.FieldByName( 'Defeito' ).AsString;

   _dm.qrAux.Close;
   _dm.qrAux.SQL.Text := 'select * from Funcionarios';
   _dm.qrAux.Open;
   _dm.qrAux.Locate( 'CodTecnicos', _dm.qr10.FieldByName( 'Tecnico' ).AsString, [] ); // lblNOs.Caption
   QRLabel13.Caption := _dm.qrAux.FieldByName( 'NomeCompleto' ).AsString;

//   lbl.Caption := x;
//   lbl.Caption := _dm.qr10.FieldByName( 's' ).AsString;

   lblDado1.Caption := LerIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 1' ); // 'Obs: Após ser aprovado o orçamento, favor retirar o equipamento no prazo de 07 (sete) dias.';
   lblDado2.Caption := LerIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 2' ); // 'Caso contrário será cobrada taxa de armazenamento de R$ 1,00 (dia).';
   lblDado3.Caption := LerIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 3' ); // 'O equipamento só será entregue mediante a Ordem de Serviço.';
   lblDado4.Caption := LerIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 4' ); // 'Garantia de 90 (noventa) dias para serviços executados, a partir do dia da entrega.';
   lblDado5.Caption := LerIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 5' ); // 'Perderá a garantia se o lacre da empresa for violado.';

end;

end.
