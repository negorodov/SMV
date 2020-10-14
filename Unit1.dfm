object Form1: TForm1
  Left = 240
  Top = 180
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057' '#1050' '#1054' '#1051' '#1068' '#1050' '#1054'   '#1052' '#1067'   '#1042' '#1052' '#1045' '#1057' '#1058' '#1045
  ClientHeight = 164
  ClientWidth = 934
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  Icon.Data = {
    0000010001002020040000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCC0
    000CCCC0000000000CCCC8888CCCCCCC0000CCCC00000000CCCC8888CCCCCCCC
    C0000CCCCCCCCCCCCCC8888CCCCC0CCCCC0000CCCCCCCCCCCC8888CCCCC800CC
    C00CCCC0000000000CCCC88CCC88000C0000CCCC00000000CCCC8888C8880000
    00000CCCC000000CCCC888888888C000C00000CCCC0000CCCC88888C888CCC00
    CC00000CCCCCCCCCC88888CC88CCCCC0CCC000CCCCC00CCCCC888CCC8CCCCCCC
    CCCC0CCCCCCCCCCCCCC8CCCCCCCCCCCC0CCCCCCCCCCCCCCCCCCCCCC8CCC80CCC
    00CCCCCCCC0CC0CCCCCCCC88CC8800CC000CCCCCC000000CCCCCC888CC8800CC
    0000CCCC00000000CCCC8888CC8800CC0000C0CCC000000CCC8C8888CC8800CC
    0000C0CCC000000CCC8C8888CC8800CC0000CCCC00000000CCCC8888CC8800CC
    000CCCCCC000000CCCCCC888CC8800CC00CCCCCCCC0CC0CCCCCCCC88CC880CCC
    0CCCCCCCCCCCCCCCCCCCCCC8CCC8CCCCCCCC0CCCCCCCCCCCCCC8CCCCCCCCCCC0
    CCC000CCCCC00CCCCC888CCC8CCCCC00CC00000CCCCCCCCCC88888CC88CCC000
    C00000CCCC0000CCCC88888C888C000000000CCCC000000CCCC888888888000C
    0000CCCC00000000CCCC8888C88800CCC00CCCC0000000000CCCC88CCC880CCC
    CC0000CCCCCCCCCCCC8888CCCCC8CCCCC0000CCCCCCCCCCCCCC8888CCCCCCCCC
    0000CCCC00000000CCCC8888CCCCCCC0000CCCC0000000000CCCC8888CCC0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 87
    Top = 5
    Width = 70
    Height = 20
    Caption = #1053#1072#1095#1072#1083#1086':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 219
    Top = 5
    Width = 82
    Height = 20
    Caption = #1055#1086' '#1082#1072#1082#1086#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 183
    Top = 57
    Width = 95
    Height = 20
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 368
    Top = 8
    Width = 120
    Height = 20
    Caption = #1048#1084#1103' '#1087#1072#1088#1090#1085#1077#1088#1072
  end
  object DateTimePicker1: TDateTimePicker
    Left = 86
    Top = 23
    Width = 104
    Height = 28
    Date = 42131.765381030100000000
    Time = 42131.765381030100000000
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 221
    Top = 23
    Width = 104
    Height = 28
    Date = 42131.765462048600000000
    Time = 42131.765462048600000000
    TabOrder = 1
  end
  object Button1: TButton
    Left = 151
    Top = 84
    Width = 162
    Height = 29
    Caption = #1055#1086#1089#1095#1080#1090#1072#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 596
    Top = 80
    Width = 137
    Height = 33
    Caption = #1055#1086#1079#1076#1088#1072#1074#1083#1077#1085#1080#1077
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 368
    Top = 24
    Width = 121
    Height = 28
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 24
    Top = 120
    Width = 881
    Height = 28
    ReadOnly = True
    TabOrder = 5
  end
  object SpinEdit1: TSpinEdit
    Left = 736
    Top = 80
    Width = 33
    Height = 30
    MaxValue = 9
    MinValue = 1
    TabOrder = 6
    Value = 1
  end
  object Panel1: TPanel
    Left = 616
    Top = 8
    Width = 217
    Height = 73
    TabOrder = 7
    Visible = False
    object Edit3: TEdit
      Left = 8
      Top = 8
      Width = 193
      Height = 28
      TabOrder = 0
    end
    object Button3: TButton
      Left = 48
      Top = 48
      Width = 113
      Height = 17
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object Button4: TButton
    Left = 776
    Top = 80
    Width = 129
    Height = 33
    Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 8
    OnClick = Button4Click
  end
  object MainMenu1: TMainMenu
    Left = 536
    Top = 32
    object N1: TMenuItem
      Caption = #1055#1086#1079#1076#1088#1072#1074#1083#1077#1085#1080#1103
      object N2: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100'/'#1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = N2Click
      end
    end
    object N3: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      object N4: TMenuItem
        Caption = #1052#1072#1085#1080#1092#1077#1089#1090
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1077#1083#1100
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1063#1072#1042#1086
      end
    end
  end
end
