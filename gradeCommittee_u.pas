unit gradeCommittee_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, CheckLst, ExtCtrls, ComCtrls, Buttons, Grids,
  select_print, shellapi, ManageDetention_u;

type
  TfrmGradeCommittee = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    clbLearner: TCheckListBox;
    adoConGC: TADOConnection;
    adoQGC: TADOQuery;
    dsGC: TDataSource;
    btnSelectAll: TButton;
    GroupBox2: TGroupBox;
    cbMeasure: TComboBox;
    cbDetDate: TGroupBox;
    cbDateRange: TGroupBox;
    date1: TDateTimePicker;
    dateRange1: TDateTimePicker;
    dateRange2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    cbPrintCL: TCheckBox;
    cbPrintLL: TCheckBox;
    cbNotifications: TCheckBox;
    btnPreview: TBitBtn;
    btnOK: TBitBtn;
    BitBtn1: TBitBtn;
    sgPreview: TStringGrid;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure cbMeasureChange(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure sgPreviewSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnOKClick(Sender: TObject);
    procedure setUser(s: String);
    procedure cbPrintCLClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    previewed : Boolean;
    Vuser      : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGradeCommittee: TfrmGradeCommittee;

implementation

{$R *.dfm}

procedure TfrmGradeCommittee.setUser(s: String);
begin
  frmGradeCommittee.Vuser := s;
end;

procedure TfrmGradeCommittee.BitBtn1Click(Sender: TObject);
begin
frmGradeCommittee.Close;
adoConGC.Close;
end;

procedure TfrmGradeCommittee.BitBtn2Click(Sender: TObject);
begin
  with select_print.sprint.printWhat do
  begin
    Items.Clear;
    Items.Add('Manage Previous Detention Lists');
    Items.Add('Manage Previous Black Lists');
    Items.Add('Manage Previous Community Service Lists');
  end;
  select_print.sprint.Show;
  adoConGC.Close;
end;

procedure TfrmGradeCommittee.btnOKClick(Sender: TObject);
var
Row, Counter         : Integer;
ops, temp, mid       : String;
fMain, fNew          : TextFile;
sCmd                 : PWideChar;
begin

if not previewed then
begin
  btnPreview.Click;
end;

for Row := 1 to sgPreview.RowCount - 1 do
  begin
     adoQGC.SQL.Clear;
     adoQGC.SQL.Add('INSERT INTO [Action](Learner, Measure, ActDate, ApprovedBy)');
     adoQGC.SQL.Add('VALUES(''' + sgPreview.Cells[0, Row] + ''',''' +
                    sgPreview.Cells[1, Row] + ''','''
                    + sgPreview.Cells[2, Row] + ''',''' + vUser + ''')');
     adoQGC.ExecSQL;
  end;

for Row := 1 to sgPreview.rowCount do
  begin
    adoQGC.SQL.Clear;
    adoQGC.SQL.Add('DELETE * FROM [Grade Committee]');
    adoQGC.SQL.Add('WHERE Learner = ''' + sgPreview.Cells[0,Row] + '''');
    adoQGC.ExecSQL;
  end;

ops := select_print.sprint.setPrintList;


//Print Detention List

if (cbprintCl.Checked) AND (ops[1] = '1') then
begin
   // Load files for reading and writing.

   AssignFile(fMain, './genfiles/printDetention.txt');
   AssignFile(fNew, './genfiles/printReadyDetention.txt');
   Reset(fMain);
   Rewrite(fNew);

   // Gather information from the Action Table.

   adoQGC.SQL.Clear;
   adoQGC.SQL.Add('SELECT [Learner] FROM [Action]');
   adoQGC.SQL.Add('WHERE [Measure] = ''Detention''');
   adoQGC.Open;

   //Create .html file with custom data.

   while NOT EOF(fMain) do
   begin
     ReadLn(fMain, temp);
     mid := copy(temp,1,4);
     if mid='//AD' then
      begin
        temp := DateTimeToStr(date1.Date);
        WriteLn(fNew,temp);
        mid := '';
      end else
     if mid='//LI' then
      begin
        for Counter := 0 to adoQGC.RecordCount - 1 do
          begin
            temp := '<tr><td id="pop">' + IntToStr(Counter + 1) + '</td>'
            +  '<td id="pop">' + adoQGC['Learner'] + '</td>'
            +  '<td id="pop"><input type="checkbox"></td><td id="pop"></td></tr>';
            writeLn(fNew,temp);
            adoQGC.Next;
          end;
     end else
      begin
        WriteLn(fNew,temp);
      end;
   end;  // ends the While Loop.

   CloseFile(fNew);
   CloseFile(fMain);
   deleteFile('./genfiles/printReadyDetention.html');
   Rename(fNew, './genfiles/printReadyDetention.html');
   sCmd := Pwidechar('/C start winword ./genfiles/printReadyDetention.html');
   ShellExecute(application.Handle, nil, 'cmd.exe', PChar(sCmd), nil, SW_SHOW);

end;  //end if-statement for detention list.

//Print Black List

if (cbprintCl.Checked) AND (ops[2] = '1') then
begin
  // Ready files for assignment.

   AssignFile(fMain, './genfiles/printBlackList.txt');
   AssignFile(fNew, './genfiles/printReadyBlackList.txt');
   Reset(fMain);
   Rewrite(fNew);

   // Gather custom information for the list from action table.

   adoQGC.SQL.Clear;
   adoQGC.SQL.Add('SELECT [Learner] FROM [Action]');
   adoQGC.SQL.Add('WHERE [Measure] = ''Black List''');
   adoQGC.Open;
   while NOT EOF(fMain) do
    begin
     ReadLn(fMain, temp);
     mid := copy(temp,1,4);
     if mid='//AD' then
      begin
        temp := DateTimeToStr(Trunc(dateRange1.Date)) + ' - ' + DateTimeToStr(Trunc(dateRange2.Date));
        WriteLn(fNew,temp);
        mid := '';
      end else
     if mid='//LI' then
      begin
        for Counter := 0 to adoQGC.RecordCount - 1 do
          begin
            temp := '<tr><td id="pop">' + IntToStr(Counter + 1) + '</td>'
            +  '<td id="pop">' + adoQGC['Learner'] + '</td>'
            +  '<td id="pop"><input type="checkbox"></td>'
            +  '<td id="pop"><input type="checkbox"></td>'
            +  '<td id="pop"><input type="checkbox"></td>'
            +  '<td id="pop"><input type="checkbox"></td>'
            +  '<td id="pop"><input type="checkbox"></td>';
            writeLn(fNew,temp);
            adoQGC.Next;
          end;    // end for loop.
     end else
      begin
       WriteLn(fNew,temp);
      end;  // end if-else.
   end;     // end while.

   CloseFile(fNew);
   CloseFile(fMain);
   deleteFile('./genfiles/printReadyBlackList.html');
   Rename(fNew, './genfiles/printReadyBlackList.html');
   sCmd := Pwidechar('/C start winword ./genfiles/printReadyBlackList.html');
   ShellExecute(application.Handle, nil, 'cmd.exe', PChar(sCmd), nil, SW_SHOW);
end;  // End Black list if-statement.

// Print Comunity Service

if (cbprintCl.Checked) AND (ops[3] = '1') then
begin
   // Ready files for assignment parameters.

   AssignFile(fMain, './genfiles/printComService.txt');
   AssignFile(fNew, './genfiles/printReadyComService.txt');
   Reset(fMain);
   Rewrite(fNew);

   // Gather information from the Action Table.

   adoQGC.SQL.Clear;
   adoQGC.SQL.Add('SELECT [Learner] FROM [Action]');
   adoQGC.SQL.Add('WHERE [Measure] = ''Community Service''');
   adoQGC.Open;

   while NOT EOF(fMain) do
    begin
     ReadLn(fMain, temp);
     mid := copy(temp,1,4);
     if mid='//AD' then
      begin
        temp := DateTimeToStr(Trunc(dateRange1.Date)) + ' - ' + DateTimeToStr(Trunc(dateRange2.Date));
        WriteLn(fNew,temp);
        mid := '';
      end else
     if mid='//LI' then
      begin
        for Counter := 0 to adoQGC.RecordCount - 1 do
         begin
         temp := '<tr><td id="pop">' + IntToStr(Counter + 1) + '</td>'
            +  '<td id="pop">' + adoQGC['Learner'] + '</td>'
            +  '<td id="pop"><input type="checkbox"></td>'
            +  '<td id="pop"><input type="checkbox"></td>'
            +  '<td id="pop"><input type="checkbox"></td>'
            +  '<td id="pop"><input type="checkbox"></td>'
            +  '<td id="pop"><input type="checkbox"></td>';
         writeLn(fNew,temp);
         adoQGC.Next;
       end;  // End for Loop
     end else
      begin
       WriteLn(fNew,temp);
      end; //end if-else
   end; // end while.

   CloseFile(fNew);
   CloseFile(fMain);
   deleteFile('./genfiles/printReadyComService.html');
   Rename(fNew, './genfiles/printReadyComService.html');
   sCmd := Pwidechar('/C start winword ./genfiles/printReadyComService.html');
   ShellExecute(application.Handle, nil, 'cmd.exe', PChar(sCmd), nil, SW_SHOW);

end;   // end Community Service If-Statement.
ShowMessage('Operation Complete');
sgPreview.ColCount := 0;
sgPreview.RowCount := 0;
end;  // end Procedure.

procedure TfrmGradeCommittee.btnPreviewClick(Sender: TObject);
var
I      :  Integer;
OpString    : String;
begin
previewed := True;
sgPreview.Cells[0,0] := 'Learner';
sgPreview.Cells[1,0] := 'Measure';
sgPreview.Cells[2,0] := 'Date';
sgPreview.Cells[3,0] := '';
for I := 0 to clbLearner.Items.Count - 1 do
begin
  if clbLearner.Checked[I] then
  begin
     sgPreview.Cells[0,I+1] := clbLearner.Items[I];
     sgPreview.Cells[1,I+1] := cbMeasure.Text;
     if cbMeasure.ItemIndex = 0 then
     begin
       sgPreview.Cells[2,I+1] := DateTimeToStr(Trunc(date1.DateTime));
     end else
     begin
       sgPreview.Cells[2,I] := DateTimeToStr(Trunc(dateRange1.DateTime))
                                + ' - '
                                + DateTimeToStr(Trunc(dateRange2.DateTime));
     end;
     OpString := '';
     if cbPrintCl.Checked then
     begin
       OpString := Opstring + '1';
     end else
     begin
       Opstring := Opstring + '0';
     end;
     if cbPrintLL.Checked then
     begin
       OpString := Opstring + '1';
     end else
     begin
       Opstring := Opstring + '0';
     end;
     if cbNotifications.Checked then
     begin
       OpString := Opstring + '1';
     end else
     begin
       Opstring := Opstring + '0';
     end;
     sgPreview.Cells[3,I+1] := OpString;
     sgPreview.RowCount := sgPreview.RowCount + 1;
  end;
end;
end;

procedure TfrmGradeCommittee.btnSelectAllClick(Sender: TObject);
begin
  clbLearner.CheckAll(cbChecked,False,True);
end;

procedure TfrmGradeCommittee.Button1Click(Sender: TObject);
begin
   frmMDetention.Show;
end;

procedure TfrmGradeCommittee.cbMeasureChange(Sender: TObject);
begin
  if cbMeasure.ItemIndex <> 0 then
  begin
    cbDateRange.Visible := True;
    cbDetDate.Visible := False;
  end else
  begin
    cbDateRange.Visible := False;
    cbDetDate.Visible := True;
  end;
end;

procedure TfrmGradeCommittee.cbPrintCLClick(Sender: TObject);
begin
 select_print.sprint.Show;
end;

procedure TfrmGradeCommittee.FormCreate(Sender: TObject);
var
I   : Integer;
begin
previewed := False;
adoConGC.ConnectionString := 'Provider=MicroSoft.Jet.OLEDB.4.0; Data Source='
                            + ExtractFilePath(Application.ExeName)
                            + 'maindb.mdb; Persist Security Info=False';
adoConGC.LoginPrompt := False;
adoQGC.Connection := adoConGC;
adoQGC.SQL.Clear;
adoQGC.SQL.Add('SELECT DISTINCT [Learner] FROM [Grade Committee]');
adoQGC.Open;
for I := 1 to adoQGC.RecordCount do
begin
  clbLearner.Items.Add(adoQGC['Learner']);
  adoQGC.Next;
end;
sgPreview.ColCount := 4;
sgPreview.RowCount := 1;
// [0,0]..[0,3]
sgPreview.ColWidths[0] := 175;
sgPreview.ColWidths[1] := 75;
sgPreview.ColWidths[2] := 80;
sgPreview.ColWidths[3] := 30;

end;

procedure TfrmGradeCommittee.sgPreviewSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  ShowMessage(sgPreview.Cells[ACol,ARow]);
end;

end.
