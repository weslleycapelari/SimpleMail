unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  SimpleMail, Vcl.ComCtrls;

type
  TFrmMain = class(TForm)
    pnlBotoes: TPanel;
    btnConnect: TButton;
    btnSend: TButton;
    pnlCorpo: TPanel;
    pnlFields1: TPanel;
    lblHostname: TLabel;
    lblPort: TLabel;
    edtHostname: TEdit;
    edtPort: TEdit;
    pnlFields2: TPanel;
    lblUsername: TLabel;
    lblPassword: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    chkSSL: TCheckBox;
    grpMessage: TGroupBox;
    pnlFields3: TPanel;
    lblSender: TLabel;
    edtSender: TEdit;
    pnlFields4: TPanel;
    lblReceivers: TLabel;
    edtReceivers: TEdit;
    pnlFields5: TPanel;
    lblCc: TLabel;
    edtCc: TEdit;
    pnlFields6: TPanel;
    lblCCo: TLabel;
    edtCCo: TEdit;
    pnlFields61: TPanel;
    lblSubject: TLabel;
    edtSubject: TEdit;
    redtBody: TRichEdit;
    grpBody: TGroupBox;
    lblTimeout: TLabel;
    edtTimeout: TEdit;
    procedure btnConnectClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
  private
    { Private declarations }
    LMail: IMail;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;


implementation

{$R *.dfm}

procedure TFrmMain.btnConnectClick(Sender: TObject);
begin
  if not Assigned(LMail) then
    LMail := TMail.New
  else if LMail.IsConnected then
    LMail.Disconnect;

  LMail.Silence(False)
    .Hostname(edtHostname.Text)
    .Port(StrToInt(edtPort.Text))
    .Username(edtUsername.Text)
    .Password(edtPassword.Text)
    .SSL(chkSSL.Checked)
    .Timeout(StrToInt(edtTimeout.Text));

  try
    LMail.Connect;
  except
    on E: Exception do
      ShowMessage('Cannot connect to server!');
  end;
end;

procedure TFrmMain.btnSendClick(Sender: TObject);
var
  LMessage: IMessage;
begin
  if not Assigned(LMail) then
    btnConnect.Click;

  LMessage := LMail.NewMessage
    .From(edtSender.Text)
    .Recipients(edtReceivers.Text)
    .CC(edtCc.Text)
    .CCo(edtCCo.Text)
    .Subject(edtSubject.Text)
    .Body(redtBody.Lines.Text);

  try
    LMessage.Send;
  except
    on E: Exception do
      ShowMessage('Cannot send mail!');
  end;
end;

end.
