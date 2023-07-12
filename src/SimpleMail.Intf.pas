unit SimpleMail.Intf;

interface

uses
  IdMessage;

type
  IMessage = interface;

  IMail = interface
    ['{CA7B4B4A-D0C5-4A33-BD3A-8FD94533738E}']
    function Silence(pValue: Boolean): IMail; overload;
    function Silence: Boolean; overload;
    function Hostname(const pHost: string): IMail; overload;
    function Hostname: string; overload;
    function Port(pPort: Integer): IMail; overload;
    function Port: Integer; overload;
    function Username(const pUsername: string): IMail; overload;
    function Username: string; overload;
    function Password(const pPassword: string): IMail; overload;
    function Password: string; overload;
    function SSL(pValue: Boolean): IMail; overload;
    function SSL: Boolean; overload;
    function Timeout(pTimeout: Integer): IMail; overload;
    function Timeout: Integer; overload;
    function Authenticate: Boolean;
    function Connect: IMail;
    function Disconnect: IMail;
    function IsConnected: Boolean;
    function NewMessage: IMessage;
    function SendMessage(pMessage: IMessage): IMail;
  end;

  IMessage = interface
    ['{DAF1B09A-F28C-4912-8CA4-BF35925A52E9}']
    function GetMessage: TIdMessage;
    function Mailer(pMailer: IMail): IMessage; overload;
    function Mailer: IMail; overload;
    function Silence(pValue: Boolean): IMessage; overload;
    function Silence: Boolean; overload;
    function ContentType(const pMime: string): IMessage; overload;
    function ContentType: string; overload;
    function AddBody(const pBody: string): IMessage; overload;
    function ClearBody: IMessage; overload;
    function Body(const pBody: string): IMessage; overload;
    function Body: string; overload;
    function From(const pFrom: string): IMessage; overload;
    function From: string; overload;
    function AddRecipient(const pRecipient: string): IMessage;
    function ClearRecipients: IMessage;
    function Recipients(const pRecipients: string): IMessage; overload;
    function Recipients: string; overload;
    function AddCC(const pCC: string): IMessage;
    function ClearCC: IMessage;
    function CC(const pCC: string): IMessage; overload;
    function CC: string; overload;
    function AddCCo(const pCCo: string): IMessage;
    function ClearCCo: IMessage;
    function CCo(const pCCo: string): IMessage; overload;
    function CCo: string; overload;
    function Subject(const pSubject: string): IMessage; overload;
    function Subject: string; overload;
    function Send: IMessage;
  end;

implementation

end.
