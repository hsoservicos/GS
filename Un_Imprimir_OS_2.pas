unit Un_Imprimir_OS_2;

interface

uses
   Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, DB;

type
  T_Imprimir_OS_2 = class(TQuickRep)
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    lblNOs: TQRLabel;
    QRShape2: TQRShape;
    lblDataEmissao: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
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
    QRShape5: TQRShape;
    lblDado1: TQRLabel;
    lblDado2: TQRLabel;
    lblDado3: TQRLabel;
    lblDado4: TQRLabel;
    lblDado5: TQRLabel;
    lblRetornoNumero: TQRLabel;
    lblRetornoTexto: TQRLabel;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    lblClienteAssina: TQRLabel;
    lblDataCiente: TQRLabel;
    QRShape8: TQRShape;
    QRLabel10: TQRLabel;
    QRBand2: TQRBand;
    QRImage2: TQRImage;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape9: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape10: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape11: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape12: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape16: TQRShape;
    QRLabel42: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  private

  public
   nOs : String;
  end;

var
   _Imprimir_OS_2: T_Imprimir_OS_2;

implementation

uses Un_dm, Un_UDF, Un_Main;

{$R *.DFM}

procedure T_Imprimir_OS_2.QuickRepBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
Var
   cEquip, cArea : String;
begin
   // nOs :=
   _Imprimir_OS.ReportTitle := 'OS ' + lblNOs.Caption;
   _dm.qr10.Close;
   _dm.qr10.SQL.Text := 'select * from Servicos';
   _dm.qr10.Open;

   _dm.qr10.Locate( 'OS', lblNOs.Caption, [] );
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

//   lbl.Caption := x;
//   lbl.Caption := _dm.qr10.FieldByName( 's' ).AsString;

   lblDado1.Caption := LerIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 1' ); // 'Obs: Após ser aprovado o orçamento, favor retirar o equipamento no prazo de 07 (sete) dias.';
   lblDado2.Caption := LerIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 2' ); // 'Caso contrário será cobrada taxa de armazenamento de R$ 1,00 (dia).';
   lblDado3.Caption := LerIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 3' ); // 'O equipamento só será entregue mediante a Ordem de Serviço.';
   lblDado4.Caption := LerIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 4' ); // 'Garantia de 90 (noventa) dias para serviços executados, a partir do dia da entrega.';
   lblDado5.Caption := LerIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 5' ); // 'Perderá a garantia se o lacre da empresa for violado.';

end;

end.
