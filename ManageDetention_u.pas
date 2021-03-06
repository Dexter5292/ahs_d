unit ManageDetention_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Grids, Buttons, select_student;

type
  TfrmMDetention = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    cbSession: TComboBox;
    adoMdet: TADOConnection;
    adoQMD: TADOQuery;
    dsMdet: TDataSource;
    sgEdit: TStringGrid;
    Panel2: TPanel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    rgAbsent: TRadioGroup;
    rgBadBehaviour: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure sgEditSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure cbSessionChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure set_User(s: String);
    procedure mark_for_detention;
    procedure send_to_gradeCommittee;
    procedure send_to_managementTeam;
    procedure select_individual;
    procedure BitBtn2Click(Sender: TObject);

  private
  vUser : String;
  LStudent : select_student.TStudent;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMDetention: TfrmMDetention;

implementation

{$R *.dfm}

procedure TfrmMDetention.BitBtn1Click(Sender: TObject);
var
  I, X, DebOld, Deb   : Integer;
  test, SName, AccNum : String;
begin
if rgAbsent.ItemIndex = 0 then
begin
  mark_for_detention;
  ShowMessage('Operation Complete');
end;
if rgAbsent.ItemIndex = 1 then
begin
  send_to_GradeCommittee;
  ShowMessage('Operation Complete');
end;
if rgAbsent.ItemIndex = 2 then
begin
  send_to_ManagementTeam;
  ShowMessage('Operation Complete');
end;
if rgAbsent.ItemIndex = 3 then
begin
  select_individual;
  ShowMessage('Operation Complete');
end;
if rgBadBehaviour.ItemIndex = 0 then
begin
//----------------------Add 15 debits for bad behaviour -----------------------
  //  >> Loop through the sgEdit and retrieve the names of students with BB<<
  for I := 1 to sgEdit.RowCount do
    begin
      if (sgEdit.Cells[3,I] = 'y') OR (sgEdit.Cells[3,I]= 'Y') then
      begin
         SName := sgEdit.Cells[1, I];
         AccNum := '';
         with adoQMd do
         begin
            //Clear from action
            SQL.Clear;
            SQL.Add('DELETE * FROM [Action]');
            SQL.Add('WHERE [Learner] LIKE ''' + SName + '''');
            ExecSQL;

            //Find Accession Number.
            for X := 1 to Length(SName) do
              begin
                if SName[X] in ['0'..'9'] then
                begin
                  AccNum := AccNum + SName[X]
                end;
              end;
            //Add 15 debits

            SQL.Clear;
            SQL.Add('SELECT * FROM [Learner Information]');
            SQL.Add('WHERE [Accession Number] = ''' + AccNum + '''');
            Open;
            end; // end with statement.

            Deb := StrToInt(adoQMd['Debits']) + 15;

            adoQMd.Close;
            adoQMd.SQL.Clear;
            adoQMd.SQL.Add('UPDATE [Learner Information]');
            adoQMd.SQL.Add('SET [Debits] = ' + IntToStr(Deb));
            adoQMd.SQL.Add('WHERE [Accession Number] = ''' + AccNum + '''');
            AdoQMd.ExecSQL;
            ShowMessage('Operation Complete');
      end;// end nested if

    end; // end main if
//----------------------end-if-------------------------------------------------
end;
if rgBadBehaviour.ItemIndex = 1 then
begin
  mark_for_detention;
  ShowMessage('Operation Complete');
end;
if rgBadBehaviour.ItemIndex = 2 then
begin
  send_to_gradeCommittee;
  ShowMessage('Operation Complete');
end;
if rgBadBehaviour.ItemIndex = 3 then
begin
  send_to_managementTeam;
  ShowMessage('Operation Complete');
end;
if rgBadBehaviour.ItemIndex = 4 then
begin
  //Do Nothing
end;
if rgBadBehaviour.ItemIndex = 5 then
begin
  select_individual;
  ShowMessage('Operation Complete');
end;
adoMDET.Close;
end;


procedure TfrmMDetention.BitBtn2Click(Sender: TObject);
begin
frmMDetention.Close;
adoMDET.Close;
end;

procedure TfrmMDetention.cbSessionChange(Sender: TObject);
var
grabDate : String;
Counter  : Integer;
begin
 if cbSession.Text <> '' then
 begin
    grabDate := cbSession.Text;
    with adoQMd do
    begin
      SQL.Clear;
      SQL.Add('SELECT DISTINCT [Learner] FROM [Action]');
      SQL.Add('WHERE [ActDate] = ''' + grabDate + ''' AND [Measure] = ''Detention''');
      Open;
    end;
    for Counter := 1 to adoQMd.RecordCount do
      begin
        sgEdit.Cells[0, Counter] := IntToStr(Counter);
        sgEdit.Cells[1, Counter] := adoQMd['Learner'];
        adoQMd.Next
      end;
 end;
end;

procedure TfrmMDetention.FormCreate(Sender: TObject);
var
I         :   Integer;
begin
  adoMdet.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0; Data Source='
                            + ExtractFilePath(Application.ExeName)
                            + 'maindb.mdb; Persist Security Info=False';
  adoMdet.LoginPrompt      := False;
  adoQMd.Connection        := adoMdet;

  adoQMd.SQL.Clear;
  adoQMd.SQL.Add('SELECT DISTINCT [ActDate] FROM [ACTION]');
  adoQMd.SQL.Add('WHERE [Measure] = ''Detention''');
  adoQMd.Open;

  for I := 0 to adoQMd.RecordCount - 1 do
    begin
      cbSession.Items.Add(adoQMd['ActDate']);
      adoQMd.Next;
    end;

  sgEdit.Options      := sgEdit.Options+[goEditing];
  sgEdit.ColWidths[1] := sgEdit.ColWidths[1]*2;
  sgEdit.ColWidths[0] := sgEdit.ColWidths[0] div 2;
  sgEdit.ColWidths[3] := sgEdit.ColWidths[3] + 20;

  sgEdit.Cells[0,0] := '#';
  sgEdit.Cells[1,0] := 'Learner';
  sgEdit.Cells[2,0] := 'Present';
  sgEdit.Cells[3,0] := 'Bad Behaviour';
end;

procedure TfrmMDetention.mark_for_detention;
var
I     : Integer;
begin
for I := 1 to sgEdit.RowCount do
    begin
    if (sgEdit.Cells[2, I] = 'n')
    OR (sgEdit.Cells[2, I] = 'N') then
    begin
        with adoQMd do
        begin
          SQL.Clear;
          SQL.Add('INSERT INTO [Action](Learner, Measure, ActDate, ApprovedBy)');
          SQL.Add('VALUES(''' + sgEdit.Cells[1, I] +
          ''',''Detention'',''' + cbSession.Text + ''',''' + vUser + ''')');
          ExecSQL;
          SQL.Clear;
          SQL.Add('SELECT * FROM [Action]');
          SQL.Add('WHERE [Learner] = ''' + sgEdit.Cells[1,I] + '''');
          Open;
        end;  // end Query
        if adoQMd.RecordCount > 2 then
        begin
          ShowMessage(sgEdit.Cells[1,I] + ' has missed three detentions and needs to be' +
          ' escalated.' + sLineBreak + 'Please check Management Team');
        end; // end-if
    end else if (sgedit.Cells[2, I] = 'y')
             OR (sgEdit.Cells[2, I] = 'Y') then
             begin
                with adoQMd do
                begin
                  SQL.Clear;
                  SQL.Add('DELETE * FROM [Action]');
                  SQL.Add('WHERE [Learner] = ''' + sgEdit.Cells[1,I]
                  + ''' AND [Measure] = ''Detention''');
                  ExecSQL;
                end;  // end Query
             end;   //end absent for next Detention
    end; // end if else statement
end;

procedure TfrmMDetention.select_individual;
var
I     :  Integer;
begin
SetLength(LStudent,adoQMd.RecordCount);
    for I := 1 to sgEdit.RowCount do
    begin
        if (sgEdit.Cells[2, I] = 'n')
        OR (sgEdit.Cells[2, I] = 'N') then
            begin
               LStudent[I-1] := sgEdit.Cells[1, I]
            end;
    end;
    select_student.Select_learner.Show;
    select_student.Select_learner.setVStudent(LStudent);
end;

procedure TfrmMDetention.send_to_gradeCommittee;
var
  I                   : Integer;
  nDate               : TDateTime;
begin
nDate := date;
nDate := nDate + 5;
for I := 1 to sgEdit.RowCount do
  begin
    if (sgEdit.Cells[2, I] = 'n')
    OR (sgEdit.Cells[2, I] = 'N') then
      begin
        with adoQMd do
          begin
            SQL.Clear;
            SQL.Add('INSERT INTO [Grade Committee](Learner, HearingDate)');
            SQL.Add('VALUES(''' + sgEdit.Cells[1, I] + ''',''' + DateTimeToStr(nDate)
                + ''')');
            ExecSQL;
          end; // end Query
      end else if (sgedit.Cells[2, I] = 'y')   // handle marked Absent
             OR (sgEdit.Cells[2, I] = 'Y') then
             begin
                with adoQMd do
                begin
                  SQL.Clear;
                  SQL.Add('DELETE * FROM [Action]');
                  SQL.Add('WHERE [Learner] = ''' + sgEdit.Cells[1,I]
                  + ''' AND [Measure] = ''Detention''');
                  ExecSQL;
                end;
             end;
    end; // end for
end;

procedure TfrmMDetention.send_to_managementTeam;
var
nDate : TDateTime;
I     : Integer;
begin
nDate := Date + 5 ;
for I := 1 to sgEdit.RowCount do
  begin
    if (sgEdit.Cells[2, I] = 'n')
    OR (sgEdit.Cells[2, I] = 'N') then
      begin
        with adoQMd do
          begin
            SQL.Clear;
            SQL.Add('INSERT INTO [Management Team](Learner, HearingDate)');
            SQL.Add('VALUES(''' + sgEdit.Cells[1, I] + ''',''' + DateTimeToStr(nDate)
                + ''')');
            ExecSQL;
          end; // end Query
      end else if (sgedit.Cells[2, I] = 'y')   // handle marked Absent
             OR (sgEdit.Cells[2, I] = 'Y') then
             begin
                with adoQMd do
                begin
                  SQL.Clear;
                  SQL.Add('DELETE * FROM [Action]');
                  SQL.Add('WHERE [Learner] = ''' + sgEdit.Cells[1,I]
                  + ''' AND [Measure] = ''Detention''');
                  ExecSQL;
                end;
             end;
    end; // end for
end;

procedure TfrmMDetention.set_User(s:String);
begin
  frmMDetention.vUser := s;
end;

procedure TfrmMDetention.sgEditSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
begin
 if (ACol = 2) OR (ACol = 3) then
 begin
   if (sgEdit.Cells[ACol, ARow] <> 'y')
   AND (sgEdit.Cells[ACol, ARow] <> 'n')
   AND (sgEdit.Cells[ACol, ARow] <> 'Y')
   AND (sgEdit.Cells[ACol, ARow] <> 'N')
   AND (sgEdit.Cells[ACol, ARow] <> '') then
   begin
     ShowMessage('Invalid entry. Choose "y" - Yes or "n" - No');
   end;
 end;

end;

end.
