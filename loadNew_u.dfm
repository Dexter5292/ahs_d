object frmLoadNew: TfrmLoadNew
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Load New Debit'
  ClientHeight = 524
  ClientWidth = 743
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 743
    Height = 73
    Align = alTop
    BevelInner = bvLowered
    BevelWidth = 3
    Caption = 'Load New Debits'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 88
    Width = 727
    Height = 121
    Caption = 'Learner Info'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 32
      Width = 42
      Height = 19
      Caption = 'Grade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 72
      Width = 53
      Height = 19
      Caption = 'Learner'
    end
    object Label3: TLabel
      Left = 344
      Top = 32
      Width = 32
      Height = 19
      Caption = 'Date'
    end
    object Label4: TLabel
      Left = 344
      Top = 72
      Width = 62
      Height = 19
      Caption = 'Educator'
    end
    object sedGrade: TSpinEdit
      Left = 80
      Top = 29
      Width = 121
      Height = 29
      MaxValue = 12
      MinValue = 8
      TabOrder = 3
      Value = 8
      OnChange = sedGradeChange
    end
    object edtEducator: TEdit
      Left = 424
      Top = 64
      Width = 241
      Height = 27
      TabOrder = 0
    end
    object dtpdate: TDateTimePicker
      Left = 424
      Top = 29
      Width = 241
      Height = 29
      Date = 43247.000000000000000000
      Time = 43247.000000000000000000
      TabOrder = 1
    end
    object cbLearner: TComboBox
      Left = 80
      Top = 64
      Width = 241
      Height = 27
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 215
    Width = 727
    Height = 226
    Caption = 'Debit Info'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label5: TLabel
      Left = 10
      Top = 32
      Width = 63
      Height = 19
      Caption = 'Category'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 10
      Top = 72
      Width = 78
      Height = 19
      Caption = 'Misconduct'
    end
    object Label7: TLabel
      Left = 10
      Top = 104
      Width = 61
      Height = 19
      Caption = 'Remarks'
    end
    object cbMisconduct: TComboBox
      Left = 112
      Top = 64
      Width = 264
      Height = 27
      TabOrder = 0
    end
    object rbA: TRadioButton
      Left = 120
      Top = 32
      Width = 113
      Height = 17
      Caption = 'A'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rbAClick
    end
    object rbB: TRadioButton
      Left = 239
      Top = 32
      Width = 113
      Height = 17
      Caption = 'B'
      TabOrder = 2
      OnClick = rbBClick
    end
    object redRemarks: TRichEdit
      Left = 112
      Top = 104
      Width = 593
      Height = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object btnLoad: TButton
    Left = 660
    Top = 447
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 3
    OnClick = btnLoadClick
  end
  object btnClose: TButton
    Left = 660
    Top = 478
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object pnlSchedule: TPanel
    Left = 239
    Top = 185
    Width = 265
    Height = 153
    BorderWidth = 3
    BorderStyle = bsSingle
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    Visible = False
    object Label8: TLabel
      Left = 72
      Top = 13
      Width = 96
      Height = 13
      Caption = 'Pick a time and date'
    end
    object Label9: TLabel
      Left = 96
      Top = 60
      Width = 53
      Height = 13
      Caption = 'Escalate to'
    end
    object dtpSchedule: TDateTimePicker
      Left = 32
      Top = 33
      Width = 186
      Height = 21
      Date = 43252.921300868050000000
      Time = 43252.921300868050000000
      TabOrder = 0
    end
    object btnSchedule: TButton
      Left = 80
      Top = 116
      Width = 75
      Height = 25
      Caption = 'Schedule'
      TabOrder = 1
      OnClick = btnScheduleClick
    end
    object escLevel: TComboBox
      Left = 48
      Top = 79
      Width = 145
      Height = 21
      TabOrder = 2
      Visible = False
      Items.Strings = (
        'Grade Committee'
        'Management Team'
        'Governing Body')
    end
  end
  object adoConNew: TADOConnection
    Left = 104
    Top = 464
  end
  object adoQNew: TADOQuery
    Parameters = <>
    Left = 40
    Top = 464
  end
end
