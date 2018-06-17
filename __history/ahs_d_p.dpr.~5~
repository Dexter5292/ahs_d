program ahs_d_p;

uses
  Forms,
  ahs_d_u in 'ahs_d_u.pas' {frmLogin},
  mainMenu_u in 'mainMenu_u.pas' {frmMain},
  loadNew_u in 'loadNew_u.pas' {frmLoadNew},
  viewHistory_u in 'viewHistory_u.pas' {frmHistory};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmLoadNew, frmLoadNew);
  Application.CreateForm(TfrmHistory, frmHistory);
  Application.Run;
end.
