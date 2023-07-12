unit SimpleMail.Mail;

interface

uses
  SimpleMail.Intf,
  SimpleMail.Message,
  SysUtils,
  IdExplicitTLSClientServerBase,
  IdSMTP,
  IdPOP3,
  IdSSL,
  IdSSLOpenSSL,
  IdMessage;

type
  TMail = class(TInterfacedObject, IMail)
  private
    FSMTP: TIdSMTP;
    FSilence: Boolean;
    FSSLHandle: TIdSSLIOHandlerSocketOpenSSL;
    constructor Create;
  public
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

    class function New: IMail;
    destructor Destroy; override;
  end;

implementation

{ TMail }

function TMail.Authenticate: Boolean;
begin
  Result := FSMTP.Authenticate;
end;

function TMail.Connect: IMail;
begin
  Result := Self;
  try
    if not FSMTP.Connected then
      FSMTP.Connect;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

constructor TMail.Create;
begin
  FSilence := False;

  FSSLHandle := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  FSSLHandle.SSLOptions.Method := sslvSSLv23;
  FSSLHandle.SSLOptions.Mode   := sslmClient;

  FSMTP := TIdSMTP.Create(nil);

  Timeout(5000);
  SSL(False);
end;

destructor TMail.Destroy;
begin
  FSMTP.Free;
  FSSLHandle.Free;

  inherited;
end;

function TMail.Disconnect: IMail;
begin
  Result := Self;
  try
    if FSMTP.Connected then
      FSMTP.Disconnect;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMail.Hostname: string;
begin
  Result := FSMTP.Host;
end;

function TMail.IsConnected: Boolean;
begin
  Result := FSMTP.Connected;
end;

function TMail.Hostname(const pHost: string): IMail;
begin
  Result := Self;
  try
    if IsConnected then
      raise Exception.Create('Already connected. Disconnect before.');

    FSMTP.Host := pHost;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

class function TMail.New: IMail;
begin
  Result := TMail.Create;
end;

function TMail.Password(const pPassword: string): IMail;
begin
  Result := Self;
  try
    if IsConnected then
      raise Exception.Create('Already connected. Disconnect before.');

    FSMTP.Password := pPassword;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMail.Password: string;
begin
  Result := FSMTP.Password;
end;

function TMail.Port: Integer;
begin
  Result := FSMTP.Port;
end;

function TMail.Port(pPort: Integer): IMail;
begin
  Result := Self;
  try
    if IsConnected then
      raise Exception.Create('Already connected. Disconnect before.');

    FSMTP.Port := pPort;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMail.NewMessage: IMessage;
begin
  Result := TMessage.New
    .Silence(FSilence)
    .Mailer(Self);
end;

function TMail.SendMessage(pMessage: IMessage): IMail;
begin
  Result := Self;
  try
    if not IsConnected then
      Connect;

    FSMTP.Send(pMessage.GetMessage);
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMail.Silence: Boolean;
begin
  Result := FSilence;
end;

function TMail.SSL: Boolean;
begin
  Result := False;
  if @FSMTP.IOHandler <> nil then
    Result := True;
end;

function TMail.Timeout: Integer;
begin
  Result := FSMTP.ConnectTimeout;
end;

function TMail.Timeout(pTimeout: Integer): IMail;
begin
  Result := Self;
  try
    FSMTP.ConnectTimeout := pTimeout;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMail.SSL(pValue: Boolean): IMail;
begin
  Result := Self;
  try
    if IsConnected then
      raise Exception.Create('Already connected. Disconnect before.');

    if pValue then
    begin
      FSMTP.IOHandler := FSSLHandle;
      FSMTP.UseTLS    := utUseImplicitTLS;
    end
    else
    begin
      FSMTP.IOHandler := nil;
      FSMTP.UseTLS    := utNoTLSSupport;
    end;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMail.Username(const pUsername: string): IMail;
begin
  Result := Self;
  try
    if IsConnected then
      raise Exception.Create('Already connected. Disconnect before.');

    FSMTP.Username := pUsername;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMail.Username: string;
begin
  Result := FSMTP.Username;
end;

function TMail.Silence(pValue: Boolean): IMail;
begin
  Result := Self;
  try
    FSilence := pValue;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

end.
