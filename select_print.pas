unit select_print;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, CheckLst, ManageDetention_u;

type
  Tsprint = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    printWhat: TCheckListBox;
    Label1: TLabel;
    procedure CancelBtnClick(Sender: TObject);
    function setPrintList: String;
    procedure OKBtnClick(Sender: TObject);
  private
  ops : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sprint: Tsprint;

implementation

{$R *.dfm}

procedure Tsprint.CancelBtnClick(Sender: TObject);
begin
sprint.Close;
end;

procedure Tsprint.OKBtnClick(Sender: TObject);
var
s : String;
begin
if (printwhat.Items[0] = 'Manage Previous Detention Lists') AND (printwhat.Checked[0]) then
begin
   frmMDetention.Show;
end;


  if printWhat.Checked[0] AND
  (printWhat.Items[0] = 'Detention') then
  begin
    s := s + '1';
  end else
  begin
    s := s + '0';
  end;
  if printWhat.Checked[1] AND
  (printWhat.Items[0] = 'Detention') then
  begin
    s := s + '1';
  end else
  begin
    s := s + '0';
  end;
  if printWhat.Checked[2] AND
  (printWhat.Items[0] = 'Detention') then
  begin
    s := s + '1';
  end else
  begin
    s := s + '0';
  end;
  ops := s;
  sprint.Close;
end;

function Tsprint.setPrintList: String;
begin
  result := ops;
end;

end.
