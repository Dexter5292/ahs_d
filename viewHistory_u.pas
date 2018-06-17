unit viewHistory_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ADODB, ComCtrls, Buttons,
  ShellApi;

type
  TfrmHistory = class(TForm)
    adoHistCon: TADOConnection;
    adoQH: TADOQuery;
    dsSource2: TDataSource;
    histgrid: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    pnlShowDetail: TPanel;
    Label2: TLabel;
    lblStudent: TLabel;
    Label3: TLabel;
    lblGrade: TLabel;
    Label4: TLabel;
    lblDebits: TLabel;
    Label6: TLabel;
    lblTransgression: TLabel;
    Label5: TLabel;
    redRemark: TRichEdit;
    Button1: TButton;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    pnlSearch: TPanel;
    edtCrit: TEdit;
    rgField: TRadioGroup;
    Button2: TButton;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure histgridCellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    function returnLow(S: String): String;
    function returnHigh(S : String): String;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistory: TfrmHistory;

implementation

{$R *.dfm}

function TfrmHistory.returnLow(S: string): String;
var
  I : Integer;
begin
  for I := 1 to pos(',', s) - 1 do
    begin
      result := '' + result + s[I];
    end;

end;
function TfrmHistory.returnHigh(S: string): String;
var
  I : Integer;
begin
  for I := pos(',',s) + 1 to Length(s) do
    begin
      result := '' + result + s[I];
    end;

end;
procedure TfrmHistory.BitBtn1Click(Sender: TObject);
begin
pnlSearch.Visible := True;
edtCrit.SetFocus;
end;

procedure TfrmHistory.BitBtn2Click(Sender: TObject);
begin
adoHistCon.Close;
frmHistory.Close;
end;

procedure TfrmHistory.BitBtn3Click(Sender: TObject);
var
list, cdox, oldF : Textfile;
s, x :String;
p : array[0..143] of WideChar;
sCMD : String;
rCount : Integer;
begin
try
  AssignFile(list,'./genfiles/printHistory.txt');
  reWrite(list);
except
  ShowMessage('Problem with file');
end;
  // Begin HTML FILE output.
AssignFile(cdox, './genfiles/createdoc.txt');
Reset(cdox);
while NOT EoF(cdox) do
begin
readLn(cdox,s);
writeLn(list,s);
end;
rCount := 0;
adoQH.SQL.Clear;
adoQH.SQL.Add('SELECT * FROM [Disciplinary History]');
adoQH.Open;
adoQH.First;
while NOT adoQH.Eof do
begin
  WriteLn(list,'<tr>');
  WriteLn(list,'<td>' + IntToStr(rCount) + '</td>');
  WriteLn(list,'<td>' + adoQH['Learner'] + '</td>');
  WriteLn(list,'<td>' + adoQH['Grade'] + '</td>');
  WriteLn(list,'<td>' + DateTimeToStr(adoQH['LoadingDate']) + '</td>');
  WriteLn(list,'<td>' + adoQH['Transgression Type'] + '</td>');
  WriteLn(list,'<td>' + IntToStr(adoQH['Debit Total']) + '</td>');
  WriteLn(list,'</tr>');
  inc(rCount);
  adoQH.Next;
end;
  WriteLn(list,'</table>');
  WriteLn(list,'</body>');
  WriteLn(list,'</html>');
CloseFile(cdox);
CloseFile(list);
AssignFile(oldF, './genfiles/printHistory.html');
Erase(oldF);
Rename(list, './genfiles/printHistory.html');
sCmd := Pwidechar('/C start winword ./genfiles/printHistory.html /t"./genfiles/DH.dotx"');
ShellExecute(application.Handle, nil, 'cmd.exe', PChar(sCmd), nil, SW_SHOW);
ShowMessage('Succeeded');
end;

procedure TfrmHistory.Button1Click(Sender: TObject);
begin
pnlShowDetail.Visible := False;
adoQH.SQL.Clear;
adoQH.SQL.Add('SELECT * FROM [Disciplinary History]');
adoQH.Open;
dsSource2.DataSet := adoQH;
histgrid.DataSource := dsSource2;
adoQH.Active := True;
histgrid.Columns.Items[0].Width := 60;
histgrid.Columns.Items[1].Width := 120;
histgrid.Columns.Items[4].Width := 60;
histgrid.Columns.Items[5].Width := 150;
end;

procedure TfrmHistory.Button2Click(Sender: TObject);
var
crit :String;
sField : String;
searchDebits : Boolean;
begin
  searchDebits := False;
  crit := edtCrit.Text;
  case (rgField.ItemIndex) of
  0:  sField := 'Learner';
  1:  sField := 'Grade';
  2:  sField := 'Transgression Type';
  3:  Begin
  sField := 'Debit Total';
  searchDebits := True;
  end;
  end;
  if NOT (searchDebits) then
  begin
  adoQH.SQL.Clear;
  adoQH.SQL.Add('SELECT * FROM [Disciplinary History]');
  adoQH.SQL.Add('WHERE [' + sField + '] LIKE ''%' + crit + '%''');
  adoQH.Open;
  end
  else
  begin
    adoQH.SQL.Clear;
    adoQH.SQL.Add('SELECT * FROM [Disciplinary History]');
    adoQH.SQL.Add('WHERE [Debit Total] BETWEEN ' + returnLow(crit)
     + ' AND ' + returnHigh(crit));
    adoQH.Open;
  end;
  pnlSearch.Visible := False;
end;

procedure TfrmHistory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
adoHistCon.Close;
end;

procedure TfrmHistory.FormCreate(Sender: TObject);
begin
adoHistCon.ConnectionString := 'Provider=MicroSoft.Jet.OLEDB.4.0; Data Source='
                                + ExtractFilePath(Application.ExeName)
                                + 'maindb.mdb; Persist Security info=false';
adoHistCon.LoginPrompt := False;
adoQH.Connection := adoHistCon;
adoQH.SQL.Clear;
adoQH.SQL.Add('SELECT * FROM [Disciplinary History]');
adoQH.Open;
dsSource2.DataSet := adoQH;
histgrid.DataSource := dsSource2;
adoQH.Active := True;
histgrid.Columns.Items[0].Width := 60;
histgrid.Columns.Items[1].Width := 120;
histgrid.Columns.Items[4].Width := 60;
histgrid.Columns.Items[5].Width := 150;
end;

procedure TfrmHistory.histgridCellClick(Column: TColumn);
var
recordNum : Integer;

begin
  pnlShowDetail.Visible := True;
  recordNum := histgrid.Fields[0].AsInteger;
  adoQH.SQL.Clear;
  adoQH.SQL.Add('SELECT * FROM [Disciplinary History] WHERE ID = '+ IntToStr(recordNum));
  adoQH.Open;
  lblStudent.Caption := adoQH['Learner'];
  try
  lblGrade.Caption := adoQH['Grade'];
  except
  on E: EVariantError do
  begin
  ShowMessage('No grade Loaded');
  end;
  end;
  lblDebits.Caption := adoQH['Debit Total'];
  lblTransgression.Caption := adoQH['Transgression Type'];
  redRemark.Clear;
  redRemark.Lines.Add(adoQH['Remarks']);

end;

end.
