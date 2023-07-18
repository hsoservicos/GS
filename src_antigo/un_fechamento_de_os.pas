unit un_fechamento_de_os;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, Buttons;

type
   T_fechamento_de_os = class(TForm)
    gbServico: TGroupBox;
    edtOs: TEdit;
    gbDadosServico: TGroupBox;
    lblSituacao: TLabel;
    lblTecnicos: TLabel;
    lblExecutante: TLabel;
    Label1: TLabel;
    cbSituacao: TComboBox;
    cbTecnico: TComboBox;
    cbExecutante: TComboBox;
    edtObs: TMemo;
    edtDataEntrada: TLabeledEdit;
    edtNumero: TLabeledEdit;
    gbDadosFechamento: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    cbSituacaoAtual: TComboBox;
    edtObservacoes: TMemo;
    edtSaida: TLabeledEdit;
    chkPago: TCheckBox;
    edtPrevisto: TLabeledEdit;
    edtPago: TLabeledEdit;
    edtServicoExecutado: TLabeledEdit;
    stb: TStatusBar;
    edtOrcamento: TLabeledEdit;
    btnFechar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtOsExit(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private    { Private declarations }
   Procedure Dados;
  public     { Public declarations }
  end;

var
   _fechamento_de_os: T_fechamento_de_os;

implementation

uses Un_dm, Un_Main, un_recibo_os, DB;

{$R *.dfm}

procedure T_fechamento_de_os.Dados;
begin
   edtObs.Clear;
   edtObservacoes.Clear;
   cbSituacaoAtual.Text := '';
   cbSituacaoAtual.ItemIndex := -1;
   gbDadosServico.Enabled := False;
   edtOs.Text := '';
end;

procedure T_fechamento_de_os.FormShow(Sender: TObject);
begin //
   Dados;
   _Main.stlFunc.Clear; // Técnicos e Executantes
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from Funcionarios Where Funcão = 1 order by Apelido';
   _dm.qr11.Open;
   cbTecnico.Text := '';
   cbTecnico.Clear;
   cbExecutante.Text := '';
   cbExecutante.Clear;
   While Not _dm.qr11.Eof Do
   Begin
      cbTecnico.Items.Add( _dm.qr11.FieldByName( 'Apelido' ).AsString );
      cbExecutante.Items.Add( _dm.qr11.FieldByName( 'Apelido' ).AsString );
      _Main.stlFunc.Add( _dm.qr11.FieldByName( 'CodTecnicos' ).AsString );
      _dm.qr11.Next;
   End;
   _Main.stlSit.Clear; // Situações
   _dm.qr11.Close;
   _dm.qr11.SQL.Text := 'select * from Situacao order by Descricao';
   _dm.qr11.Open;
   cbSituacao.Text := '';
   cbSituacao.Clear;
   While Not _dm.qr11.Eof Do
   Begin
      cbSituacao.Items.Add( _dm.qr11.FieldByName( 'Descricao' ).AsString );
      _Main.stlSit.Add( _dm.qr11.FieldByName( 'CodSituacao' ).AsString );
      cbSituacaoAtual.Items.Add( _dm.qr11.FieldByName( 'Descricao' ).AsString );
      _dm.qr11.Next;
   End;

   edtOs.SetFocus;
end;

procedure T_fechamento_de_os.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin //
   Case Key Of
      VK_ESCAPE :
      Begin
         Close;
      End;
      VK_RETURN :
      Begin
         Perform( WM_NEXTDLGCTL, 0, 0 );
         Key := 0;
      End;
   End;
end;

procedure T_fechamento_de_os.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//
end;

procedure T_fechamento_de_os.edtOsExit(Sender: TObject);
begin
   If edtOs.Text <> '' Then
   Begin
      _dm.qrAux.Close;
      _dm.qrAux.SQL.Text := 'select * from Servicos';
      _dm.qrAux.Open;
      If Not _dm.qrAux.Locate( 'OS', edtOs.Text, [] ) Then
      Begin
         MessageDlg( 'Nº de Ordem de Serviço'#13'não localizado na tabela.', mtInformation, [ mbOk ], 0 );
         edtOs.Text := '';
         edtOs.SetFocus;
         Exit;
      End
      Else
      Begin
         edtNumero.Text         := _dm.qrAux.FieldByName( 'OS' ).AsString;
         edtDataEntrada.Text    := _dm.qrAux.FieldByName( 'DataEntrada' ).AsString;
         edtOrcamento.Text      := _dm.qrAux.FieldByName( 'ValorOrcamento' ).AsString;
         cbTecnico.ItemIndex    := _Main.stlFunc.IndexOf( _dm.qrAux.FieldByName( 'Tecnico' ).AsString );
         cbExecutante.ItemIndex := _Main.stlFunc.IndexOf( _dm.qrAux.FieldByName( 'Executante' ).AsString );
         cbSituacao.ItemIndex   := _main.stlSit.IndexOf( _dm.qrAux.FieldByName( 'Situacao' ).AsString );
         edtObs.Text            := _dm.qrAux.FieldByName( 'Obs' ).AsString;
         edtObservacoes.Text    := _dm.qrAux.FieldByName( 'Obs' ).AsString;
      End;
   End;
end;

procedure T_fechamento_de_os.btnFecharClick(Sender: TObject);
begin
// Registrar e Imprimir Recibo de Saida com Garantia do Serviço executado.
   Dados;
   edtOs.SetFocus;
end;

end.
