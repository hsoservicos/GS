{
Unit de rotinas relacionadas a
Manipulação de dados e componentes

Data de Criação: 16/04/2003
}

unit un_funcoes;

interface

uses
   SysUtils, Windows, Classes, Forms, StdCtrls, ExtCtrls, Dialogs, ComCtrls, Graphics, Messages, Grids, IniFiles, ConvUtils, Winsock, Registry;

type
   DriveType = ( dtUnknown, dtNotExist, dtRemovable, dtFixed, dtRemote, dtCdRom, dtRamDisk, dtError );
   TVolInfo = record
   Name: string;
   Serial: Cardinal;
   IsCompressed: boolean;
   MaxCompLen: Cardinal;
   FileSysName: string;
end;

{ Manipulação de Strings }
function f_StrZero(iNumber : integer; iTam : integer) : string;   // retorna o valor completado de zeros a esquerda
function IsInteger(TestaString: String) : boolean;
function IsFloat(TestaString: String) : boolean;
function f_Trim(sStrn : string) : string;                         // tira os espaços da esquerda e da direita
function f_RTrim(sStrn : string) : string;                        // tira os espaços da direita
function f_LTrim(sStrn : string) : string;                        // tira os espaços da esquerda
function f_Right(sStrn: string; iTam: integer) : string;          // Retorna as últimas n letras de uma String
function f_Inverte(sStrn: string): string;                        // Inverte a string -> converte abcd em dcba
function f_FirstWord(sStrn: string): string;                      // retorna a primeira palavra da frase
function f_LastWord(sStrn: string): string;                       // retorna a última palavra da frase
function f_TemNaString(vString, sPalavra: String): Boolean; overload;  // verifica se a string possui a palavra
function f_TemNaString(vString, sPalavra: String;CaseSensitive:Boolean): Boolean; overload; // verifica se a string possui a palavra (com case sensitive)
function RemoveAcentos(Str:String):String;                        // remove os acentos de uma string
function f_SearchAndReplace(sSrc, sLookFor, sReplaceWith: string): string; // localiza um valor na string e substitui
function f_NomeProprio(Nome:String):String;                       // Retorna a String no Formato nome ex: luiz oscar = Luiz Oscar
function AbreviaNome(Nome: String): String;                       // Abrevia nomes próprios grandes
function f_RepeatStr(Valor: string; quantidade: integer): string; // repete uma string várias vezes.
function f_DefineBrancosCentro(Texto: string; EspacoTotal: integer): string;
function f_DefineBrancosEsquerda(Texto: string; EspacoTotal: integer): string;
function f_DefineBrancosDireita(Texto: string; EspacoTotal: integer): string;
function f_ApplyCharCase(Texto: string; CharCase: TEditCharCase): string;

{Manipulação de números}
function f_GetNumbers( sStrn : string ) : string; overload;           // retorna apenas os números de uma string
function f_GetNumbersInteger( sStrn : string ) : Integer;             // retorna apenas os números de uma string (Inteiro)
function f_GetNumbersFloat( sStrn : String ) : String;                // retorna os números de uma string em ponto flutuante
function f_GetNumbersFloatSQL( sStrn : String ) : String; overload;   // retorna o valor no formato SQL (. no lugar de ,)
function f_GetNumbersFloatSQL( Valor : Real ) : String; overload;     // retorna o valor no formato SQL (. no lugar de ,)
function f_GetNumbersReal( sStrn : String ) : Real;                   // retorna 0 se = '' e números negativos tbm
function f_GetNumbersRealSQL( Valor : String ) : String; overload;    // retorna o valor (inslusive negativo) no formato SQL (. no lugar de ,)
function f_GetNumbersRealSQL( Valor : Real ) : String; overload;      // retorna o valor no formato SQL (. no lugar de ,)
function f_ApenasNumeros( sStrn : string ) : Boolean;                 // retorna true se a string for um número
function BinToInt( Value : String ) : LongInt;                        // Converte um numero binário em Inteiro
function IntToBin( Value : LongInt; Size: Integer ) : String;         // Converte uma string em binário
function DecToBinStr( n : integer ) : string;                         // Converte um numero decimal em binário
function DecToRoman( Decimal : LongInt ): String;                     // Converte um numero decimal em algarismos romanos
function NumToHex( Num : Word ) : String;                             // Converte um numero em Hexadecimal
function GetMB( Tamanho : Integer ) : String;                         // retorna o valor em MB dos Bytes informado

{Manipulação de RichEdit}
procedure p_FormataMemo(RichEdit: TRichEdit; Valor: String; Estilo: TFontStyles); overload;
function f_GetLine(RichEdit: TRichEdit; Valor: String): integer;
procedure p_SubstituiMemo(Editor:TRichEdit;PalavraProcurada:String;PalavraSubstituta:String;EmTodoTexto:Boolean);

{ Manipulação de Data e Hora }
function f_CheckHora( sHora : string ): Boolean;                                         // checa hora no formato hh:mm
function f_CheckData( Data : string ): boolean;                                          // Checa data do tipo dd/mm/yyyy
function f_CheckDataAbr( Data : string ): Boolean;                                       // Checa data do tipo dd/mm/yy
function f_CheckDiaMes( sData : string ): Boolean;                                       // Checa Data do tipo dd/mm
function f_ComparaDataHora( DataInicial : String = '0'; DataFinal : String = '0'; HoraInicial : String = '0'; HoraFinal : String = '0' ) : Boolean;
function f_DataExt( Data : TDateTime ) : String;                                         // retorna a data em extenso
function f_MesPorExtenso( Mes : Integer ) : String;                                      // retorna o nome do mês
function f_DiaSemana( Data :TDateTime ) : String;                                        // retorna o dia da semana
function f_Idade( Data : TDateTime; ApenasAno : Boolean ) : String; overload;            // retorna a idade a partir de uma data
function f_Idade( StringData : String; ApenasAno: Boolean) : String; overload;           // retorna a idade a partir de uma data (string)
function f_StrToDate( Data : string ) : TDateTime;                                       // formata uma string -> data (igual ao strtodate)
function f_DateToStr( Formato : string; Data : TDateTime): String;                       // formata uma data -> String (igual ao datetostr)
function f_IsBissexto( AYear : Integer) : Boolean;                                       // retorna se um ano é bissexto
function f_DiasPorMes( AYear, AMonth : Integer): Integer;                                // retorna a quantidade de dias do mes
function PrimeiroDiaUtil( Data : TDateTime ) : TDateTime;                                // Retorna data do primeiro dia Util do mes, de uma data informada
function IsWeekEnd( dData : TDateTime ) : boolean;                                       // Verifica se uma data informada cai em um final de semana}
function f_DiasUteis( dataini, datafin : string ) : integer;                             // retorna a quantidade de dias úteis entre duas datas
function f_ParcelaData( Data : TDateTime; meses : Integer ) : TDateTime; overload;       // retorna a data nos meses seguintes ex: 01/07/2002,2 -> 01/09/2002
function f_ParcelaData( Data : TDateTime; Parcela, Intervalo : Integer) : TDateTime; overload;   // retorna a data nos meses seguintes ex: 01/07/2002,2 -> 01/09/2002
function f_InverteDate( Data : String ) : String;                                        // converte a data 01/02/2003 -> 02/01/2003 (usado para SQL)
function f_InverteDateMySQL( Data : String ) : String;                                   // converte a data 01/02/2003 -> 02/01/2003 (usado para SQL)
function f_FormataDataAbr( Data: string ) : string;
function f_FormataData( Data: string ) : string;
function f_MesAnterior( Data : TDateTime ) : TDateTime;

{ Conversões de valores }
function f_BoolToStr( Check: Boolean; TipoBanco: string) : String;                 // converte de booleano para String
function f_StrToBool( Valor : String; TipoBanco: string) : Boolean;                 // converte de string para booleano
Function FBoolToStr( Check : Boolean ) : String;                                 // Converte de Boolean para String
Function FStrToBool( Valor : string ) : Boolean;                                 // Converte de String para Boolean
function BoolToInt( Valor : Boolean ) : String;                                       // converte de booleano para inteiro
function IntToBool( Valor : String ) : Boolean;                                        // converte de inteiro para booleano
Function f_FontStyleToStr( Fonte : Tfont ) : String;                                 // converte de TFontStyle para String
Function f_StrToFontStyle( Estilo : String ) : TFontStyles;                            // converte de String para TFontStyle
function f_FormataCurrency( ValorString : String ) : String; overload;                 // converte o valor em string para o formato currency
function f_FormataFloat( ValorString : string ) : string; overload;
function f_FormataCurrency( ValorFloat : Real ) : String; overload;                    // converte o valor em ponto flutuante para o formato currency
function f_FormataFloat( ValorFloat : Real ) : String; overload;
function f_AceitaNulo( Valor : String ) : String;                                     // retorna 'null' se o valor for vazio
function f_AceitaDataNula( Valor : TDateTime; Formato, AspasData : String ) : String;  // retorna 'Null' se a data for vazia
function f_GetNamesInString( Frase : String ) : TStringList;                         // quebra uma string e adiciona em uma stringlist

{ Funções de Mensagens Genéricas }
function f_MensagemAviso( Mensagem : String ) : boolean;       // emite uma mensagem com o ícone de aviso
function f_MensagemErro( Mensagem : String ) : boolean;        // emite uma mensagem com o ícone de erro
function f_MensagemInformacao( Mensagem : String ) : boolean;  // emite uma mensagem com o ícone de informação
function f_MensagemConfirmacao( Mensagem : String ) : boolean; // retorna se o usuario clico em Sim ou Não na mensagem
function f_MensagemPergunta( Mensagem : String ) : integer;    // retorna o ID da pergunta ao usuário

{Funções de validação dos dados}
//procedure ValidaVazio( Edit :TmnEdit;var Resp:Boolean); overload;                                                   // emite a mensagem de EmptyMessage se o edit estiver vazio
//procedure ValidaVazio( Combo :TmnComboBox; var Resp:Boolean); overload;                                             // emite a mensagem de EmptyMessage se o combo estiver vazio
//procedure ValidaVazio( Edit :TmnEdit;var Resp:Boolean; Var Notebook : TNotebook;PageIndex :Integer); overload;      // emite a mensagem de EmptyMessage se o edit estiver vazio e seta o pageindex do tnotebook
//procedure ValidaVazio( Combo :TmnComboBox; var Resp:Boolean; Var Notebook : TNotebook;PageIndex :Integer); overload;// emite a mensagem de EmptyMessage se o combo estiver vazio e seta o pegeindex do tnotebook
//procedure ValidaConteudo( Edit :TmnEdit;var Resp:Boolean); overload;                                                // valida o edit de acordo com o EditType
//procedure ValidaConteudo( Edit :TmnEdit;var Resp:Boolean; Var Notebook : TNotebook;PageIndex :Integer); overload;   // valida o edit de acordo com o EditType e seta o pageindex do tnotebook
function ValidaMail( Texto : String ) : boolean;

{Funções adicionais}
//procedure p_CarregaEstados(Combo: TmnComboBox); // carrega a lista de estados brasileiros em um combo
function f_GetUF(Estado: String): String;       // retorna a UF do estado
function f_GetEstado(UF: string): string;       // retorna o estado da UF
function f_TiraAspas(Campo: String): String;    // remove as aspas do texto
function f_TrataAspas(Campo: String): String;   // substitui as aspas ('') por (``)
procedure P_AjustaAspas(Origem :Tmemo);         // remove as aspas do TMemo
procedure MouseCell(Grid: TStringGrid;  var Coluna, Linha: integer);
function f_TrataEndereco(Endereco, Bairro, Cidade, Estado, Cep, Pais: string): string;  // formata o endereço

{Criptografia}
function f_Encrypta(Texto : string) : string;                     // criptografa um texto sem senha
function f_Desencrypta(Texto : string) : string;                  // descriptografa um texto sem senha
function Trans(Ch: Char; k: Byte): Char;
function Decrypt(St: string; Ke: string): string;
function Crypt(St: string; Ke: string): string;
procedure Decode(Key:String;It: TStrings);
procedure Encode(Key:String;It: TStrings);
function EncodeStream(Key:String;Value: TStream): TStream;
function DecodeStream(Key:String;Value: TStream): TStream;

// > Tratando de Daos em arquivos .Ini <
Function GravarIni( cArquivo, cSecao, cIdentificador, cValor : String ) : Boolean;
Function LerIni( cArquivo, cSecao, cIdentificador : String ) : String;

Function Iif( cDado, cCheck, cValor1, cValor2 : String ) : String;
Procedure Formato_de_Data;

// > Unidade de Disco <
Function DriveLetters: string; { Retorna uma string contendo as letras de unidades de existentes }
Function SerialNum( FDrive : String ) : String;
Function VolInfo(const Drive: Char; Path: PChar): TVolInfo; { Retorna informações diversas sobre a unidade. Veja TVolInfo }
Function NomeComputador : String;

// Endereçamento da Rede
Function GetIP : string; //--> Declare a Winsock na clausula uses da unit

Function VerificaRegistro( cUnidade: String ): Boolean;
Function EncDecStr( StrValue : String; Chave: Word ) : String;

// Campos
Function ControlaCampoTexto( cDado : String ) : String;
Function CampoInforme( cDado : String ) : String;

// Formatação
Function FormataDATA( cDado : String ) : String;
Function FormataHora( cDado : String ) : String;
Function FormataCEP( cDado : String ) : String;
Function FormataFone( cDado : String ) : String;

// CPF e CNPJ
Function FCPF( xCPF : String ) : Boolean;
Function FCNPJ( xCNPJ : String ) : Boolean;
Function FCPFCNPJ( xDado : String ) : String;

Function Numero_de_Linhas_em_um_Arquivo_TXT( Arqtexto : String ) : integer;

// Funções de Conversão Lógica.
Function SToB( x : String ) : Boolean; // String para Boolean.
Function BToS( x : Boolean ) : String; // Boolean para String.

// Apoio Contabil:
Function FormataConta5( cDado : String ) : String;  // 1.1.01.01.00001
Function FormataConta6( cDado : String ) : String;  // 1.1.1.01.00001

Function extenso( valor : real ) : string;

// Compactação de Banco de Dados ACCESS
//Function Compacta_ADO( const sdbName : WideString ) : boolean;

implementation

Const
Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
MoedaSigular = 'Real';
MoedaPlural = 'Reais';
CentSingular = 'Centavo';
CentPlural = 'Centavos';
Zero = 'Zero';

{ Troca todos os espaços em branco por zero }
function f_StrZero(iNumber : integer; iTam : integer) : string;
var
   iPosBranco : integer;
begin
   str(iNumber:iTam,result);
   // Procura por branco nesta string e guarda a posição
   iPosBranco := Pos(' ',result);
   while iPosBranco > 0 do
   begin
      // Deleta da string a posição do espaço em branco
      Delete(result,iPosBranco,1);
      // Insere zero na posicao em branco na string
      Insert('0',result,iPosBranco);
      // manda procurar de novo, senao encontrar retorna o valor zero
      iPosBranco := Pos(' ',result);
   end;
end;

Function IsInteger( TestaString: String ) : boolean;
begin
   Result := True;
   try
      StrToInt( TestaString );
   except
   On EConvertError do
      Result := False;
   end;
end;

function IsFloat( TestaString : String ) : boolean;
begin
   Result := True;
   try
      StrToFloat( TestaString );
   except
   On EConvertError do
      Result := False;
   end;
end;

{ Remove todos os espaços em branco da String }
function f_Trim( sStrn : string ) : string;
begin
   result := f_RTrim( f_LTrim( sStrn ) );
end;

{ Remove todos os espaços em branco que estiverem a direita da String }
function f_RTrim(sStrn : string) : string;
var
   i : Integer;
begin
   for i := length(sStrn) downto 1 do
      if sStrn[i] = ' ' then
         Delete(sStrn, i, 1)
      else
         Break;
   result := sStrn;
end;

{ Remove todos os espaços em branco que estiverem a esquerda da String }
function f_LTrim(sStrn : string) : string;
var
   i : Integer;
begin
   for i := 1 to length(sStrn) do
      if sStrn[i] = ' ' then
         Delete(sStrn, i, 1)
      else
         Break;
   result := sStrn;
end;

{ Faz a encriptação de uma String }
function f_Encrypta(Texto : string) : string;
var
   TextoString : string;
   Tamanho, i : integer;
begin
   {A diferença entre Texto e TextoString é que
    Texto = CT_Senha.Text
    TextoString = É uma variável declarada como string}
   TextoString := Texto;
   Tamanho := length(TextoString);
   result := '';
   For i := 1 to Tamanho do
      result := result + Chr(Ord(Texto[i])+1);
end;

{ Desencripta uma String }
function f_Desencrypta(Texto : string) : string;
var
   TextoString : string;
   Tamanho, i : integer;
begin
   {A diferença entre Texto e TextoString é que
    Texto = CT_Senha.Text
    TextoString = É uma variável declarada como string}
   TextoString := Texto;
   Tamanho := length(TextoString);
   result := '';
   For i := 1 to Tamanho do
      result := result + Chr(Ord(Texto[i])-1);
end;

{ Retorna as últimas n letras de uma String }
function f_Right(sStrn: string; iTam: integer) : string;
begin
   result:= copy(sStrn,length(sStrn)-iTam+1,iTam);
end;

{ Inverte uma String }
function f_Inverte(sStrn : string) : string;
var
   i: integer;
   c: string;
begin
   c := '';
   for i := Length(sStrn) downto 1 do
   begin
      c := c + Copy(sStrn, i, 1);
   end;
   Result := c;
end;

{ Retorna a primeira palavra da String }
function f_FirstWord(sStrn: string): string;
var
   i: integer;
   s: string;
begin
   s := '';
   for i := 1 to Length(sStrn) do
   begin
      if Copy (sStrn, i, 1) <> ' ' then
         s := s + Copy (sStrn, i, 1)
      else
         break;
   end;
   Result := s;
end;

{Trata as aspas indevidas}
function f_TiraAspas(Campo: String): String;
var
   I : Integer;
   Aux : String;
begin
   for I:= 1 to Length(Campo) do
      if (Campo[I]<> '"') and (Campo[I]<> '''') then
         Aux := Aux + Campo[I];
   Result := Aux;
end;

function f_TrataAspas(Campo: String): String;
var
   lTexto: string;
begin
   //	lTexto := f_SearchAndReplace(Campo, '`' , '´');
   lTexto := f_SearchAndReplace(Campo, '''', '´');
   Result := lTexto;
end;

procedure P_AjustaAspas(Origem :Tmemo); overload;
Var
   Auxiliar:Integer;
begin
   Auxiliar := origem.SelStart;
   Origem.Text := f_TiraAspas(Origem.Text);
   Origem.SelStart := length(Origem.Text);
   Origem.SelStart := Auxiliar;
end;

{ Retorna a última palavra da String }
function f_LastWord(sStrn: string): string;
var
   i: integer;
   s: string;
begin
   s := '';
   for i := Length(sStrn) downto 1 do
   begin
      if Copy (sStrn, i, 1) <> ' ' then
         s := s + Copy (sStrn, i, 1)
      else
         break;
   end;
   Result := f_Inverte(s);
end;

{ Captura apenas os números de uma String }
function f_GetNumbers(sStrn: String): String;
var
   i: integer;
   sResult, sLetra: String;
begin
   for i := 1 to Length(sStrn) do
   begin
      sLetra := Copy(sStrn, i, 1);
      if (sLetra > Chr(47)) and (sLetra < Chr(58)) then
         sResult := sResult + sLetra;
   end;
   Result := sResult;
end;

function f_GetNumbersInteger(sStrn: string):Integer;
begin
   if f_GetNumbers(sStrn) = '' then
      Result := 0
   else
      Result := StrToInt(f_GetNumbers(sStrn));
end;

//Pega numeros e numeros Reais//
function f_GetNumbersFloat( sStrn : String ) : String;
var
   i : integer;
   sResult, sLetra : String;
   Achou : boolean;
begin
   Achou := False;
   If sStrn = '' Then
      sResult := 'Null'
   Else
      for i := 1 to Length( sStrn ) do
      begin
         sLetra := Copy( sStrn, i, 1 );
         if ( sLetra > Chr( 47 ) ) and ( sLetra < Chr( 58 ) )   then
            sResult := sResult + sLetra;
         if ( sLetra = '.' ) then
            sResult := sResult + '';
         if ( sLetra = ',' ) and ( achou = false ) then
         begin
            sResult := sResult + '.';
            Achou := true;
         end;
      end;
   Result := sResult;
end;

{$WARNINGS OFF}
function f_GetNumbersReal(sStrn: String): Real;
var
   i: integer;
   sResult, sLetra: String;
   Achou,Negativo:boolean;
begin
   Achou := False;
   for i := 1 to Length(sStrn) do
   begin
      sLetra := Copy(sStrn, i, 1);
      if (sLetra > Chr(47)) and (sLetra < Chr(58))   then
         sResult := sResult + sLetra;
      if (sLetra = '-') or (sLetra = '(') then
         Negativo := True;
      if (sLetra = '.') then
         sResult := sResult + '';
      if (sLetra = ',') and (achou = false) then
      begin
         sResult := sResult + ',';
         Achou := true;
      end;
   end;
   if (Trim(sResult) = '') then
      sResult := '0';
   if Negativo then
      Result := StrToFloat(sResult)*-1
   else
      Result := StrToFloat(sResult);
end;

function f_GetNumbersRealSQL(Valor : String) : String;
begin
   Result := f_SearchAndReplace(FloatToStr(f_GetNumbersReal(Valor)),',','.');
end;

function f_GetNumbersRealSQL(Valor: Real): String;
begin
   Result := f_SearchAndReplace(FloatToStr(Valor),',','.');
end;

function f_GetNumbersFloatSQL(sStrn: String): String;
var
   i: integer;
   sResult, sLetra: String;
   Achou:boolean;
begin
   Achou := False;
   for i := 1 to Length(sStrn) do
   begin
      sLetra := Copy(sStrn, i, 1);
      if (sLetra > Chr(47)) and (sLetra < Chr(58))   then
         sResult := sResult + sLetra;
      if (sLetra = '.') then
         sResult := sResult + '';
      if (sLetra = ',') and (achou = false) then
      begin
         sResult := sResult + '.';
         Achou := true;
      end;
   end;
   if (Trim(sResult) = '') then
      sResult := '0';
   Result := sResult;
end;

function f_GetNumbersFloatSQL(Valor: Real): String; overload;   // retorna o valor no formato SQL (. no lugar de ,)
var
   i: integer;
   sResult,sStrn, sLetra: String;
   Achou:boolean;
begin
   sStrn := FloatToStr(Valor);
   Achou := False;
   for i := 1 to Length(sStrn) do
   begin
      sLetra := Copy(sStrn, i, 1);
      if (sLetra > Chr(47)) and (sLetra < Chr(58))   then
         sResult := sResult + sLetra;
      if (sLetra = '.') then
         sResult := sResult + '';
      if (sLetra = ',') and (achou = false) then
      begin
         sResult := sResult + '.';
         Achou := true;
      end;
   end;
   if (Trim(sResult) = '') then
      sResult := '0';
   Result := sResult;
end;

function f_ApenasNumeros(sStrn: string): Boolean;
begin
   Result := True;
   if Length(sStrn) <> Length(f_GetNumbers(sStrn)) then
      Result := False;
end;

{Converte um numero binário em Inteiro}
function BinToInt( Value : String ) : LongInt;
var
   i, Size : Integer;
begin
   Result := 0;
   Size   := Length( Value );
   for i := Size downto 0 do
   begin
      if Copy( Value, i, 1 ) = '1' then
      begin
         Result := Result + ( 1 shl i );
      end;
   end;
end;

{Converte uma string em binário}
function IntToBin( Value : LongInt; Size : Integer ) : String;
var
  i : Integer;
begin
   Result := '';
   for i := Size downto 0 do
   begin
      if Value and ( 1 shl i ) <> 0 then
      begin
         Result := Result + '1';
      end
      else
      begin
         Result := Result + '0';
      end;
   end;
end;

{Converte um numero decimal em binário}
function DecToBinStr( n: integer ) : string;
var
   S : string;
   i : integer;
   Negative : boolean;
begin
   if n < 0 then
   begin
      Negative := true;
   end;
   n := Abs( n );
   for i := 1 to SizeOf( n ) * 8 do
   begin
      if n < 0 then
      begin
         S := S + '1';
      end
      else
      begin
         S := S + '0';
      end;
      n := n shl 1;
   end;
   Delete( S, 1, Pos( '1', S ) - 1 );//remove leading zeros
   if Negative then
   begin
      S := '-' + S;
   end;
   Result := S;
end;

{Converte um numero decimal em algarismos romanos}
function DecToRoman( Decimal: LongInt ): String;
const
   Romans : Array[1..13] of String = ( 'I', 'IV', 'V', 'IX', 'X', 'XL', 'L', 'XC', 'C', 'CD', 'D', 'CM', 'M' );
   Arabics : Array[1..13] of Integer = ( 1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000 );
var
   i : Integer;
   scratch : String;
begin
   scratch := '';
   for i := 13 downto 1 do
      while ( Decimal >= Arabics[ i ] ) do
      begin
         Decimal := Decimal - Arabics[ i ];
         scratch := scratch + Romans[ i ];
      end;
   Result := scratch;
end;

//Converte um numero em Hexadecimal
function NumToHex( Num : Word ) : String;
Var
   L : string[16];
   BHi, BLo : byte;
Begin
   L := '0123456789ABCDEF';
   BHi := Hi( Num );
   BLo := Lo( Num );
   result := copy( L, succ( BHi shr 4 ), 1 ) +
   copy( L, succ( BHi and 15 ), 1 ) +
   copy( L, succ( BLo shr  4 ), 1 ) +
   copy( L, succ( BLo and 15 ), 1 );
end;

function GetMB( Tamanho : Integer ) : String;
Var
   Aux : String;
begin
   if ( Tamanho > 1024 ) then
      if ( Tamanho > 1048576 ) then
         Aux := FormatFloat( '0.00', Tamanho / 1048576 ) + ' MB'
      else
         Aux := FormatFloat( '0.00', Tamanho / 1024 ) + ' KB'
   else
      Aux := IntToStr( Tamanho ) + ' Bytes';
   Result := Aux;
end;

function f_TemNaString( vString, sPalavra : String ) : Boolean;
var
   i: integer;
   Resultado: Boolean;
begin
   Resultado := False;
   for i:= 1 to Length(sPalavra) do
   begin
      if Copy(sPalavra, i, Length(vString)) = vString then
         Resultado := True;
   end;
   Result := Resultado;
end;

function f_TemNaString( vString, sPalavra : String; CaseSensitive : Boolean ) : Boolean;
var
   i: integer;
   Resultado: Boolean;
begin
   Resultado := False;
   for i:= 1 to Length(sPalavra) do
   begin
      if CaseSensitive then
      begin
         if Copy(sPalavra, i, Length(vString)) = vString then
            Resultado := True;
      end
      else
      begin
         if Copy(AnsiUpperCase(sPalavra), i, Length(vString)) = AnsiUpperCase(vString) then
            Resultado := True;
      end
   end;
   Result := Resultado;
end;

function RemoveAcentos( Str : String ) : String;                        // remove os acentos de uma string
Const
   ComAcento = 'àâãáêéíõôóúûüçÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
   SemAcento = 'aaaaeeiooouuucAAEOUAOAEIOUCU';
Var
   x : Integer;
Begin
   For x := 1 to Length(Str) do
      if Pos(Str[x],ComAcento)<>0 Then
         Str[x] := SemAcento[Pos(Str[x],ComAcento)];
   Result := Str;
end;

{ Procura por uma palavra dentro de uma String e substitui por outra no lugar }
function f_SearchAndReplace(sSrc, sLookFor, sReplaceWith: string): string;
var
   nPos, nLenLookFor : integer;
begin
   nPos        := Pos( sLookFor, sSrc );
   nLenLookFor := Length( sLookFor );
   while(nPos > 0)do
   begin
      Delete( sSrc, nPos, nLenLookFor );
      Insert( sReplaceWith, sSrc, nPos );
      nPos := Pos( sLookFor, sSrc );
   end;
   Result := sSrc;
end;

// Formata a lentra de RichEdit//
procedure p_FormataMemo(RichEdit: TRichEdit; Valor: String; Estilo: TFontStyles);
begin
   RichEdit.SetFocus;
   RichEdit.SelStart := RichEdit.FindText(Valor, 0, Length(RichEdit.Lines.Text), []);
   RichEdit.SelLength := Length(Valor);
   RichEdit.SelAttributes.Style := Estilo;
   RichEdit.SetFocus;
   RichEdit.SelStart := 0;
   RichEdit.SelLength := 0;
   RichEdit.SelAttributes.Style := [];
   RichEdit.Font.Style := [];
end;

function f_GetLine(RichEdit:TRichEdit; Valor: String): integer;
var
   sPosCursor, Cont: integer;
   Achou : boolean;
begin
   Cont := 0; Achou := False;
   sPosCursor := RichEdit.SelStart;
   While (Achou = false) and (cont < RichEdit.Lines.Count) do
   begin
      if RichEdit.Lines[cont] = Valor then
         Achou := true
      else
         cont := Cont +1;
   end;
   RichEdit.SelStart := RichEdit.FindText(Valor, 0, Length(RichEdit.Lines.Text), []); //
   Result := RichEdit.Perform(EM_LINEFROMCHAR, RichEdit.SelStart, 0); //
   If Cont > RichEdit.Lines.Count then
      Result := cont;
   RichEdit.SelStart := sPosCursor;
end;

//Rotina de Localizaçao e substituicao em RichEdit
procedure p_SubstituiMemo(Editor:TRichEdit;PalavraProcurada:String;PalavraSubstituta:String;EmTodoTexto:Boolean);
var
   CompTexto, InicioTexto, Encontrou : integer;
Begin
   while true do
   begin
      if Editor.SelLength <> 0 then
         InicioTexto := Editor.SelStart + Editor.SelLength
      else
         InicioTexto := 0;
      CompTexto:= length(Editor.text) - InicioTexto;
      Encontrou:= Editor.FindText(PalavraProcurada, InicioTexto, CompTexto, [stMatchCase]);
      if Encontrou <> -1 then
      begin
         Editor.SetFocus;
         Editor.SelStart := Encontrou;
         Editor.SelLength := Length(PalavraProcurada);
         Editor.SelText :=PalavraSubstituta;
      end
      else
         break;
      if not EmTodoTexto then
         break;
   end;
end;

function f_AceitaNulo( Valor : String ) : String;
begin
   if ( Valor <> '' ) then
      Result := '''' + Valor + ''''
   else
      Result := 'Null';
end;

function f_AceitaDataNula(Valor: TDateTime; Formato, AspasData:String): String;
begin
   if (Valor <> 0) then
      Result := AspasData + FormatDateTime( Formato, Valor ) + AspasData
   else
      Result := 'Null';
end;

function BoolToInt(Valor:Boolean):String;
begin
   if (Valor) then
      Result := '1'
   else
      Result := '0';
end;

function IntToBool(Valor:String):Boolean;
begin
 Result := (Valor = '1');
end;


function f_FormataCurrency(ValorString:String):String;
var ValorFloat:Real;
begin
  if (ValorString = '') then
     ValorFloat := 0.00
  else
    ValorFloat := f_GetNumbersReal(ValorString);
  Result := FormatCurr(CurrencyString+' #,#0.00;('+CurrencyString+' #,#0.00)',ValorFloat);
end;

function f_FormataFloat(ValorString: string): string;
var ValorFloat:Real;
begin
  if (ValorString = '') then
     ValorFloat := 0.00
  else
    ValorFloat := f_GetNumbersReal(ValorString);
  Result := FormatCurr('#,#0.00;(#,#0.00)', ValorFloat);
end;

function f_FormataCurrency(ValorFloat:Real):String;
begin
  Result := FormatCurr(CurrencyString+' #,#0.00;('+CurrencyString+' #,#0.00)',ValorFloat);
end;

function f_FormataFloat(ValorFloat: Real): String;
begin
  Result := FormatCurr('#,#0.00;(#,#0.00)', ValorFloat);
end;

function f_RepeatStr(Valor: string; quantidade: integer): string;
var i: integer;
begin
  Result := '';
	for i := 1 to quantidade do
  begin
    Result := Result + Valor;
  end;
end;

function f_DefineBrancosCentro(Texto: string; EspacoTotal: integer): string;
var lEspacoBranco: integer;
begin
  Result := '  ' + Texto;
  if (Length(Texto) > 0) and (EspacoTotal > Length(Texto)) then
  begin
    lEspacoBranco := (EspacoTotal - Length(Texto)) div 2;
    Result := f_RepeatStr(' ', lEspacoBranco + 2) + Texto;
  end;
end;

function f_DefineBrancosEsquerda(Texto: string; EspacoTotal: integer): string;
var lEspacoBranco: integer;
begin
  Result := Copy(Texto, 1, EspacoTotal);
  if (Length(Texto) > 0) and (EspacoTotal > Length(Texto)) then
  begin
    lEspacoBranco := EspacoTotal - Length(Texto);
    Result := f_RepeatStr(' ', lEspacoBranco) + Texto;
  end;
end;

function f_DefineBrancosDireita(Texto: string; EspacoTotal: integer): string;
var lEspacoBranco: integer;
begin
  Result := Copy(Texto, 1, EspacoTotal);
  if (Length(Texto) > 0) and (EspacoTotal > Length(Texto)) then
  begin
    lEspacoBranco := EspacoTotal - Length(Texto);
    Result := Texto + f_RepeatStr(' ', lEspacoBranco);
  end;
end;

function f_ApplyCharCase(Texto: string; CharCase: TEditCharCase): string;
begin
  Result := Texto;
  if CharCase = ecUpperCase then
    Result := AnsiUpperCase(Texto)
  else
  if CharCase = ecLowerCase then
    Result := AnsiLowerCase(Texto);
end;

{$WARNINGS OFF}
function f_NomeProprio(Nome:String):String;
var Texto,Auxiliar,vNome:String;
    I:Integer;
begin
vNome := AnsiLowerCase(Nome);
if (Length(vNome)=0) then
  Texto := ''
else
    For I:= 1 to (Length(vNome)+1) do
      if ((vNome[I]<>' ') and (Length(vNome)+1<>I)) then
        Auxiliar := Auxiliar + vNome[I]
      else
        begin
          if (Length(Auxiliar)>0) then
              Auxiliar[1] := UpCase(Auxiliar[1]);
          Texto       := Trim(Texto + ' ' + Auxiliar);
          Auxiliar    := '';
        end;

  Result := Texto;
end;

function AbreviaNome(Nome: String): String;
var
Nomes: array[1..20] of string;
i, TotalNomes: Integer;
begin
Nome := Trim(Nome);
Result := Nome;
{Insere um espaço para garantir que todas as letras sejam testadas}
Nome := Nome + #32;
{Pega a posição do primeiro espaço}
i := Pos(#32, Nome);
if i > 0 then
begin
TotalNomes := 0;
{Separa todos os nomes}
while i > 0 do
begin
Inc(TotalNomes);
Nomes[TotalNomes] := Copy(Nome, 1, i - 1);
Delete(Nome, 1, i);
i := Pos(#32, Nome);
end;
if TotalNomes > 2 then
begin
{Abreviar a partir do segundo nome, exceto o último.}
for i := 2 to TotalNomes - 1 do
begin
{Contém mais de 3 letras? (ignorar de, da, das, do, dos, etc.)}
if Length(Nomes[i]) > 3 then
{Pega apenas a primeira letra do nome e coloca um ponto após.}
Nomes[i] := Nomes[i][1] + '.';
end;
Result := '';
for i := 1 to TotalNomes do
Result := Result + Trim(Nomes[i]) + #32;
Result := Trim(Result);
end;
end;
end;

function f_GetNamesInString(Frase : String):TStringList;
var Lista : TStringList;
    Texto,Auxiliar:String;
    I:Integer;
begin
Lista := TStringList.Create;

if (Length(Frase)=0) then
  Texto := ''
else
  For I:= 1 to (Length(Frase)+1) do
    if ((Frase[I]<>' ') and (Length(Frase)+1<>I)) then
      Auxiliar := Auxiliar + Frase[I]
    else
      begin
        Lista.Add(Auxiliar);
        Auxiliar    := '';
      end;
  Result := Lista;
end;


{Checa Hora no Formato HH:MM}
function f_CheckHora(sHora : string) : boolean;
var
   sHoraAtual, sHoraFinal, sMinuto : string;
begin
   result := false;
   sHoraAtual := f_GetNumbers(sHora);
   if Length(sHoraAtual) = 4 then
   begin
  	   sHoraFinal := Copy(sHoraAtual,1,2);
  	   sMinuto := Copy(sHoraAtual,3,2);
   end
   else
   if Length(sHoraAtual) = 3 then
   begin
  	   sHoraFinal := '0' + Copy(sHoraAtual,1,1);
  	   sMinuto := Copy(sHoraAtual,2,2);
   end;
   if (sHorafinal >= '01') and (sHoraFinal <= '24') then
      if (sMinuto >= '00') and (sMinuto <= '59') then
         result := true;
end;

 { Checa data do tipo dd/mm/yyyy}
function f_CheckData(Data: string):boolean;
Var
   Y, M, D: Word;
   Aux : String;
begin
   Aux := f_GetNumbers(Data);
   D   := StrToInt(Copy(Aux,1,2));
   M   := StrToInt(Copy(Aux,3,2));
   Y   := StrToInt(Copy(Aux,5,4));
   Result := (Y >= 1) and (Y <= 9999) and (M >= 1) and (M <= 12) and  (D >= 1) and (D <= f_DiasPorMes(Y, M));
end;

 { Checa data do tipo dd/mm/yyyy}

 { Checa data do tipo dd/mm/yy}
function f_CheckDataAbr(Data: string):boolean;
Var Y, M, D: Word;
    Aux : String;
begin
Aux := f_GetNumbers(Data);
D   := StrToInt(Copy(Aux,1,2));
M   := StrToInt(Copy(Aux,3,2));
Y   := StrToInt(Copy(Aux,5,2));

Result := (Y >= 1) and (Y <= 99) and (M >= 1) and (M <= 12) and  (D >= 1);
end;

 { Checa Data do tipo dd/mm}
function f_CheckDiaMes(sData: string):boolean;
Var  M, D: Word;
    Aux : String;
begin
Aux := f_GetNumbers(sData);
D   := StrToInt(Copy(Aux,1,2));
M   := StrToInt(Copy(Aux,3,2));

Result := (M >= 1) and (M <= 12) and  (D >= 1) ;
end;

{
Compara  a Data Final + Hora Final é menor que a Data Inicial + Hora Inicial.
Retorna False caso a Data Final + Hora Final seja menor que a Data Inicial + Hora Inicial.
OBS:
 - Pode ser usada para comparar apenas Datas
   e os parâmetros HoraInicial e HoraFinal serem omitididos,
   ambos recebendo por default o valor 0.
 - Pode ser usada para comparar apenas Horas
   e os parâmetros DataInicial e a DataFinal serem omitididos,
   ambos recebendo por default o valor 0.
}
function f_ComparaDataHora(DataInicial, DataFinal, HoraInicial, HoraFinal: String): Boolean;
var lInicio, lFim: TDateTime;
begin
	Result := True;

  lInicio := StrToDateTime(DataInicial) + StrToDateTime(HoraInicial);
  lFim := StrToDateTime(DataFinal) + StrToDateTime(HoraFinal);
  if (lFim < lInicio) then
    Result := False;
end;

function f_DataExt(Data:TDateTime):String;
var Ano, Mes, Dia: Word;
begin
   DecodeDate( Data, Ano, Mes, Dia );
   Result := IntToStr( Dia ) + ' de ' + f_MesPorExtenso( Mes ) + ' de ' + IntToStr( Ano );
//   Result := f_DiaSemana( Data ) + ', ' + IntToStr( Dia ) + ' de ' + f_MesPorExtenso( Mes ) + ' de ' + IntToStr( Ano );
end;

function f_MesPorExtenso(Mes:Integer): String;
begin
   case Mes of
    1: Result := 'Janeiro';
    2: Result := 'Fevereiro';
    3: Result := 'Março';
    4: Result := 'Abril';
    5: Result := 'Maio';
    6: Result := 'Junho';
    7: Result := 'Julho';
    8: Result := 'Agosto';
    9: Result := 'Setembro';
   10: Result := 'Outubro';
   11: Result := 'Novembro';
   12: Result := 'Dezembro';
   end;
end;

function f_DiaSemana(Data:TDateTime):String;
begin
   Case DayOfWeek(Data) of
   1: Result := 'Domingo';
   2: Result := 'Segunda-Feira';
   3: Result := 'Terça-Feira';
   4: Result := 'Quarta-Feira';
   5: Result := 'Quinta-Feira';
   6: Result := 'Sexta-Feira';
   7: Result := 'Sábado';
   end;
end;


function f_Idade(Data: TDateTime; ApenasAno: Boolean): String;
var Ano2, Ano1, Mes2, Mes1, Dia2, Dia1, Anos, Meses: Word;
begin
  DecodeDate(Date, Ano2, Mes2, Dia2);
  DecodeDate(Data, Ano1, Mes1, Dia1);

  if Data <= Date then
  begin
    if Dia2 < Dia1 then
      if Mes2 > 1 then
        Dec(Mes2)
      else
      begin
        Mes2 := 12;
        Dec(Ano2);
      end;

    if Mes2 < Mes1 then
    begin
      Dec(Ano2);
      Inc(Mes2, 12);
    end;

    Anos := Ano2 - Ano1;
    Meses := Mes2 - Mes1;

    if ApenasAno then
    begin
      if Anos = 1 then
        Result := IntToStr(Anos) + ' Ano'
      else
        Result := IntToStr(Anos) + ' Anos';
    end
    else
    begin
      if Anos = 1 then
      begin
        if Meses = 1 then
          Result := IntToStr(Anos) + ' Ano' + ' e ' + IntToStr(Meses) + ' Mês'
        else
        if Meses = 0 then
          Result := IntToStr(Anos) + ' Ano'
        else
          Result := IntToStr(Anos) + ' Ano' + ' e ' + IntToStr(Meses) + ' Meses';
      end
      else
      begin
        if Meses = 1 then
          Result := IntToStr(Anos) + ' Anos' + ' e ' + IntToStr(Meses) + ' Mês'
        else
        if Meses = 0 then
          Result := IntToStr(Anos) + ' Anos'
        else
          Result := IntToStr(Anos) + ' Anos' + ' e ' + IntToStr(Meses) + ' Meses';
      end;
    end;
  end
  else
    Result := '';
end;

function f_Idade(StringData: String; ApenasAno: Boolean): String;
var Ano2, Ano1, Mes2, Mes1, Dia2, Dia1, Anos, Meses: Word;
    Data: TDateTime;
begin
	Dia1  := StrToInt(Copy(f_GetNumbers(StringData), 1, 2));
	Mes1  := StrToInt(Copy(f_GetNumbers(StringData), 3, 2));
	Ano1  := StrToInt(Copy(f_GetNumbers(StringData), 5, 4));
  Data := EncodeDate(Ano1, Mes1, Dia1);

	Dia2  := StrToInt(f_DateToStr('dd', Date));
	Mes2  := StrToInt(f_DateToStr('mm', Date));
	Ano2  := StrToInt(f_DateToStr('yyyy', Date));

  if Data <= Date then
  begin
    if Dia2 < Dia1 then
      if Mes2 > 1 then
        Dec(Mes2)
      else
      begin
        Mes2 := 12;
        Dec(Ano2);
      end;

    if Mes2 < Mes1 then
    begin
      Dec(Ano2);
      Inc(Mes2, 12);
    end;

    Anos := Ano2 - Ano1;
    Meses := Mes2 - Mes1;

    if ApenasAno then
    begin
      if Anos = 1 then
        Result := IntToStr(Anos) + ' Ano'
      else
        Result := IntToStr(Anos) + ' Anos';
    end
    else
    begin
      if Anos = 1 then
      begin
        if Meses = 1 then
          Result := IntToStr(Anos) + ' Ano' + ' e ' + IntToStr(Meses) + ' Mês'
        else
        if Meses = 0 then
          Result := IntToStr(Anos) + ' Ano'
        else
          Result := IntToStr(Anos) + ' Ano' + ' e ' + IntToStr(Meses) + ' Meses';
      end
      else
      begin
        if Meses = 1 then
          Result := IntToStr(Anos) + ' Anos' + ' e ' + IntToStr(Meses) + ' Mês'
        else
        if Meses = 0 then
          Result := IntToStr(Anos) + ' Anos'
        else
          Result := IntToStr(Anos) + ' Anos' + ' e ' + IntToStr(Meses) + ' Meses';
      end;
    end;
  end
  else
    Result := '';
end;

function f_StrToDate(Data: string): TDateTime;
var Dia, Mes, Ano: integer;
begin
	Dia  := StrToInt(Copy(f_GetNumbers(Data), 1, 2));
	Mes  := StrToInt(Copy(f_GetNumbers(Data), 3, 2));
	Ano  := StrToInt(Copy(f_GetNumbers(Data), 5, 4));

  Result := EncodeDate(Ano, Mes, Dia);
end;

function f_DateToStr(Formato: string; Data: TDateTime): String;
var Ano, Mes, Dia: Word;
begin
	Result := '';
  DecodeDate(Data, Ano, Mes, Dia);
  if Formato = 'dd/mm/yyyy' then
	  Result := f_StrZero(Dia, 2) + '/' + f_StrZero(Mes, 2) + '/' + f_StrZero(Ano, 4)
  else
  if Formato = 'mm/dd/yyyy' then
	  Result := f_StrZero(Mes, 2) + '/' + f_StrZero(Dia, 2) + '/' + f_StrZero(Ano, 4)
  else
  if Formato = 'dd/mm' then
	  Result := f_StrZero(Dia, 2) + '/' + f_StrZero(Mes, 2)
  else
  if Formato = 'ddmm' then
	  Result := f_StrZero(Dia, 2) + f_StrZero(Mes, 2)
  else
  if Formato = 'mmdd' then
	  Result := f_StrZero(Mes, 2) + f_StrZero(Dia, 2)
  else
  if Formato = 'dd' then
  	Result := f_StrZero(Dia, 2)
  else
  if Formato = 'mm' then
  	Result := f_StrZero(Mes, 2)
  else
  if Formato = 'yyyy' then
  	Result := f_StrZero(Ano, 4)
  else
  if Formato = 'mmm/yy' then
  	Result := Copy(f_MesPorExtenso(Mes), 1, 3) + '/' + Copy(f_StrZero(Ano, 4), 3, 2)
  else
  if Formato = 'dd,mm,yyyy' then
		Result := f_DiaSemana(Data) + ', ' + f_StrZero(Dia, 2) + ' de ' + f_MesPorExtenso(Mes) + ' de ' + f_StrZero(Ano, 4);
end;

function f_IsBissexto(AYear: Integer): Boolean;
begin
  Result := (AYear mod 4 = 0) and ((AYear mod 100 <> 0) or (AYear mod 400 = 0));
end;

function f_DiasPorMes(AYear, AMonth: Integer): Integer;
const
  DaysInMonth: array[1..12] of Integer = ( 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 );
begin
  Result := DaysInMonth[AMonth];
  if (AMonth = 2) and IsLeapYear(AYear) then Inc(Result); { leap-year Feb is special }
end;

function PrimeiroDiaUtil(Data:TDateTime):TDateTime;
{Retorna data do primeiro dia Util do mes, de uma data informada}
var Ano, Mes, Dia : word;
DiaDaSemana : Integer;
begin
  DecodeDate (Data, Ano, Mes, Dia);
  Dia := 1;
  DiaDaSemana := DayOfWeek(Data);
  if DiaDaSemana in [1,7] then
  Dia := 2;
  Result := EncodeDate(Ano, Mes, Dia);
end;

function IsWeekEnd(dData : TDateTime) : boolean;
{Verifica se uma data informada cai em um final de semana}
begin
  if DayOfWeek(dData) in [1,7] then
  result := true
  else
  result := false;
end;

function f_DiasUteis(dataini,datafin:string):integer;
var a,b,c:tdatetime;
  ct,s:integer;
begin
if StrToDate(DataFin) < StrtoDate(DataIni) then
  begin
  Result := 0;
  exit;
  end;
ct := 0;
s := 1;
a := strtodate(dataFin);
b := strtodate(dataIni);
if a > b then
  begin
  c := a;
  a := b;
  b := c;
  s := 1;
  end;
a := a + 1;
while (dayofweek(a)<>2) and (a <= b) do
  begin
  if dayofweek(a) in [2..6] then
  begin
  inc(ct);
  end;
  a := a + 1;
  end;
ct := ct + round((5*int((b-a)/7)));
a := a + (7*int((b-a)/7));
while a <= b do
  begin
  if dayofweek(a) in [2..6] then
  begin
  inc(ct);
  end;
  a := a + 1;
  end;
if ct < 0 then
  begin
  ct := 0;
  end;
result := s*ct;
end;

function f_ParcelaData(Data : TDateTime; Meses : Integer): TDateTime;    // retorna a data nos meses seguintes ex: 01/07/2002,2 -> 01/09/2002
var D,M,Y : Word;
begin
  DecodeDate(Data,Y,M,D);
  Y := Y + (Meses div 12);
  M := M + Trunc((Meses mod 12));

  if (M > 12) then
    begin
      M := Abs(12-M);
      Y := Y + 1;
    end;

  if D > f_DiasPorMes(Y,M) then
    D := f_DiasPorMes(Y,M);

  Result := EncodeDate(Y,M,D);
end;

function f_ParcelaData(Data : TDateTime; Parcela, Intervalo: Integer): TDateTime;    // retorna a data nos meses seguintes ex: 01/07/2002,2 -> 01/09/2002
var
   Data1: TDateTime;
begin
   Data1 := Data + ( ( Parcela - 1 ) * Intervalo );
   if DayOfWeek( Data ) = 1 then
      Data1 := Data1 + 1;
   if DayOfWeek( Data ) = 7 then
      Data1 := Data1 + 2;
   Result := Data1;
{  DecodeDate(Data,Y,M,D);
  Y := Y + (Meses div 12);
  M := M + Trunc((Meses mod 12));
  if (M > 12) then
    begin
      M := Abs(12-M);
      Y := Y + 1;
    end;
  if D > f_DiasPorMes(Y,M) then
    D := f_DiasPorMes(Y,M);
  Result := EncodeDate(Y,M,D); }
end;

function f_InverteDate(Data : String):String;
var
   lData : String;
begin
   lData := f_GetNumbers(Data);
   Result := '';
   If lData <> '' Then
      Result := Copy( lData, 3, 2 ) + '/' + Copy( lData, 1, 2 ) + '/' + Copy( lData, 5, 4 );
end;

function f_InverteDateMySQL( Data : String ):String;                               // converte a data 01/02/2003 -> 02/01/2003 (usado para SQL)
var
   lData : String; // 99/99/9999 -> 99999999
begin
   lData := f_GetNumbers(Data);
   Result := '';
   If lData <> '' Then
      Result := Copy( lData, 5, 4 ) + '-' + Copy( lData, 3, 2 ) + '-' + Copy( lData, 1, 2 );
end;

function f_FormataDataAbr(Data: string): string;
begin
   Result := '';
   if Trim(Data) <> '' then
      Result := Copy(f_GetNumbers(Data), 1, 2) + '/' + Copy(f_GetNumbers(Data), 3, 2);
end;

function f_FormataData(Data: string): string;
var
   lDia, lMes, lAno, lPalavra : string;
   i : integer;
begin
  Result := '';
	if Trim(Data) <> '' then
  begin
    Data := Trim(Data) + '/';
    lPalavra := '';
    for i := 1 to Length(Data) do
    begin
      if Copy(Data, i, 1)[1] in ['0'..'9'] then
        lPalavra := lPalavra + Copy(Data, i, 1)
      else
      begin
        if lDia = '' then
          lDia := f_StrZero(StrToInt(lPalavra), 2)
        else
        if lMes = '' then
          lMes := f_StrZero(StrToInt(lPalavra), 2)
        else
        if lAno = '' then
        begin
          lAno := f_StrZero(StrToInt(lPalavra), 2);

          if Length(lAno) = 2 then
            lAno := '19' + lAno
        end;

        lPalavra := '';
      end;
    end;
    if lAno = '' then
      Result := lDia + '/' + lMes
    else
      Result := lDia + '/' + lMes + '/' + lAno;
  end;
end;

function f_MesAnterior(Data : TDateTime):TDateTime;
var D,M,Y : Word;
begin
  DecodeDate(Data,Y,M,D);
  if M = 1 then
    begin
      M := 12;
      Y := Y -1;
    end
  else
    M := M -1;
      
  if D > f_DiasPorMes(Y,M) then D := f_DiasPorMes(Y,M);

  Result := EncodeDate(Y,M,D);
end;
{
procedure p_CarregaEstados(Combo: TmnComboBox);
begin
  Combo.Clear;
  Combo.InsertItem('RR','RORAIMA');
  Combo.InsertItem('TO','TOCANTINS');
  Combo.InsertItem('SE','SERGIPE');
  Combo.InsertItem('SP','SÃO PAULO');
  Combo.InsertItem('SC','SANTA CATARINA');
  Combo.InsertItem('RR','RORAIMA');
  Combo.InsertItem('RO','RONDÔNIA');
  Combo.InsertItem('RS','RIO GRANDE DO SUL');
  Combo.InsertItem('RN','RIO GRANDE DO NORTE');
  Combo.InsertItem('RJ','RIO DE JANEIRO');
  Combo.InsertItem('PI','PIAUÍ');
  Combo.InsertItem('PE','PERNAMBUCO');
  Combo.InsertItem('PR','PARANÁ');
  Combo.InsertItem('PB','PARAÍBA');
  Combo.InsertItem('PA','PARÁ');
  Combo.InsertItem('MG','MINAS GERAIS');
  Combo.InsertItem('MS','MATO GROSSO DO SUL');
  Combo.InsertItem('MT','MATO GROSSO');
  Combo.InsertItem('MA','MARANHÃO');
  Combo.InsertItem('GO','GOIÁS');
  Combo.InsertItem('ES','ESPIRITO SANTO');
  Combo.InsertItem('DF','DISTRITO FEDERAL');
  Combo.InsertItem('CE','CEARÁ');
  Combo.InsertItem('BA','BAHIA');
  Combo.InsertItem('AM','AMAZONAS');
  Combo.InsertItem('AP','AMAPÁ');
  Combo.InsertItem('AL','ALAGOAS');
  Combo.InsertItem('AC','ACRE');
end;
}
function f_GetUF(Estado: String): String;
begin
	if Estado = 'ACRE' then
  	Result := 'AC'
  else
	if Estado = 'ALAGOAS' then
  	Result := 'AL'
  else
	if Estado = 'AMAPÁ' then
  	Result := 'AP'
  else
	if Estado = 'AMAZONAS' then
  	Result := 'AM'
  else
	if Estado = 'BAHIA' then
  	Result := 'BA'
  else
	if Estado = 'CEARÁ' then
  	Result := 'CE'
  else
	if Estado = 'DISTRITO FEDERAL' then
  	Result := 'DF'
  else
	if Estado = 'ESPIRITO SANTO' then
  	Result := 'ES'
  else
	if Estado = 'GOIÁS' then
  	Result := 'GO'
  else
	if Estado = 'MARANHÃO' then
  	Result := 'MA'
  else
	if Estado = 'MATO GROSSO' then
  	Result := 'MT'
  else
	if Estado = 'MATO GROSSO DO SUL' then
  	Result := 'MS'
  else
	if Estado = 'MINAS GERAIS' then
  	Result := 'MG'
  else
	if Estado = 'PARÁ' then
  	Result := 'PA'
  else
	if Estado = 'PARAÍBA' then
  	Result := 'PB'
  else
	if Estado = 'PARANÁ' then
  	Result := 'PR'
  else
	if Estado = 'PERNAMBUCO' then
  	Result := 'PE'
  else
	if Estado = 'PIAUÍ' then
  	Result := 'PI'
  else
	if Estado = 'RIO DE JANEIRO' then
  	Result := 'RJ'
  else
	if Estado = 'RIO GRANDE DO NORTE' then
  	Result := 'RN'
  else
	if Estado = 'RIO GRANDE DO SUL' then
  	Result := 'RS'
  else
	if Estado = 'RONDÔNIA' then
  	Result := 'RO'
  else
	if Estado = 'RORAIMA' then
  	Result := 'RR'
  else
	if Estado = 'SANTA CATARINA' then
  	Result := 'SC'
  else
	if Estado = 'SÃO PAULO' then
  	Result := 'SP'
  else
	if Estado = 'SERGIPE' then
  	Result := 'SE'
  else
	if Estado = 'TOCANTINS' then
  	Result := 'TO'
  else
  	Result := Estado;
end;

function f_GetEstado(UF: string): string;
begin
	if UF = 'AC' then
  	Result := 'Acre'
  else
	if UF = 'AL' then
  	Result := 'Alagoas'
  else
	if UF = 'AP' then
  	Result := 'Amapá'
  else
	if UF = 'AM' then
  	Result := 'Amazonas'
  else
	if UF = 'BA' then
  	Result := 'Bahia'
  else
	if UF = 'CE' then
  	Result := 'Ceará'
  else
	if UF = 'DF' then
  	Result := 'Distrito Federal'
  else
	if UF = 'ES' then
  	Result := 'Espirito Santo'
  else
	if UF = 'GO' then
  	Result := 'Goiás'
  else
	if UF = 'MA' then
  	Result := 'Maranhão'
  else
	if UF = 'MT' then
  	Result := 'Mato Grosso'
  else
	if UF = 'MS' then
  	Result := 'Mato Grosso do Sul'
  else
	if UF = 'MG' then
  	Result := 'Minas Gerais'
  else
	if UF = 'PA' then
  	Result := 'Pará'
  else
	if UF = 'PB' then
  	Result := 'Paraíba'
  else
	if UF = 'PR' then
  	Result := 'Paraná'
  else
	if UF = 'PE' then
  	Result := 'Pernambuco'
  else
	if UF = 'PI' then
  	Result := 'Piauí'
  else
	if UF = 'RJ' then
  	Result := 'Rio de Janeiro'
  else
	if UF = 'RN' then
  	Result := 'Rio Grande do Norte'
  else
	if UF = 'RS' then
  	Result := 'Rio Grande do Sul'
  else
	if UF = 'RO' then
  	Result := 'Rondônia'
  else
	if UF = 'RR' then
  	Result := 'Roraima'
  else
	if UF = 'SC' then
  	Result := 'Santa Catarina'
  else
	if UF = 'SP' then
  	Result := 'São Paulo'
  else
	if UF = 'SE' then
  	Result := 'Sergipe'
  else
	if UF = 'TO' then
  	Result := 'Tocantins'
  else
  	Result := UF;
end;

//Converte de Boolean para String
function f_BoolToStr(Check: Boolean; TipoBanco: string): String;
begin
	if TipoBanco = 'ACCESS' then
	begin
    if Check then
       Result := 'True'
    else
       Result := 'False';
  end
  else
	if TipoBanco = 'SQLSERVER' then
	begin
    if Check then
       Result := '1'
    else
       Result := '0';
  end;
end;

function f_StrToBool(Valor : string; TipoBanco: string):Boolean;
begin
	if (TipoBanco = 'ACCESS') or (TipoBanco = '') then
	  Result := UpperCase(Trim(Valor)) = 'TRUE'
	else
	if TipoBanco = 'SQLSERVER' then
	  Result := UpperCase(Trim(Valor)) = '1';
end;

Function FBoolToStr( Check : Boolean ) : String; // Converte de Boolean para String
begin
   If Check then Result := 'T'
   Else          Result := 'F';
end;

Function FStrToBool( Valor : string ) : Boolean; // Converte de String para Boolean
begin
   Result := UpperCase( Trim( Valor ) ) = 'T'
end;

{ Funções de Mensagens Genéricas }
{$WARNINGS OFF}
function f_MensagemAviso(Mensagem: String): boolean;
begin
  Result := (Application.MessageBox(PChar(Mensagem),'Atenção',MB_OK + MB_ICONEXCLAMATION) = ID_OK);
end;

{$WARNINGS OFF}
function f_MensagemErro(Mensagem: String): boolean;
begin
  Result := (Application.MessageBox(PChar(Mensagem),'Erro de Sistema',MB_OK + MB_ICONERROR) = ID_OK);
end;

{$WARNINGS OFF}
function f_MensagemConfirmacao(Mensagem: String): boolean;
begin
  Result := (Application.MessageBox(PChar(Mensagem),'Confirmação',MB_YESNO + MB_ICONQUESTION) = ID_YES);
end;

{$WARNINGS OFF}
function f_MensagemPergunta(Mensagem: String): integer;
begin
  Result := Application.MessageBox(PChar(Mensagem),'Confirmação', MB_YESNOCANCEL + MB_ICONQUESTION);
end;

{$WARNINGS OFF}
function f_MensagemInformacao(Mensagem: String): boolean;
begin
  Result := (Application.MessageBox(PChar(Mensagem),'Informação',MB_OK + MB_ICONINFORMATION) = ID_OK);
end;
{$WARNINGS ON}

{ Funções de Tratamento de Campos }

function f_TrataEndereco(Endereco, Bairro, Cidade, Estado, Cep, Pais: string): string;
var lEndereco: string;
begin
  lEndereco := '';
  if Trim(Endereco) <> '' then
  begin
    lEndereco := Endereco + ' ' + Bairro;

    if Trim(Cidade) <> '' then
      lEndereco := lEndereco + '   ' + Cidade;

    if Trim(Estado) <> '' then
      lEndereco := lEndereco + '-' + Estado;

    if Trim(Cep) <> '' then
      lEndereco := lEndereco + '   ' + Cep;

    if Trim(Pais) <> '' then
      lEndereco := lEndereco + ' - ' + Pais;

  end;
  Result := lEndereco;
end;

procedure MouseCell(Grid: TStringGrid;  var Coluna, Linha: integer);
var
  Pt: TPoint;
begin
  GetCursorPos(Pt);
  Pt := Grid.ScreenToClient(Pt);
  if PtInRect(Grid.ClientRect, Pt) then
  Grid.MouseToCell(Pt.X, Pt.Y, Coluna, Linha)
  else begin
  Coluna := -1;
  Linha := -1;
  end;
end;

function f_FontStyleToStr(Fonte: Tfont): String;
Var Resposta : String;
begin
if (fsbold in Fonte.Style) then
  Resposta := Resposta + 'B';

if (fsItalic in Fonte.Style) then
  Resposta := Resposta + 'I';

if (fsUnderline in Fonte.Style) then
  Resposta := Resposta + 'U';

if (fsStrikeOut in Fonte.Style) then
  Resposta := Resposta + 'S';

Result := Resposta;
end;

function f_StrToFontStyle(Estilo: String): TFontStyles;
Var Fonte : TFontStyles;
    I : Integer;
begin
Fonte := [];
For I:=1 to Length(Estilo) do
  begin
    if (Estilo[I] = 'B') then
      Fonte := Fonte + [fsBold];

    if (Estilo[I] = 'I') then
      Fonte := Fonte + [fsItalic];

    if (Estilo[I] = 'U') then
      Fonte := Fonte + [fsUnderline];

    if (Estilo[I] = 'S') then
      Fonte := Fonte + [fsStrikeOut];
  end;
Result := Fonte;
end;
{
procedure ValidaVazio(Edit :TmnEdit; var Resp:Boolean);
begin
  if Resp and Edit.IsEmpty then
  begin
    MessageBeep($ffff);
    Resp := False;
    f_MensagemAviso(Edit.EmptyMessage);
    if Edit.CanFocus then
      Edit.SetFocus;
  end;
end;

procedure ValidaVazio(Edit :TmnEdit;var Resp:Boolean; Var Notebook : TNotebook;PageIndex :Integer);
begin
if Resp and Edit.IsEmpty then
  begin
    MessageBeep($ffff);
    f_MensagemAviso(Edit.EmptyMessage);
    Notebook.PageIndex := PageIndex;
    if Edit.CanFocus then
      Edit.SetFocus;
    Resp := False;
  end;
end;

procedure ValidaVazio(Combo :TmnComboBox;var Resp:Boolean);
begin
if Resp and (Combo.Text = '') then
  begin
    MessageBeep($ffff);
    f_MensagemAviso(Combo.InvalidMessage);
    if Combo.CanFocus then
      Combo.SetFocus;
    Resp := False;
  end;
end;

procedure ValidaVazio(Combo :TmnComboBox; var Resp:Boolean; Var Notebook : TNotebook;PageIndex :Integer);
begin
if Resp and (Combo.Text='') then
  begin
    MessageBeep($ffff);
    f_MensagemAviso(Combo.InvalidMessage);
    Notebook.PageIndex := PageIndex;
    if Combo.CanFocus then
      Combo.SetFocus;
    Resp := False;
  end;
end;

procedure ValidaConteudo(Edit :TmnEdit;var Resp:Boolean); overload;
begin
  if Resp and not Edit.IsValid then
  begin
    MessageBeep($ffff);
    f_MensagemAviso(Edit.InvalidMessage);
    if Edit.CanFocus then
      Edit.SetFocus;
    Resp := False;
  end;
end;
}

function ValidaMail( Texto : String ): Boolean;
var i, Pontos : Integer;
    Arroba : Boolean;
begin
  Arroba := False;
  Pontos := 0;
  for I := 0 to Length( Texto ) do
  begin
    if Copy( Texto, i, 1 ) = '@' then
      Arroba := True
    else
    if Arroba and ( Copy( Texto, i, 1 ) = '.' ) then
      Inc( Pontos );
  end;
  Result := Arroba and ( Pontos > 0 );
end;

{
procedure ValidaConteudo(Edit :TmnEdit;var Resp:Boolean; Var Notebook : TNotebook;PageIndex :Integer); overload;
begin
if Resp and not Edit.IsValid then
  begin
    MessageBeep($ffff);
    f_MensagemAviso(Edit.InvalidMessage);
    Notebook.PageIndex := PageIndex;
    if Edit.CanFocus then
      Edit.SetFocus;
    Resp := False;
  end;
end;
}
function Trans(Ch: Char; k: Byte): Char;
var
  i: Integer;
begin
  i := Ord(ch) + k;
  if i < 0 then
    i := i + 256
  else if i > 255 then
    i := i - 256;
  Result := Char(i);
end;

{***********************************************************}

function Decrypt(St: string; Ke: string): string;
var
  i, j: Byte;
begin
  Result := '';
  j := 1;
  if Length(Ke) > 0 then
    for i := 1 to Length(St) do
    begin
      Result := Result + Trans(St[i], -Ord(Ke[j]));
      if j = Length(Ke) then
        j := 1
      else
        Inc(j);
    end;
end;

{***********************************************************}

function Crypt(St: string; Ke: string): string;
var
  i, j: Byte;
begin
  Result := '';
  j := 1;
  if Length(Ke) > 0 then
    for i := 1 to Length(St) do
    begin
      Result := Result + Trans(St[i], Ord(Ke[j]));
      if j = Length(Ke) then
        j := 1
      else
        Inc(j);
    end;
end;

procedure Decode(Key:String;It: TStrings);
begin
  It.Text := Decrypt(It.Text, Key);
end;

procedure Encode(Key:String;It: TStrings);
begin
  It.Text := Crypt(It.Text, Key);
end;

function EncodeStream(Key:String;Value: TStream): TStream;
var
  buffer: array[0..1024] of Byte;
  i, j, count: Integer;
begin
  Result := TMemoryStream.Create;
  j := 1;
  while Value.Position < Value.Size do
  begin
    count := Value.Read(buffer, 1024);
    for i := 0 to count - 1 do
    begin
      buffer[i] := Ord(Trans(Char(buffer[i]), Ord(Key[j])));
      if j = Length(Key) then
        j := 1
      else
        Inc(j);
    end;
    Result.Write(buffer, count);
  end;
end;

function DecodeStream( Key:String;Value: TStream ): TStream;
var
   buffer: array[0..1024] of Byte;
   i, j, count: Integer;
begin
   Result := TMemoryStream.Create;
   j := 1;
   while Value.Position < Value.Size do
   begin
      count := Value.Read( buffer, 1024 );
      for i := 0 to count - 1 do
      begin
         buffer[ i ] := Ord( Trans( Char( buffer[ i ] ), - Ord( Key[ j ] ) ) );
         if j = Length( Key ) then
            j := 1
         else
            Inc( j );
      end;
      Result.Write( buffer, count );
   end;
end;

Function GravarIni( cArquivo, cSecao, cIdentificador, cValor : String ) : Boolean;
Var
   cArqIni : TIniFile;
begin
   cArqIni := TIniFile.Create( cArquivo );
   try
      cArqIni.WriteString( cSecao, cIdentificador, cValor );
      Result := True;
   except
      ShowMessage( 'Não foi possível gravar no arquivo: ' + cArquivo );
      Result := False;
   end;
   cArqIni.Free;
end;

Function LerIni( cArquivo, cSecao, cIdentificador : String ) : String;
Var
   cArqIni : TIniFile;
begin
   cArqIni := TIniFile.Create( cArquivo );
   result := cArqIni.ReadString( cSecao, cIdentificador, '' );
   cArqIni.Free;
end;

Function Iif( cDado, cCheck, cValor1, cValor2 : String ) : String;
Begin
   if cDado = cCheck then
      Result := cValor1
   else
      Result := cValor2;
End;

Procedure Formato_de_Data;
Begin
   If Not ( Pos( 'dd/MM/yyyy', ShortDateFormat ) > 0 ) Then
   Begin
      WinExec( 'RunDLL32.exe Shell32.DLL, Control_RunDLL intl.cpl', SW_Show );
      MessageDlg( 'O Formato de "Data" configurado não é correto'#13'' +
                  'para uso no Sistema.'#13''+
                  ''#13''+
                  'Formato atual: "'+ ShortDateFormat + '"'#13''+
                  ''#13''+
                  'Formato correto a ser utilizado: "dd/MM/aaaa".'#13''+
                  ''#13''+
                  'A Janlea exibida:'#13''+
                  '"Opções Regionais e de Idioma".'#13''+
                  'Deve ser utilizada para configuração do formato correto.'#13''+
                  'Favor clicar no Botão "PERSONALIZAR",'#13''+
                  'Logo após clicar na Guia "DATA"'#13''+
                  'Alterar o formato em:'#13''+
                  '"FORMATO DE DATA ABREVIADA", para: "dd/MM/aaaa"'#13''+
                  'para ativar esta configuração.'#13'' +
                  'Depois clicar em "APLICAR" e depois "OK".'#13'' +
                  'E novamente clicar em "APLICAR" e depois "OK".'#13'' +
                  ''#13''+
                  'Logo após execute novamente o Sistema.'#13'',
                  mtInformation, [ mbOK ], 0 );
      Application.Terminate;
   End;
End;

Function DriveLetters: string; { Uso: S := tbDriveLetters; - retorna 'ACD' se existir as unidades: A:, C: e D: }
var
   Drives : LongWord;
   I : byte;
begin
   Result := '';
   Drives := GetLogicalDrives;
   if Drives <> 0 then
      for I := 65 to 90 do
         if ((Drives shl (31 - (I - 65))) shr 31) = 1 then
   Result := Result + Char(I);
end;

Function SerialNum( FDrive : String ) : String;
Var
   Serial:DWord;
   DirLen,Flags: DWord;
   DLabel : Array[0..11] of Char;
begin
   Try GetVolumeInformation( PChar( FDrive + ':\' ), dLabel, 12, @Serial, DirLen, Flags, nil, 0 );
      Result := IntToHex( Serial, 8 ); // + ' ' + IntToStr( Serial ); // o 1º é o nº Hexadecimal o 2º o inteiro.
   Except
      Result :='';
   end;
end;

function VolInfo(const Drive: Char; Path: PChar): TVolInfo; { Uso: Info := VolInfo('A', nil); ou Info := VolInfo(#0, '\\computador\c\'); }
const
   cVolNameLen = 255;
   cSysNameLen = 255;
var
   Flags, PrevErrorMode: Cardinal;
begin
   if Path = nil then
      Path := PChar(Drive + ':\');
   SetLength( Result.Name, cVolNameLen );
   SetLength( Result.FileSysName, cSysNameLen );
   PrevErrorMode := SetErrorMode( SEM_FAILCRITICALERRORS );
   try
      if GetVolumeInformation( Path, PChar( Result.Name ), cVolNameLen,
                               @Result.Serial, Result.MaxCompLen, Flags,
                               PChar( Result.FileSysName ), cSysNameLen ) then
         begin
            Result.Name := string( PChar( Result.Name ) );
            Result.FileSysName := string( PChar( Result.FileSysName ) );
            Result.IsCompressed := ( Flags and FS_VOL_IS_COMPRESSED ) > 0;
         end
      else
         begin
            Result.Name := '';
            Result.Serial := 0;
            Result.IsCompressed := false;
            Result.MaxCompLen := 0;
            Result.FileSysName := '';
         end;
   finally
      SetErrorMode(PrevErrorMode);
   end;
end;

function NomeComputador : String;
var
   lpBuffer : PChar;
   nSize : DWord;
   const Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
   nSize := Buff_Size;
   lpBuffer := StrAlloc(Buff_Size);
   GetComputerName(lpBuffer,nSize);
   Result := String(lpBuffer);
   StrDispose(lpBuffer);
end;

Function GetIP : string; //--> Declare a Winsock na clausula uses da unit
var
   WSAData : TWSAData;
   HostEnt : PHostEnt;
   Name : String;
begin
   WSAStartup( 2, WSAData );
   SetLength( Name, 255 );
   Gethostname( PChar( Name ), 255 );
   SetLength( Name, StrLen( PChar( Name ) ) );
   HostEnt := gethostbyname( PChar( Name ) );
   with HostEnt^ do
      Result := Format( '%d.%d.%d.%d',
                        [Byte( h_addr^[0] ),
                         Byte( h_addr^[1] ),
                         Byte( h_addr^[2] ),
                         Byte( h_addr^[3] )] );
   WSACleanup;
end;

Function VerificaRegistro( cUnidade: String ): Boolean;
Var
   cReg : TRegistry;
   cSrl, cSrr, cChv : String;
   lRet : Boolean;
   vi : TVolInfo;
begin
   lRet := True;
   vi := VolInfo( #0, PChar( cUnidade + ':\' ) );
   cSrl := SerialNum( cUnidade ) + IntToStr( vi.Serial );
   cSrr := EncDecStr( cSrl, 1 );
   cReg := TRegistry.Create;
   cReg.RootKey := HKEY_LOCAL_MACHINE;
   cReg.OpenKeyReadOnly( 'software\HSO_Servico' );
   cChv := cReg.ReadString( 'Chave_Liberacao' );
   cReg.Free;
   cSrl := Copy( cSrl,  1, 4 ) + ' ' +
           Copy( cSrl,  5, 4 ) + ' ' +
           Copy( cSrl,  9, 4 ) + ' ' +
           Copy( cSrl, 13, 4 ) + ' ' +
           Copy( cSrl, 17, 2 );
   If  cSrl <> cChv Then
   Begin
//      cSerial := Copy( cSrr, 13, 4 ) + ' ' +
//                 Copy( cSrr,  9, 4 ) + ' ' +
//                 Copy( cSrr,  1, 4 ) + ' ' +
//                 Copy( cSrr,  5, 4 ) + ' ' +
//                 Copy( cSrr, 17, 2 ) +
//                 ''#13'';
      lRet := False;
   End;
   Result := lRet;
end;

Function EncDecStr( StrValue : String; Chave: Word ) : String;
var
   I: Integer;
   OutValue : String;
begin
   OutValue := '';
   for I := 1 to Length( StrValue ) do
      OutValue := OutValue + char( ( ord( StrValue[ I ] ) - Chave ) );
   Result := OutValue;
end;

Function ControlaCampoTexto( cDado : String ) : String;
Begin
   If cDado = '' Then
      Result := 'NULL'
   Else
      If cDado = 'NULL' Then
         Result := ''
      Else
         Result := cDado;
End;

Function CampoInforme( cDado : String ) : String;
Begin
   Result := cDado;
   If cDado = '' Then
      Result := 'NÃO INFORMADO';
End;

Function FormataDATA( cDado : String ) : String;
Var
   i : Integer;
   cTemp : String;
   Dia, Mes, Ano : Word;
Begin
   cTemp := '';
   for i := 1 to Length( cDado ) do
   begin
       if Pos( Copy( cDado, i, 1 ), '/' ) = 0 then
       begin
          cTemp := cTemp + Copy( cDado, i, 1 );
       end;
   end;
   cDado := cTemp;
   DecodeDate ( Now , Ano, Mes, Dia );
   Case Length( cDado ) Of
    6 : Result := Copy( cDado, 1, 2 ) + '/' + Copy( cDado, 3, 2 ) + '/' + Copy( IntToStr( Ano ), 1, 2 ) + Copy( cDado, 5, 2 );
    8 : Result := Copy( cDado, 1, 2 ) + '/' + Copy( cDado, 3, 2 ) + '/' + Copy( cDado, 5, 4 );
   Else
   Begin
      ShowMessage( 'Favor informar a data'#13'No formato: DDMMAAAA'#13'Sem as barras.' );
      Result := '';
   End;
   End;
End;

Function FormataHora( cDado : String ) : String;
Var
   sHoraAtual, sHoraFinal, sMinuto : String;
Begin //
   If f_CheckHora( cDado ) Then
   Begin
      sHoraAtual := f_GetNumbers( cDado );
      if Length( sHoraAtual ) = 4 then
      begin
         sHoraFinal := Copy(sHoraAtual,1,2);
         sMinuto    := Copy(sHoraAtual,3,2);
      end
      else
      if Length( sHoraAtual ) = 3 then
      begin
         sHoraFinal := '0' + Copy(sHoraAtual,1,1);
         sMinuto    := Copy(sHoraAtual,2,2);
      end;
      Result := sHoraFinal + ':' + sMinuto;
   End
   Else
   Begin
      ShowMessage( 'Favor informar a data'#13'No formato: HHMM'#13'Sem os Dois Pontos.' );
      Result := '';
   End;
End;

Function FormataCEP( cDado : String ) : String;
var
   cCEP : String;
Begin
   cCEP := '';
   Result := '';
   If cDado <> '' Then
   Begin
      cCEP := f_GetNumbers( cDado );
      If Length( cCEP ) = 5 Then Result := Copy( cCEP, 1, 2 ) + '.' + Copy( cCEP, 3, 3 )
      Else
         If Length( cCEP ) = 8 Then Result := Copy( cCEP, 1, 2 ) + '.' + Copy( cCEP, 3, 3 ) + '-' + Copy( cCEP, 6, 3 )
         Else                       raise Exception.Create( 'CEP inválido.'#13'Favor informar CEP Formado por 5 ou 8 dígitos.' );
   End;
End;

Function FormataFone( cDado : String ) : String;
var
   I : integer;
   cFone : String;
Begin
   Result := '';
   If cDado <> '' Then
   Begin
      cFone := '';
      For I := 1 to Length( cDado ) Do
         if Pos( Copy( cDado, I, 1 ), '/-.' ) = 0 then
         begin
            cFone := cFone + Copy( cDado, I, 1 );
         end;
      If Length( cFone ) = 7 Then Result := Copy( cFone, 1, 3 ) + '.' + Copy( cFone, 4, 4 )
      Else
         If Length( cFone ) = 8 Then Result := Copy( cFone, 1, 4 ) + '.' + Copy( cFone, 5, 4 )
         Else                        Result := cFone;
   End;
End;

Function FCPF( xCPF : String ) : Boolean; {Testa se o CPF é válido ou não}
Var
   d1, d4, xx, nCount, resto, digito1, digito2 : Integer;
   Check : String;
Begin
   d1 := 0; d4 := 0; xx := 1;
   for nCount := 1 to Length( xCPF )-2 do
   begin
       if Pos( Copy( xCPF, nCount, 1 ), '/-.' ) = 0 then
       begin
          d1 := d1 + ( 11 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
          d4 := d4 + ( 12 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
          xx := xx+1;
       end;
   end;
   resto := (d1 mod 11);
   if resto < 2 then
   begin
      digito1 := 0;
   end
   else
   begin
      digito1 := 11 - resto;
   end;
   d4 := d4 + 2 * digito1;
   resto := (d4 mod 11);
   if resto < 2 then
   begin
      digito2 := 0;
   end
   else
   begin
      digito2 := 11 - resto;
   end;
   Check := IntToStr( Digito1 ) + IntToStr( Digito2 );
   if Check <> copy( xCPF, succ( length( xCPF ) - 2 ), 2 ) then
   begin
      Result := False;
   end
   else
   begin
      Result := True;
   end;
end;

Function FCNPJ( xCNPJ : String ) : Boolean; {Testa se o CGC é válido ou não}
Var
   d1, d4, xx, nCount, fator, resto, digito1, digito2 : Integer;
   Check : String;
begin
   d1 := 0; d4 := 0; xx := 1;
   for nCount := 1 to Length( xCNPJ )-2 do
   begin
      if Pos( Copy( xCNPJ, nCount, 1 ), '/-.' ) = 0 then
      begin
         if xx < 5 then
         begin
            fator := 6 - xx;
         end
         else
         begin
            fator := 14 - xx;
         end;
          d1 := d1 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
         if xx < 6 then
         begin
            fator := 7 - xx;
         end
         else
         begin
            fator := 15 - xx;
         end;
         d4 := d4 + StrToInt( Copy( xCNPJ, nCount, 1 ) ) * fator;
         xx := xx+1;
      end;
   end;
   resto := ( d1 mod 11 );
   if resto < 2 then
   begin
      digito1 := 0;
   end
   else
   begin
      digito1 := 11 - resto;
   end;
   d4 := d4 + 2 * digito1;
   resto := ( d4 mod 11 );
   if resto < 2 then
   begin
      digito2 := 0;
   end
   else
   begin
      digito2 := 11 - resto;
   end;
   Check := IntToStr( Digito1 ) + IntToStr( Digito2 );
   if Check <> copy( xCNPJ, succ( length( xCNPJ ) - 2 ), 2 ) then
   begin
      Result := False;
   end
   else
   begin
      Result := True;
   end;
end;

Function FCPFCNPJ( xDado : String ) : String;
Var
   r : String;
Begin
   r := '';
   xDado := f_GetNumbers( xDado );
   If FCPF( xDado ) Then
   Begin
      r := Copy( xDado,  1, 3 ) + '.' +
           Copy( xDado,  4, 3 ) + '.' +
           Copy( xDado,  7, 3 ) + '-' +
           Copy( xDado, 10, 2 );
   End
   Else
   Begin
      If FCNPJ( xDado ) Then
      Begin
         r := Copy( xDado,  1, 2 ) + '.' +
              Copy( xDado,  3, 3 ) + '.' +
              Copy( xDado,  6, 3 ) + '/' +
              Copy( xDado,  9, 4 ) + '-' +
              Copy( xDado, 13, 2 );
      End
      Else
      Begin
         ShowMessage( 'O Número informado não é um CPF ou CNPJ' );
      End;
   End;
   Result := r;
End;

Function Numero_de_Linhas_em_um_Arquivo_TXT( Arqtexto : String ) : integer; // Retorna o número de linhas que um arquivo possui
Var
   f : Textfile;
   cont : integer;
Begin
//   linha := 0;   linha, 
   cont  := 0;
   AssignFile( f, Arqtexto );
   Reset( f );
   While not eof( f ) Do
   begin
      ReadLn( f );
      Cont := Cont + 1;
   end;
   Closefile( f );
   Result := cont;
end;

Function SToB( x : String ) : Boolean;
begin
   Result := False;
   If UpperCase( x ) = 'S' Then Result := True;
end;

Function BToS( x : Boolean ) : String;
begin
   Result := 'N';
   If x Then Result := 'S';
end;

Function FormataConta5( cDado : String ) : String; // 1.1.01.01.00001
Begin
   Result := '';
   If cDado <> '' Then
   Begin
      Result := Copy( cDado, 1, 1 ) + Iif( Copy( cDado, 2, 1 ), '', '', '.' ) +
                Copy( cDado, 2, 1 ) + Iif( Copy( cDado, 3, 1 ), '', '', '.' ) +
                Copy( cDado, 3, 2 ) + Iif( Copy( cDado, 5, 1 ), '', '', '.' ) +
                Copy( cDado, 5, 2 ) + Iif( Copy( cDado, 7, 1 ), '', '', '.' ) +
                Copy( cDado, 7, 5 );
   End; // '.' +
End;

Function FormataConta6( cDado : String ) : String; // 1.1.1.01.00001
Begin
   Result := '';
   If cDado <> '' Then
   Begin
      Result := Copy( cDado, 1, 1 ) + '.' +
                Copy( cDado, 2, 1 ) + '.' +
                Copy( cDado, 3, 1 ) + '.' +
                Copy( cDado, 4, 2 ) + '.' +
                Copy( cDado, 6, 5 );
   End;
End;

Function extenso( valor : real ) : string;
var
   Texto, Milhar, Centena, Centavos, msg : string;
////////////////////////////////fucao auxiliar extenso////////////////////////////////
  function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
    begin
      if Expressao then Result := CasoVerdadeiro
      else              Result := CasoFalso;
  end;
////////////////////////////funcao auxiliar extenso/////////////////////////
  function MiniExtenso (trio: string): string;
    var
      Unidade, Dezena, Centena: string;
    begin
      Unidade := '';
      Dezena  := '';
      Centena := '';
      if (trio[2]='1') and (trio[3]<>'0') then
        begin
          Unidade := Dez[strtoint(trio[3])];
          Dezena  := '';
        end
      else
        begin
          if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
          if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
      end;
      if (trio[1]='1') and (Unidade='') and (Dezena='') then
        Centena := 'Cem'
      else
        if trio[1]<>'0' then Centena := Centenas[strtoint(trio[1])]
        else                 Centena := '';
      Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
      + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
  end;

begin
  if (valor>999999.99) or (valor<0) then
    begin
      msg :='O valor está fora do intervalo permitido.';
      msg := msg + ' O número deve ser maior ou igual a zero e menor que 999.999,99.';
      msg := msg + ' Se não for corrigido o número não será escrito por extenso.';
      showmessage(msg);
      Result:='';
      exit;
    end;
  if valor=0 then
    begin
      Result:='';
      Exit;
  end;
  Texto    := formatfloat('000000.00',valor);
  Milhar   := MiniExtenso(Copy(Texto,1,3));
  Centena  := MiniExtenso(Copy(Texto,4,3));
  Centavos := MiniExtenso('0'+Copy(Texto,8,2));
  Result   := Milhar;
  if Milhar <> '' then
    begin
      if copy(texto,4,3)='000' then Result := Result+' Mil Reais'
      else                          Result := Result+' Mil ';
  end;
  if (((copy(texto,4,2)='00') and (Milhar<>'') and (copy(texto,6,1)<>'0')))or (centavos='') and (milhar<>'')  then
    Result:=Result+' e ';
  if ( Milhar + Centena <> '' ) then Result := Result + Centena;
  if ( Milhar = '' ) and ( copy( texto, 4, 3 ) = '001' ) then Result := Result + ' Real'
  else
  if (copy(texto,4,3)<>'000') then
    Result:=Result+' Reais';
  if Centavos='' then
    begin
      Result := Result + '';
      Exit;
  end
  else
    begin
      if Milhar + Centena = '' then
        Result := Centavos
      else
        Result := Result + ' e ' + Centavos;
  end;
  if (copy(texto,8,2)='01') and (Centavos<>'') then Result := Result + ' Centavo'
  else                                              Result := Result + ' Centavos';
end;

{Function Compacta_ADO( const sdbName : WideString ) : boolean;
const
   SProvider = 'Provider = Microsoft.Jet.OLEDB.4.0; Data Source = "';
var
   JE : TJetEngine;
   sdbTemp, sdbTempConn : WideString;
begin
   Result := False;
   sdbTemp := ExtractFileDir( sdbName ) + 'TEMP' + ExtractFileName( sdbName );
   sdbTempConn := SProvider + sdbtemp;
   if FileExists( sdbTemp ) then DeleteFile( sdbTemp );
   JE := TJetEngine.Create( Application );
   try
      try
         JE.CompactDatabase( SProvider + sdbName + '"', sdbTempConn + '"' );
         DeleteFile( sdbName );
         RenameFile( sdbTemp, sdbName );
         except on E:Exception do ShowMessage( E. Message );
      end;
   finally
      JE.FreeOnRelease;
      Result := True;
   end;
end;
}
end.

