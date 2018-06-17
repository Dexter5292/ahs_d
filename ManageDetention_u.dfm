object frmMDetention: TfrmMDetention
  Left = 0
  Top = 0
  Caption = 'frmMDetention'
  ClientHeight = 476
  ClientWidth = 732
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 737
    Height = 73
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 221
      Top = 10
      Width = 308
      Height = 23
      Caption = 'Manage Existing Detention Lists'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 285
      Top = 39
      Width = 174
      Height = 13
      Caption = 'Process Disciplinary Measures Taken'
    end
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 79
    Width = 321
    Height = 82
    Caption = 'Select detention session:  '
    TabOrder = 1
    object cbSession: TComboBox
      Left = 24
      Top = 32
      Width = 278
      Height = 21
      TabOrder = 0
      OnChange = cbSessionChange
    end
  end
  object sgEdit: TStringGrid
    Left = 16
    Top = 214
    Width = 321
    Height = 254
    ColCount = 4
    RowCount = 15
    TabOrder = 2
    OnSetEditText = sgEditSetEditText
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object Panel2: TPanel
    Left = 16
    Top = 167
    Width = 321
    Height = 41
    TabOrder = 3
    object Label2: TLabel
      Left = 16
      Top = 0
      Width = 285
      Height = 26
      Alignment = taCenter
      Caption = 
        'Mark learners present or for bad behaviour with a '#39'y'#39' in the app' +
        'ropriate columns'
      WordWrap = True
    end
  end
  object GroupBox2: TGroupBox
    Left = 343
    Top = 79
    Width = 381
    Height = 389
    Caption = 'Contingency options  '
    TabOrder = 4
    object rgAbsent: TRadioGroup
      Left = 16
      Top = 32
      Width = 345
      Height = 121
      Caption = 'Absent Learners  '
      Items.Strings = (
        'Mark for next detention'
        'Mark for Grade Committee'
        'Mark for Management Team'
        'Select individual')
      TabOrder = 0
    end
    object rgBadBehaviour: TRadioGroup
      Left = 16
      Top = 159
      Width = 345
      Height = 178
      Caption = 'Learners with bad behaviour'
      Items.Strings = (
        'Award demerit for bad behaviour (15 Debits)'
        'Mark for next detention'
        'Mark for Grade Committee'
        'Mark for Management Team'
        'Ignore'
        'Select individual')
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 207
      Top = 351
      Width = 75
      Height = 25
      Caption = 'Process'
      DoubleBuffered = True
      Kind = bkIgnore
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 288
      Top = 350
      Width = 75
      Height = 25
      DoubleBuffered = True
      Kind = bkClose
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = BitBtn2Click
    end
  end
  object adoMdet: TADOConnection
    Left = 16
    Top = 16
  end
  object adoQMD: TADOQuery
    Parameters = <>
    Left = 64
    Top = 16
  end
  object dsMdet: TDataSource
    Left = 120
    Top = 16
  end
end
