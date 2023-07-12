unit SimpleMail.Message;

interface

uses
  SimpleMail.Intf,
  Classes,
  SysUtils,
  IdSMTPBase,
  IdMessage;

type
  TMessage = class(TInterfacedObject, IMessage)
  private
    FMessage   : TIdMessage;
    FSilence   : Boolean;
    FRecipients: TStringList;
    FCC        : TStringList;
    FCCo       : TStringList;
    FMailer    : IMail;
    constructor Create;
    procedure UpdateMessageRecipients;
    procedure UpdateMessageCC;
    procedure UpdateMessageCCo;

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
  public

    class function New: IMessage;
    destructor Destroy; override;
  end;

implementation

{ TMessage }

function TMessage.AddBody(const pBody: string): IMessage;
begin
  Result := Self;
  try
    FMessage.Body.Add(pBody);
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMessage.Body(const pBody: string): IMessage;
begin
  Result := Self;
  try
    FMessage.Body.Text := pBody;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMessage.AddCC(const pCC: string): IMessage;
begin
  Result := Self;
  try
    FCC.Add(pCC);
    UpdateMessageCC;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMessage.AddCCo(const pCCo: string): IMessage;
begin
  Result := Self;
  try
    FCCo.Add(pCCo);
    UpdateMessageCCo;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMessage.AddRecipient(const pRecipient: string): IMessage;
begin
  Result := Self;
  try
    FRecipients.Add(pRecipient);
    UpdateMessageRecipients;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMessage.Body: string;
begin
  Result := FMessage.Body.Text;
end;

function TMessage.CC(const pCC: string): IMessage;
begin
  Result := Self;
  try
    FCC.DelimitedText := pCC;
    UpdateMessageCC;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMessage.CC: string;
begin
  Result := FCC.Text;
end;

function TMessage.CCo: string;
begin
  Result := FCC.Text;
end;

function TMessage.CCo(const pCCo: string): IMessage;
begin
  Result := Self;
  try
    FCCo.DelimitedText := pCCo;
    UpdateMessageCCo;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMessage.ClearBody: IMessage;
begin
  Result := Self;
  try
    FMessage.Body.Clear;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMessage.ClearCC: IMessage;
begin
  Result := Self;
  try
    FCC.Clear;
    UpdateMessageCC;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMessage.ClearCCo: IMessage;
begin
  Result := Self;
  try
    FCCo.Clear;
    UpdateMessageCCo;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMessage.ClearRecipients: IMessage;
begin
  Result := Self;
  try
    FRecipients.Clear;
    UpdateMessageRecipients;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMessage.ContentType: string;
begin
  Result := FMessage.ContentType;
end;

function TMessage.ContentType(const pMime: string): IMessage;
begin
  Result := Self;
  try
    FMessage.ContentType := pMime;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

constructor TMessage.Create;
begin
  FSilence := False;

  FCC         := TStringList.Create;
  FCCo        := TStringList.Create;
  FRecipients := TStringList.Create;
  FCC.Delimiter         := ';';
  FCCo.Delimiter        := ';';
  FRecipients.Delimiter := ';';

  FMessage := TIdMessage.Create(nil);

  ContentType('text/html');
end;

destructor TMessage.Destroy;
begin
  FMessage.Free;

  inherited;
end;

function TMessage.From: string;
begin
  Result := FMessage.From.Address;
end;

function TMessage.GetMessage: TIdMessage;
begin
  Result := FMessage;
end;

function TMessage.Mailer: IMail;
begin
  Result := FMailer;
end;

function TMessage.Mailer(pMailer: IMail): IMessage;
begin
  Result := Self;
  try
    FMailer := pMailer;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMessage.From(const pFrom: string): IMessage;
begin
  Result := Self;
  try
    FMessage.From.Address := pFrom;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

class function TMessage.New: IMessage;
begin
  Result := TMessage.Create;
end;

function TMessage.Recipients(const pRecipients: string): IMessage;
begin
  Result := Self;
  try
    FRecipients.DelimitedText := pRecipients;
    UpdateMessageRecipients;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMessage.Recipients: string;
begin
  Result := FRecipients.Text;
end;

function TMessage.Silence(pValue: Boolean): IMessage;
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

function TMessage.Send: IMessage;
begin
  Result := Self;
  try
    if not Assigned(FMailer) then
      raise Exception.Create('Mailer not found. Define before send e-mail.');

    FMailer.SendMessage(Self);
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

function TMessage.Silence: Boolean;
begin
  Result := FSilence;
end;

function TMessage.Subject: string;
begin
  Result := FMessage.Subject;
end;

function TMessage.Subject(const pSubject: string): IMessage;
begin
  Result := Self;
  try
    FMessage.Subject := pSubject;
  except
    on E: Exception do
      if not FSilence then
        raise Exception.Create(E.Message);
  end;
end;

procedure TMessage.UpdateMessageCC;
var
  I: Integer;
begin
  FMessage.CCList.Clear;
  for I := 0 to (FCC.Count - 1) do
  begin
    with FMessage.CCList.Add do
    begin
      Name    := '';
      Address := FCC[I];
    end;
  end;
end;

procedure TMessage.UpdateMessageCCo;
var
  I: Integer;
begin
  FMessage.BccList.Clear;
  for I := 0 to (FCCo.Count - 1) do
  begin
    with FMessage.BccList.Add do
    begin
      Name    := '';
      Address := FCCo[I];
    end;
  end;
end;

procedure TMessage.UpdateMessageRecipients;
var
  I: Integer;
begin
  FMessage.Recipients.Clear;
  for I := 0 to (FRecipients.Count - 1) do
  begin
    with FMessage.Recipients.Add do
    begin
      Name    := '';
      Address := FRecipients[I];
    end;
  end;
end;

end.
