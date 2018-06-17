object frmHistory: TfrmHistory
  Left = 0
  Top = 0
  Caption = 'Display debits history'
  ClientHeight = 494
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object histgrid: TDBGrid
    Left = 5
    Top = 71
    Width = 713
    Height = 355
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = histgridCellClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 65
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 293
      Top = 10
      Width = 137
      Height = 23
      Caption = 'Debits History'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 256
      Top = 39
      Width = 226
      Height = 13
      Caption = 'Click on a record to display detailed information'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 432
    Width = 729
    Height = 65
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 24
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Search'
      DoubleBuffered = True
      Kind = bkIgnore
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 643
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Back'
      DoubleBuffered = True
      Kind = bkAll
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 105
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Print'
      DoubleBuffered = True
      Kind = bkOK
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
  object pnlShowDetail: TPanel
    Left = 456
    Top = 71
    Width = 273
    Height = 355
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 73
      Height = 23
      Caption = 'Student:'
    end
    object lblStudent: TLabel
      Left = 87
      Top = 16
      Width = 5
      Height = 18
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 45
      Width = 58
      Height = 23
      Caption = 'Grade:'
    end
    object lblGrade: TLabel
      Left = 87
      Top = 45
      Width = 5
      Height = 18
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 74
      Width = 52
      Height = 23
      Caption = 'Debits'
    end
    object lblDebits: TLabel
      Left = 87
      Top = 74
      Width = 5
      Height = 18
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 103
      Width = 116
      Height = 23
      Caption = 'Transgression'
    end
    object lblTransgression: TLabel
      Left = 7
      Top = 132
      Width = 258
      Height = 29
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 169
      Width = 71
      Height = 23
      Caption = 'Remark:'
    end
    object redRemark: TRichEdit
      Left = 8
      Top = 198
      Width = 257
      Height = 115
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Button1: TButton
      Left = 96
      Top = 330
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object pnlSearch: TPanel
    Left = 456
    Top = 71
    Width = 265
    Height = 355
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
    object edtCrit: TEdit
      Left = 8
      Top = 37
      Width = 249
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Input Search Criteria'
    end
    object rgField: TRadioGroup
      Left = 8
      Top = 74
      Width = 249
      Height = 191
      Caption = 'Search Field'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        'Learner Name And SURNAME'
        'Grade'
        'Transgression'
        'Debit Range (low,high)')
      ParentFont = False
      TabOrder = 1
    end
    object Button2: TButton
      Left = 96
      Top = 288
      Width = 75
      Height = 25
      Caption = 'Search'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object adoHistCon: TADOConnection
    Left = 8
    Top = 8
  end
  object adoQH: TADOQuery
    Parameters = <>
    Left = 56
    Top = 8
  end
  object dsSource2: TDataSource
    Left = 96
    Top = 8
  end
end
