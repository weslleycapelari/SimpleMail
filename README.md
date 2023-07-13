<p align="center">
  <a href="https://github.com/weslleycapelari/SimpleMail/blob/main/img/logo.png">
    <img alt="SimpleMail" height="150" src="https://github.com/weslleycapelari/SimpleMail/blob/main/img/logo.png">
  </a>  
</p><br>
<p align="center">
  <b>SimpleMail</b> is a library to facilitate the sending of messages through <b>SMTP</b> connections.
</p><br>
<p align="center">
  <img src="https://img.shields.io/github/v/release/weslleycapelari/SimpleMail?style=flat-square">
  <img src="https://img.shields.io/github/stars/weslleycapelari/SimpleMail?style=flat-square">
</p>
 
## ⚙️ Installation 

* **Manual installation**: Add the following folders to your project, in *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*

```
../SimpleMail/src
```

* Installation using the [**Boss**](https://github.com/HashLoad/boss):

```
boss install github.com/weslleycapelari/SimpleMail
```

## 🔰 Engines

By default, the library uses the most up-to-date components, in this case the current one is [**Indy**](https://docwiki.embarcadero.com/RADStudio/Alexandria/en/Indy).

## ⚡️ Quickstart

You need to use SimpleMail

```pascal
uses SimpleMail;
```

* **Mail Server**

```pascal
var
  LMailer: IMail;
begin
  LMailer := TMail.New
    .Hostname('smtp.gmail.com')
    .Port(465)
    .Username('example@gmail.com')
    .Password('password')
    .SSL(True)
    .Timeout(10000)
    .Connect;

  if LMailer.IsConnected then
    ShowMessage('Connected')
  else
    ShowMessage('Not Connected');
end;
``` 

* **Message**

```pascal
var
  LMailer : IMail;
  LMessage: IMessage;
begin
  LMailer := TMail.New
    .Hostname('smtp.gmail.com')
    .Port(465)
    .Username('example@gmail.com')
    .Password('password')
    .SSL(True)
    .Timeout(10000)
    .Connect;

  if LMailer.IsConnected then
  begin
    LMessage := LMailer.NewMessage
      .From('example@gmail.com')
      .Recipients('example1@gmail.com;example2@gmail.com')
      .CC('example3@gmail.com;example4@gmail.com')
      .CCo('example5@gmail.com;example6@gmail.com')
      .Subject('Test Email')
      .Body('This is a test message')
      .Send;

    LMailer.SendMessage(LMessage);
  end;
end;
``` 

## 📝 Samples

A project was developed inside the example folder

## 💻 Code Contributors

<img src="https://opencollective.com/SimpleMail/contributors.svg?width=890&button=false" alt="Code Contributors" style="max-width:100%;">

## ⚠️ License

`SimpleMail` is free and open-source software licensed under the [Apache-2.0 License](https://github.com/weslleycapelari/SimpleMail/blob/main/LICENSE). 