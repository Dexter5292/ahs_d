unit mainMenu_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, loadNew_u, viewHistory_u;

type
  TfrmMain = class(TForm)
    Image1: TImage;
    btnDetention: TBitBtn;
    btnGovBod: TBitBtn;
    btnManTeam: TBitBtn;
    btnGradeCom: TBitBtn;
    btnPrint: TBitBtn;
    btnNotifications: TBitBtn;
    btnClose: TBitBtn;
    btnNew: TBitBtn;
    btnHistory: TBitBtn;
    btnBlackList: TBitBtn;
    procedure btnNewClick(Sender: TObject);
    procedure btnHistoryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnHistoryClick(Sender: TObject);
begin
  frmHistory.Show;
end;

procedure TfrmMain.btnNewClick(Sender: TObject);
begin
 frmLoadNew.Show;
end;

end.
