unit SimpleMail;

interface

uses
  SimpleMail.Intf,
  SimpleMail.Mail,
  SimpleMail.Message,
  SysUtils,
  IdSMTPBase,
  IdSMTP,
  IdSSL;

type
  IMail    = SimpleMail.Intf.IMail;
  IMessage = SimpleMail.Intf.IMessage;

  TMail    = SimpleMail.Mail.TMail;
  TMessage = SimpleMail.Message.TMessage;

implementation

end.
