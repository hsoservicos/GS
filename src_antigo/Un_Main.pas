{
GENERAL SERVICE INFORMÁTICA LTDA
Rua José Higino 121, Madalena – Recife/PE
CGC:04.091.057/0001-02 – Insc. Mun: 314.279-5

}

unit Un_Main;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ExtCtrls, Menus, jpeg,
   StdCtrls, TLHelp32, XPMan;

type
  T_Main = class(TForm)
    mMenu: TMainMenu;
    pMenu: TPopupMenu;
    Tempo: TTimer;
    stb: TStatusBar;
    Cadastros1: TMenuItem;
    Areas1: TMenuItem;
    Clientes1: TMenuItem;
    Equipamentos1: TMenuItem;
    Situacoes1: TMenuItem;
    Funcionarios1: TMenuItem;
    Servicos1: TMenuItem;
    Registro1: TMenuItem;
    Sair1: TMenuItem;
    imgLogoGs: TImage;
    Servios1: TMenuItem;
    Clientes2: TMenuItem;
    Sair2: TMenuItem;
    Consultar1: TMenuItem;
    pnlRede: TPanel;
    Alterar1: TMenuItem;
    N1: TMenuItem;
    LeituradeNdeOs1: TMenuItem;
    Fechamento1: TMenuItem;
    Script1: TMenuItem;
    Configuraes1: TMenuItem;
    DadosnaOS1: TMenuItem;
    RecibodeEntrada1: TMenuItem;
    Panel1: TPanel;
    XPManifest1: TXPManifest;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Areas1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Equipamentos1Click(Sender: TObject);
    procedure Situacoes1Click(Sender: TObject);
    procedure Registro1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure Script1Click(Sender: TObject);
    procedure Fechamento1Click(Sender: TObject);
    procedure RecibodeEntrada1Click(Sender: TObject);
   private    { Private declarations }
      cBusca : String;
(*
      Mens : String;
      OldWidth, OldHeight: Integer;
      procedure SetScreenResolution(AWidth, AHeigth: Integer);
*)
   public     { Public declarations }
      cPath, nIP : String;
      cLocal, cUnid : String;
      stlCivil, stlFunc, stlClientes : TStringList;
      stlEquip, stlArea, stlSit : TStringList;
      Procedure ErrorMsg( Sender : TObject; E: exception );
      Procedure Rodape( Sender: TObject );
  end;

var
   _Main : T_Main;

implementation

uses
   Un_dm, Un_Areas, Un_Clientes, Un_UDF, Un_Equipamentos, Un_Situacoes, Un_Funcionarios, Un_Registro_Servico, Un_ConsultarServico,
   Un_Alterar_Servicos, Un_Movimentar_Servicos,
   un_fechamento_de_os, un_dados_do_recibo_de_entrada;

{$R *.dfm}
(*
procedure T_Main.SetScreenResolution(AWidth, AHeigth: Integer);
var
    DevMode: TDeviceMode;
    Hnd: THandle;
begin
    Hnd := GetDC(Handle);
    EnumDisplaySettings(nil, 0, DevMode);
    with DevMode do begin
        dmPelsWidth := AWidth;
        dmPelsHeight := AHeigth;
        dmBitsPerPel := GetDeviceCaps(Hnd, BITSPIXEL);
        dmDisplayFrequency := 60;
    end;
    ChangeDisplaySettings(DevMode, 0);
end;
*)
procedure T_Main.ErrorMsg( Sender : TObject; E : exception );
begin
   MessageDlg( E.Message +
               #13#13 +
               'Por favor entre em contato com o suporte técnico:'#13'HSO Serviços Técnicos'#13'Fones: (81) 3028.0800 / 8865.2556 / 9268.0142 / 9986.7396'#13'email: hsoservicos@oi.com.br'#13'Mensseger: hsoservicos@hotmail.com',
               mtError,
               [mbOK], 0 );
end;

Procedure T_Main.Rodape(Sender: TObject);
begin
   stb.Panels[0].Text := Application.Hint;
end;

procedure T_Main.FormCreate(Sender: TObject);
begin // Criação
(*
   if (Screen.Width <> 1440) and (Screen.Height <> 990) then begin
      OldWidth := Screen.Width;
      OldHeight := Screen.Height;
      Mens := 'Este programa foi construído numa resolução de vídeo' + #13;
      Mens := Mens + 'de 1440 X 990 Pixels e irá configurar a tela do seu monitor' + #13;
      Mens := Mens + 'para esta resolução. Ao final do programa,' + #13;
      Mens := Mens + 'a resolução atual retornará instantaneamente!' + #13;
      Mens := Mens + 'A resolução do seu monitor é ' + IntToStr(OldWidth) + ' x ' + IntToStr(OldHeight);
      MessageBox(Self.Handle, PChar(Mens),'Ajuste de Vídeo',MB_OK+MB_ICONWARNING);
//      SetScreenResolution(1440, 990);
   end;
*)
   Application.ProcessMessages;
   Application.OnException    := ErrorMsg;
   Application.OnHint         := Rodape;
   Application.HintColor      := $005BFFAD; // clSkyBlue; //
   Application.HintHidePause  := 100000;
   Application.HintPause      := 20; {Tempo de exibição do Hint}
   Application.HintShortPause := 1;  {Tempo para exibir o Hint}
   cLocal    := ExtractFilePath( Application.ExeName );
   cPath     := Copy( cLocal, 3, Length( cLocal ) - 2 );
   cUnid     := Copy( cLocal, 1, 1 );
   nIP       := GetIP;
   cBusca    := '';
   Formato_de_Data;
   If ( Not FileExists( _Main.cLocal + 'GS.INI' ) )  Then
   Begin
      GravarIni( _Main.cLocal + 'GS.INI', 'GERAL',           'Sistema',         'Sistema de Controle da General Service - em ADO' );
      GravarIni( _Main.cLocal + 'GS.INI', 'GERAL',           'Local',           cLocal );
      GravarIni( _Main.cLocal + 'GS.INI', 'GERAL',           'Versao',          '1.0.0.0' );
      GravarIni( _Main.cLocal + 'GS.INI', 'GERAL',           'Interno',         'GS.EXE' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Banco de Dados',  'Database',        'gs' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Banco de Dados',  'Servidor BD',     'Access' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Banco de Dados',  'Provider',        'Microsoft.Jet.OLEDB.4.0' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Banco de Dados',  'HostName',        nIP );
      GravarIni( _Main.cLocal + 'GS.INI', 'Banco de Dados',  'Pasta',           cPath ); // 'General Service'
      GravarIni( _Main.cLocal + 'GS.INI', 'Banco de Dados',  'BD',              'BD_GS.mdb' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Banco de Dados',  'Caminho na Rede', '' );
      GravarIni( _Main.cLocal + 'GS.INI', 'REGISTRO',        'Inicio',          DateToStr( Now ) );
      GravarIni( _Main.cLocal + 'GS.INI', 'DESENVOLVIMENTO', 'Empresa',         'HSO Serviços' );
      GravarIni( _Main.cLocal + 'GS.INI', 'DESENVOLVIMENTO', 'Desenvolvedor',   'Humberto Santos' );
      GravarIni( _Main.cLocal + 'GS.INI', 'DESENVOLVIMENTO', 'Contato',         '(81) 3028.0800 / 8865.2556 / 9268.0142 / 9986.7396' );
      GravarIni( _Main.cLocal + 'GS.INI', 'DESENVOLVIMENTO', 'Email',           'hsoservicos@oi.com.br' );
      GravarIni( _Main.cLocal + 'GS.INI', 'DESENVOLVIMENTO', 'Messenger',       'hsoservicos@hotmail.com' );
   End;
   If ( LerIni( _Main.cLocal + 'GS.INI', 'Numeracao', 'OS' ) = '' ) Then
   Begin
      GravarIni( _Main.cLocal + 'GS.INI', 'Numeracao', 'OS',         '1' );
   End;
   If ( LerIni( _Main.cLocal + 'GS.INI', 'Empresa', 'Nome' ) = '' ) Then
   Begin
      GravarIni( _Main.cLocal + 'GS.INI', 'Empresa', 'Nome',        'GENERAL SERVICE INFORMATICA LTDA' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Empresa', 'Endereco',    'Rua Manoel Bezerra,61' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Empresa', 'Bairro',      'Madalena' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Empresa', 'Cidade',      'Recife' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Empresa', 'Estado',      'PE' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Empresa', 'CEP',         '50610250' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Empresa', 'DDD',         '81' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Empresa', 'Fone #1',     '3088-4330' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Empresa', 'Fone #2',     '0' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Empresa', 'Fax',         '0' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Empresa', 'CNPJ',        '04.091.057/0001-02' );
      GravarIni( _Main.cLocal + 'GS.INI', 'Empresa', 'IM',          '314.279-5' );
   End;
   If ( LerIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 1' ) = '' ) Then GravarIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 1', 'Obs: Após ser aprovado o orçamento, favor retirar o equipamento no prazo de 07 (sete) dias.' );
   If ( LerIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 2' ) = '' ) Then GravarIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 2', 'Caso contrário será cobrada taxa de armazenamento de R$ 1,00 (dia).' );
   If ( LerIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 3' ) = '' ) Then GravarIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 3', 'O equipamento só será entregue mediante a Ordem de Serviço.' );
   If ( LerIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 4' ) = '' ) Then GravarIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 4', 'Garantia de 90 (noventa) dias para serviços executados, a partir do dia da entrega.' );
   If ( LerIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 5' ) = '' ) Then GravarIni( _Main.cLocal + 'GS.INI', 'Recibo Entrada', 'Linha 5', 'Perderá a garantia se o lacre da empresa for violado.' );
   pnlRede.Visible := False;
   _dm := T_dm.Create( Self );
   If Not _dm.gs.Connected Then
   Begin
      Application.Terminate;
   End;
   stlCivil    := TStringList.Create;
   stlFunc     := TStringList.Create;
   stlClientes := TStringList.Create;
   stlEquip    := TStringList.Create;
   stlArea     := TStringList.Create;
   stlSit      := TStringList.Create;
   stb.Panels[2].Text := DateTimeToStr( Now );
end;

procedure T_Main.FormShow(Sender: TObject);
begin // Abretura
   stb.Panels[2].Text := DateTimeToStr( Now );
end;

procedure T_Main.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   Case Key Of
      VK_ESCAPE : Close;
      VK_F2 :
      Begin
         _ConsultarServico := T_ConsultarServico.Create( Self );
         Try
            _ConsultarServico.ShowModal;
         Finally
            _ConsultarServico.Release;
            _ConsultarServico := Nil;
         End;
      End;
   End;
end;

procedure T_Main.Sair1Click(Sender: TObject);
begin
   Close;
end;

procedure T_Main.Areas1Click(Sender: TObject);
begin // Áreas
   _Areas := T_Areas.Create( Self );
   Try
      _Areas.ShowModal;
   Finally
      _Areas.Release;
      _Areas := Nil;
   End;
end;

procedure T_Main.Clientes1Click(Sender: TObject);
begin // Clientes
   _Clientes := T_Clientes.Create( Self );
   Try
      _Clientes.ShowModal;
   Finally
      _Clientes.Release;
      _Clientes := Nil;
   End;
end;

procedure T_Main.Equipamentos1Click(Sender: TObject);
begin // Equipamentos
   _Equipamentos := T_Equipamentos.Create( Self );
   Try
      _Equipamentos.ShowModal;
   Finally
      _Equipamentos.Release;
      _Equipamentos := Nil;
   End;
end;

procedure T_Main.Situacoes1Click(Sender: TObject);
begin // Situação
   _Situacoes := T_Situacoes.Create( Self );
   Try
      _Situacoes.ShowModal;
   Finally
      _Situacoes.Release;
      _Situacoes := Nil;
   End;
end;

procedure T_Main.Funcionarios1Click(Sender: TObject);
begin // Funcionários
   _Funcionarios := T_Funcionarios.Create( Self );
   Try
      _Funcionarios.ShowModal;
   Finally
      _Funcionarios.Release;
      _Funcionarios := Nil;
   End;
end;

procedure T_Main.Registro1Click(Sender: TObject);
begin // Serviços
   _Registro_Servico := T_Registro_Servico.Create( Self );
   Try
      _Registro_Servico.ShowModal;
   Finally
      _Registro_Servico.Release;
      _Registro_Servico := Nil;
   End;
end;

procedure T_Main.Alterar1Click(Sender: TObject);
begin // Alterar
   _Movimentar_Servicos := T_Movimentar_Servicos.Create( Self );
   Try
      _Movimentar_Servicos.ShowModal;
   Finally
      _Movimentar_Servicos.Release;
      _Movimentar_Servicos := Nil;
   End;
end;

procedure T_Main.Consultar1Click(Sender: TObject);
begin
   _ConsultarServico := T_ConsultarServico.Create( Self );
   Try
      _ConsultarServico.ShowModal;
   Finally
      _ConsultarServico.Release;
      _ConsultarServico := Nil;
   End;
end;

procedure T_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   If MessageDlg( 'Finalizar Sistema' + #13 + 'de Serviços da' + #13 + 'General Service ?', mtConfirmation, [ mbYes, mbNo ], 0  ) = mrNo Then
   Begin
      _dm.gs.Destroy;
      Abort;
   End;
end;

procedure T_Main.Script1Click(Sender: TObject);
begin // Carga de Scripts SQL.
{
   _cargas := T_cargas.Create( Self );
   Try
      _cargas.ShowModal;
   Finally
      _cargas.Release;
      _cargas.Destroy;
      _cargas := Nil;
   End; // }
end;

procedure T_Main.Fechamento1Click(Sender: TObject);
begin
   _fechamento_de_os := T_fechamento_de_os.Create( Self );
   Try
      _fechamento_de_os.ShowModal;
   Finally
      _fechamento_de_os.Release;
      _fechamento_de_os.Destroy;
      _fechamento_de_os := Nil;
   End;
end;

procedure T_Main.RecibodeEntrada1Click(Sender: TObject);
begin //
   Try
      _dados_do_recibo_de_entrada := T_dados_do_recibo_de_entrada.Create( Self );
      _dados_do_recibo_de_entrada.ShowModal;
   Finally
      _dados_do_recibo_de_entrada.Release;
      _dados_do_recibo_de_entrada.Destroy;
      _dados_do_recibo_de_entrada := Nil;
   End;
end;

end.
