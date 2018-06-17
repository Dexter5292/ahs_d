object sprint: Tsprint
  Left = 227
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Select list'
  ClientHeight = 179
  ClientWidth = 384
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 281
    Height = 161
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 16
    Top = 13
    Width = 118
    Height = 13
    Caption = 'Select which lists to print'
  end
  object OKBtn: TButton
    Left = 300
    Top = 8
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 300
    Top = 38
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = CancelBtnClick
  end
  object printWhat: TCheckListBox
    Left = 16
    Top = 48
    Width = 233
    Height = 105
    ItemHeight = 13
    Items.Strings = (
      'Detention'
      'Black List'
      'Community Service')
    TabOrder = 2
  end
end
