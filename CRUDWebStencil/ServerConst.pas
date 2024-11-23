unit ServerConst;

interface

resourcestring
  sStartingServer = '🟢 Iniciando o servidor HTTP na porta %d';
  sPortInUse = '❌ Erro: Porta %s já está em uso';
  sPortSet = '🌐 Porta definida para %s';
  sServerRunning = '✅ O servidor já está em execução';

  sStoppingServer = '🛑 Parando o servidor';
  sServerStopped = '🔴 Servidor parado';
  sServerNotRunning = '⚠ O servidor não está em execução';
  sInvalidCommand = '❌ Erro: Comando inválido';
  sIndyVersion = 'ℹ Versão do Indy: ';
  sActive = '✅ Ativo: ';
  sPort = '🌐 Porta: ';
  sSessionID = '🍪 Nome do Cookie de ID de Sessão: ';
  sCommands = '''
      Digite um comando:

       🔸 "start" para iniciar o servidor
       🔸 "stop" para parar o servidor
       🔸 "set port" para alterar a porta padrão
       🔸 "status" para verificar o status do servidor
       🔸 "help" para mostrar os comandos
       🔸 "exit" para fechar a aplicação
      ''';
sWelcomeText = '''
                    ██████╗ ███████╗███╗   ███╗    ██╗   ██╗██╗███╗   ██╗██████╗  ██████╗
                    ██╔══██╗██╔════╝████╗ ████║    ██║   ██║██║████╗  ██║██╔══██╗██╔═══██╗
                    ██████═╝█████╗  ██╔████╔██║    ██║   ██║██║██╔██╗ ██║██║  ██║██║   ██║
                    ██╔══██ ██╔══╝  ██║╚██╔╝██║    ╚██╗ ██╔╝██║██║╚██╗██║██║  ██║██║   ██║
                    ██████═╗███████╗██║ ╚═╝ ██║     ╚████╔╝ ██║██║ ╚████║██████╔╝╚██████╔╝
                    ╚══════╝╚══════╝╚═╝     ╚═╝      ╚═══╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝

  👋 BEM VINDO!

  ''';


  sServerReady = 'Pronto! Acesse http://localhost:%d no seu navegador';

const
  cArrow = #10 + '➡  ';
  cCommandStart = 'start';
  cCommandStop = 'stop';
  cCommandStatus = 'status';
  cCommandHelp = 'help';
  cCommandSetPort = 'set port';
  cCommandExit = 'exit';

implementation

end.

