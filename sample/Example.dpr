program Example;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FrmMain},
  SimpleMail in '..\src\SimpleMail.pas',
  SimpleMail.Mail in '..\src\SimpleMail.Mail.pas',
  SimpleMail.Intf in '..\src\SimpleMail.Intf.pas',
  SimpleMail.Message in '..\src\SimpleMail.Message.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
