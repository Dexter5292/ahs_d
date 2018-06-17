object frmGradeCommittee: TfrmGradeCommittee
  Left = 0
  Top = 0
  Caption = 'Grade Committee'
  ClientHeight = 498
  ClientWidth = 800
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
    Left = -4
    Top = 1
    Width = 804
    Height = 65
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 249
      Top = 10
      Width = 296
      Height = 23
      Caption = 'Grade Committee Management'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 237
      Top = 39
      Width = 312
      Height = 13
      Caption = 'Process and display the results of the Grade Committee meetings'
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 80
    Width = 233
    Height = 415
    Caption = 'Select Learners'
    TabOrder = 1
    object clbLearner: TCheckListBox
      Left = 19
      Top = 32
      Width = 190
      Height = 337
      ItemHeight = 13
      TabOrder = 0
    end
    object btnSelectAll: TButton
      Left = 72
      Top = 375
      Width = 75
      Height = 25
      Caption = 'Select All'
      TabOrder = 1
      OnClick = btnSelectAllClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 247
    Top = 80
    Width = 177
    Height = 97
    Caption = 'Choose a correctional measure'
    TabOrder = 2
    object cbMeasure: TComboBox
      Left = 16
      Top = 40
      Width = 145
      Height = 21
      TabOrder = 0
      OnChange = cbMeasureChange
      Items.Strings = (
        'Detention'
        'Black List'
        'Comunity Service'
        'Other...')
    end
  end
  object cbDetDate: TGroupBox
    Left = 247
    Top = 183
    Width = 178
    Height = 114
    Caption = 'Choose a date'
    TabOrder = 3
    object date1: TDateTimePicker
      Left = 13
      Top = 44
      Width = 148
      Height = 21
      Date = 43261.641197824070000000
      Time = 43261.641197824070000000
      TabOrder = 0
    end
  end
  object cbDateRange: TGroupBox
    Left = 247
    Top = 183
    Width = 178
    Height = 114
    Caption = 'Choose a date range'
    TabOrder = 4
    Visible = False
    object Label2: TLabel
      Left = 28
      Top = 16
      Width = 24
      Height = 13
      Caption = 'From'
    end
    object Label3: TLabel
      Left = 28
      Top = 60
      Width = 12
      Height = 13
      Caption = 'To'
    end
    object dateRange1: TDateTimePicker
      Left = 19
      Top = 33
      Width = 142
      Height = 21
      Date = 43261.583333333340000000
      Time = 43261.583333333340000000
      TabOrder = 0
    end
    object dateRange2: TDateTimePicker
      Left = 19
      Top = 75
      Width = 142
      Height = 21
      Date = 43261.641652638890000000
      Time = 43261.641652638890000000
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 247
    Top = 303
    Width = 178
    Height = 114
    Caption = 'Options'
    TabOrder = 5
    object cbPrintCL: TCheckBox
      Left = 16
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Print Controll List'
      TabOrder = 0
      OnClick = cbPrintCLClick
    end
    object cbPrintLL: TCheckBox
      Left = 16
      Top = 56
      Width = 145
      Height = 17
      Caption = 'Print Letters to learners'
      TabOrder = 1
    end
    object cbNotifications: TCheckBox
      Left = 16
      Top = 88
      Width = 137
      Height = 17
      Caption = 'Add To Notifications'
      TabOrder = 2
    end
  end
  object btnPreview: TBitBtn
    Left = 247
    Top = 423
    Width = 75
    Height = 25
    Caption = 'Preview'
    DoubleBuffered = True
    Kind = bkRetry
    ParentDoubleBuffered = False
    TabOrder = 6
    OnClick = btnPreviewClick
  end
  object btnOK: TBitBtn
    Left = 349
    Top = 423
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkOK
    ParentDoubleBuffered = False
    TabOrder = 7
    OnClick = btnOKClick
  end
  object BitBtn1: TBitBtn
    Left = 349
    Top = 454
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkClose
    ParentDoubleBuffered = False
    TabOrder = 8
    OnClick = BitBtn1Click
  end
  object sgPreview: TStringGrid
    Left = 430
    Top = 90
    Width = 362
    Height = 400
    ColCount = 4
    RowCount = 2
    TabOrder = 9
    OnSelectCell = sgPreviewSelectCell
  end
  object BitBtn2: TBitBtn
    Left = 247
    Top = 454
    Width = 75
    Height = 25
    Caption = 'Existing'
    DoubleBuffered = True
    Kind = bkIgnore
    ParentDoubleBuffered = False
    TabOrder = 10
    OnClick = BitBtn2Click
  end
  object adoConGC: TADOConnection
    Left = 8
    Top = 8
  end
  object adoQGC: TADOQuery
    Parameters = <>
    Left = 48
    Top = 8
  end
  object dsGC: TDataSource
    Left = 88
    Top = 8
  end
end
