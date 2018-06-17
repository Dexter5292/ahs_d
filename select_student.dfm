object Select_learner: TSelect_learner
  Left = 227
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Select Learner'
  ClientHeight = 256
  ClientWidth = 691
  Color = clWhite
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 561
    Height = 161
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 24
    Top = 20
    Width = 117
    Height = 13
    Caption = 'Select Indicivual Learner'
  end
  object Label2: TLabel
    Left = 24
    Top = 69
    Width = 55
    Height = 13
    Caption = 'Select Date'
  end
  object OKBtn: TButton
    Left = 588
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
    Left = 588
    Top = 39
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = CancelBtnClick
  end
  object cbLearner: TComboBox
    Left = 24
    Top = 39
    Width = 249
    Height = 21
    TabOrder = 2
  end
  object rgCon: TRadioGroup
    Left = 288
    Top = 8
    Width = 265
    Height = 153
    Caption = 'Contingency'
    Items.Strings = (
      'Mark for new detention'
      'Mark for Grade Committee'
      'Mark for Management Team'
      'Mark for Governing Body'
      'Mark for suspension'
      'Ignore')
    TabOrder = 3
  end
  object dtpDate: TDateTimePicker
    Left = 24
    Top = 88
    Width = 186
    Height = 21
    Date = 43267.661509861110000000
    Time = 43267.661509861110000000
    TabOrder = 4
  end
  object adoCon: TADOConnection
    Left = 24
    Top = 192
  end
  object adoQ: TADOQuery
    Parameters = <>
    Left = 72
    Top = 192
  end
end
