object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Mailer Sample'
  ClientHeight = 430
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Reference Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object pnlBotoes: TPanel
    Left = 0
    Top = 395
    Width = 500
    Height = 35
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 264
    ExplicitWidth = 433
    object btnConnect: TButton
      AlignWithMargins = True
      Left = 421
      Top = 4
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'Connect'
      TabOrder = 0
      OnClick = btnConnectClick
      ExplicitLeft = 354
    end
    object btnSend: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 75
      Height = 27
      Align = alLeft
      Caption = 'Send mail'
      TabOrder = 1
      OnClick = btnSendClick
    end
  end
  object pnlCorpo: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 395
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 433
    ExplicitHeight = 278
    object pnlFields1: TPanel
      Left = 1
      Top = 1
      Width = 498
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = 28
      ExplicitWidth = 431
      object lblHostname: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 60
        Height = 21
        Align = alLeft
        AutoSize = False
        Caption = 'SMTP Host'
        Layout = tlCenter
        ExplicitHeight = 15
      end
      object lblPort: TLabel
        AlignWithMargins = True
        Left = 234
        Top = 3
        Width = 23
        Height = 21
        Align = alRight
        Caption = 'Port'
        Layout = tlCenter
        ExplicitLeft = 487
        ExplicitHeight = 15
      end
      object lblTimeout: TLabel
        AlignWithMargins = True
        Left = 321
        Top = 3
        Width = 46
        Height = 21
        Align = alRight
        Caption = 'Timeout'
        Layout = tlCenter
        ExplicitLeft = 284
        ExplicitHeight = 15
      end
      object edtHostname: TEdit
        AlignWithMargins = True
        Left = 69
        Top = 3
        Width = 159
        Height = 21
        Align = alClient
        TabOrder = 0
        Text = 'smtp.gmail.com'
        ExplicitLeft = 67
        ExplicitWidth = 411
        ExplicitHeight = 23
      end
      object edtPort: TEdit
        AlignWithMargins = True
        Left = 263
        Top = 3
        Width = 52
        Height = 21
        Align = alRight
        TabOrder = 1
        Text = '465'
        ExplicitLeft = 513
        ExplicitHeight = 23
      end
      object chkSSL: TCheckBox
        AlignWithMargins = True
        Left = 431
        Top = 3
        Width = 64
        Height = 21
        Align = alRight
        Caption = 'SSL/TLS'
        Checked = True
        State = cbChecked
        TabOrder = 2
        ExplicitLeft = 423
        ExplicitTop = 0
      end
      object edtTimeout: TEdit
        AlignWithMargins = True
        Left = 373
        Top = 3
        Width = 52
        Height = 21
        Align = alRight
        TabOrder = 3
        Text = '5000'
        ExplicitLeft = 437
      end
    end
    object pnlFields2: TPanel
      Left = 1
      Top = 28
      Width = 498
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 82
      ExplicitWidth = 431
      object lblUsername: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 60
        Height = 21
        Align = alLeft
        AutoSize = False
        Caption = 'Username'
        Layout = tlCenter
      end
      object lblPassword: TLabel
        AlignWithMargins = True
        Left = 287
        Top = 3
        Width = 54
        Height = 21
        Align = alRight
        Caption = 'Password'
        Layout = tlCenter
        ExplicitLeft = 430
        ExplicitHeight = 15
      end
      object edtUsername: TEdit
        AlignWithMargins = True
        Left = 69
        Top = 3
        Width = 212
        Height = 21
        Align = alClient
        TabOrder = 0
        Text = 'example@gmail.com'
        ExplicitLeft = 67
        ExplicitWidth = 349
        ExplicitHeight = 23
      end
      object edtPassword: TEdit
        AlignWithMargins = True
        Left = 347
        Top = 3
        Width = 148
        Height = 21
        Align = alRight
        PasswordChar = '*'
        TabOrder = 1
        ExplicitLeft = 482
        ExplicitHeight = 23
      end
    end
    object grpMessage: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 58
      Width = 492
      Height = 333
      Align = alClient
      Caption = 'Message (* E-mails separated by ;)'
      TabOrder = 2
      ExplicitLeft = 7
      ExplicitWidth = 627
      ExplicitHeight = 404
      object pnlFields3: TPanel
        Left = 2
        Top = 17
        Width = 488
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 1
        ExplicitTop = 109
        ExplicitWidth = 431
        object lblSender: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 56
          Height = 21
          Align = alLeft
          AutoSize = False
          Caption = 'Sender'
          Layout = tlCenter
        end
        object edtSender: TEdit
          AlignWithMargins = True
          Left = 65
          Top = 3
          Width = 420
          Height = 21
          Align = alClient
          TabOrder = 0
          Text = 'example@gmail.com'
          ExplicitLeft = 101
          ExplicitWidth = 519
          ExplicitHeight = 23
        end
      end
      object pnlFields4: TPanel
        Left = 2
        Top = 44
        Width = 488
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 1
        ExplicitTop = 77
        ExplicitWidth = 623
        object lblReceivers: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 56
          Height = 21
          Align = alLeft
          AutoSize = False
          Caption = 'Receivers'
          Layout = tlCenter
          ExplicitHeight = 15
        end
        object edtReceivers: TEdit
          AlignWithMargins = True
          Left = 65
          Top = 3
          Width = 420
          Height = 21
          Align = alClient
          TabOrder = 0
          Text = 'example@gmail.com'
          ExplicitLeft = 55
          ExplicitWidth = 565
          ExplicitHeight = 23
        end
      end
      object pnlFields5: TPanel
        Left = 2
        Top = 71
        Width = 488
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitLeft = 3
        ExplicitTop = 101
        ExplicitWidth = 623
        object lblCc: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 56
          Height = 21
          Align = alLeft
          AutoSize = False
          Caption = 'Cc'
          Layout = tlCenter
          ExplicitHeight = 15
        end
        object edtCc: TEdit
          AlignWithMargins = True
          Left = 65
          Top = 3
          Width = 420
          Height = 21
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 555
          ExplicitHeight = 23
        end
      end
      object pnlFields6: TPanel
        Left = 2
        Top = 98
        Width = 488
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        ExplicitLeft = 1
        ExplicitTop = 183
        ExplicitWidth = 623
        object lblCCo: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 56
          Height = 21
          Align = alLeft
          AutoSize = False
          Caption = 'Cco'
          Layout = tlCenter
          ExplicitHeight = 15
        end
        object edtCCo: TEdit
          AlignWithMargins = True
          Left = 65
          Top = 3
          Width = 420
          Height = 21
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 555
          ExplicitHeight = 23
        end
      end
      object pnlFields61: TPanel
        Left = 2
        Top = 125
        Width = 488
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
        ExplicitTop = 161
        ExplicitWidth = 623
        object lblSubject: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 56
          Height = 21
          Align = alLeft
          AutoSize = False
          Caption = 'Subject'
          Layout = tlCenter
          ExplicitHeight = 15
        end
        object edtSubject: TEdit
          AlignWithMargins = True
          Left = 65
          Top = 3
          Width = 420
          Height = 21
          Align = alClient
          TabOrder = 0
          Text = 'Sample mail'
          ExplicitWidth = 555
          ExplicitHeight = 23
        end
      end
      object grpBody: TGroupBox
        AlignWithMargins = True
        Left = 5
        Top = 155
        Width = 482
        Height = 173
        Align = alClient
        Caption = 'Body'
        TabOrder = 5
        ExplicitLeft = 136
        ExplicitTop = 112
        ExplicitWidth = 185
        ExplicitHeight = 105
        object redtBody: TRichEdit
          AlignWithMargins = True
          Left = 5
          Top = 20
          Width = 472
          Height = 148
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          Lines.Strings = (
            'Test Mail is Success')
          ParentFont = False
          TabOrder = 0
          Zoom = 100
          ExplicitLeft = 80
          ExplicitTop = 84
          ExplicitWidth = 185
          ExplicitHeight = 89
        end
      end
    end
  end
end
