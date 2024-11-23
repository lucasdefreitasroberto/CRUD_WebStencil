program WebStencil;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  System.Types,
  IPPeerServer,
  IPPeerAPI,
  IdHTTPWebBrokerBridge,
  {$IFDEF MSWINDOWS}
  Winapi.Windows,
  {$ENDIF }
  Web.WebReq,
  Web.WebBroker,
  ServerConst in 'ServerConst.pas',
  MainWM in 'MainWM.pas' {MainWebModule: TWebModule};

{$R *.res}

// Função para verificar se a porta está disponível
function VincularPorta(APorta: Integer): Boolean;
var
  ServidorTeste: IIPTestServer;
begin
  Result := True;
  try
    ServidorTeste := PeerFactory.CreatePeer('', IIPTestServer) as IIPTestServer;
    ServidorTeste.TestOpenPort(APorta, nil);
  except
    Result := False;
  end;
end;

// Função para validar a porta fornecida
function VerificarPorta(APorta: Integer): Integer;
begin
  if VincularPorta(APorta) then
    Result := APorta
  else
    Result := 0;
end;

// Procedimento para configurar a porta do servidor
procedure ConfigurarPorta(const Servidor: TIdHTTPWebBrokerBridge; Porta: String);
begin
  if not Servidor.Active then
  begin
    Porta := Porta.Replace(cCommandSetPort, '').Trim;
    if VerificarPorta(Porta.ToInteger) > 0 then
    begin
      Servidor.DefaultPort := Porta.ToInteger;
      Writeln(Format(sPortSet, [Porta]));
    end
    else
      Writeln(Format(sPortInUse, [Porta]));
  end
  else
    Writeln(sServerRunning);
  Write(cArrow);
end;

// Procedimento para iniciar o servidor
procedure IniciarServidor(const Servidor: TIdHTTPWebBrokerBridge);
begin
  if not Servidor.Active then
  begin
    if VerificarPorta(Servidor.DefaultPort) > 0 then
    begin
      Writeln(Format(sStartingServer, [Servidor.DefaultPort]));
      Servidor.Bindings.Clear;
      Servidor.Active := True;
    end
    else
      Writeln(Format(sPortInUse, [Servidor.DefaultPort.ToString]));
  end
  else
    Writeln(sServerRunning);
  Write(cArrow);
end;

// Procedimento para parar o servidor
procedure PararServidor(const Servidor: TIdHTTPWebBrokerBridge);
begin
  if Servidor.Active then
  begin
    Writeln(sStoppingServer);
    Servidor.Active := False;
    Servidor.Bindings.Clear;
    Writeln(sServerStopped);
  end
  else
    Writeln(sServerNotRunning);
  Write(cArrow);
end;

// Procedimento para exibir os comandos disponíveis
procedure EscreverComandos;
begin
  Writeln(sCommands);
  Write(cArrow);
end;

// Procedimento para exibir o status do servidor
procedure EscreverStatus(const Servidor: TIdHTTPWebBrokerBridge);
begin
  Writeln(sIndyVersion + Servidor.SessionList.Version);
  Writeln(sActive + Servidor.Active.ToString(TUseBoolStrs.True));
  Writeln(sPort + Servidor.DefaultPort.ToString);
  Writeln(sSessionID + Servidor.SessionIDCookieName);
  Write(cArrow);
end;

// Procedimento para executar o servidor
procedure ExecutarServidor(APorta: Integer);
var
  Servidor: TIdHTTPWebBrokerBridge;
  Resposta: string;
begin
  Servidor := TIdHTTPWebBrokerBridge.Create(nil);
  try
    Writeln(sWelcomeText);
    Servidor.DefaultPort := APorta;
    IniciarServidor(Servidor);
    Writeln(Format(sServerReady, [APorta]) + #10);
    EscreverComandos;
    while True do
    begin
      Readln(Resposta);
      Resposta := LowerCase(Resposta);
      if Resposta.StartsWith(cCommandSetPort) then
        ConfigurarPorta(Servidor, Resposta)
      else if sametext(Resposta, cCommandStart) then
        IniciarServidor(Servidor)
      else if sametext(Resposta, cCommandStatus) then
        EscreverStatus(Servidor)
      else if sametext(Resposta, cCommandStop) then
        PararServidor(Servidor)
      else if sametext(Resposta, cCommandHelp) then
        EscreverComandos
      else if sametext(Resposta, cCommandExit) then
        if Servidor.Active then
        begin
          PararServidor(Servidor);
          break
        end
        else
          break
      else
      begin
        Writeln(sInvalidCommand);
        Write(cArrow);
      end;
    end;
  finally
    Servidor.Free;
  end;
end;

begin
{$IFDEF MSWINDOWS}
  SetConsoleOutputCP(CP_UTF8);
{$ENDIF}
  try
    if WebRequestHandler <> nil then
      WebRequestHandler.WebModuleClass := WebModuleClass;
    ExecutarServidor(8080);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end
end.

