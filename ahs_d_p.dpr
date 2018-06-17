program ahs_d_p;

uses
  Forms,
  ahs_d_u in 'ahs_d_u.pas' {frmLogin},
  mainMenu_u in 'mainMenu_u.pas' {frmMain},
  loadNew_u in 'loadNew_u.pas' {frmLoadNew},
  viewHistory_u in 'viewHistory_u.pas' {frmHistory},
  gradeCommittee_u in 'gradeCommittee_u.pas' {frmGradeCommittee},
  select_print in 'select_print.pas' {sprint},
  ManageDetention_u in 'ManageDetention_u.pas' {frmMDetention},
  select_student in 'select_student.pas' {Select_learner};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmLoadNew, frmLoadNew);
  Application.CreateForm(TfrmHistory, frmHistory);
  Application.CreateForm(TfrmGradeCommittee, frmGradeCommittee);
  Application.CreateForm(Tsprint, sprint);
  Application.CreateForm(TfrmMDetention, frmMDetention);
  Application.CreateForm(TSelect_learner, Select_learner);
  Application.Run;
end.
