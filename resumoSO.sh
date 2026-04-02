#!/bin/bash
export HISTIGNORE="*resumoSO.sh*"
export HISTCONTROL=ignoreboth:erasedups:ignorespace

COMANDOS=(
    "echo 'RESUMO: # --- HARDWARE E DISCO (Aulas 10 e 12) ---'"
    "echo 'RESUMO: top - Monitora CPU, RAM e processos em tempo real (tecle q para sair)'"
    "echo 'RESUMO: pydf / df -h - Mostra partições e espaço livre de forma legível'"
    "echo 'RESUMO: lsblk / blkid - Lista blocos de discos e UUIDs das partições'"
    "echo 'RESUMO: hwinfo --short - Resumo completo do hardware da máquina'"
    "echo 'RESUMO: free -m - Exibe o uso da memória RAM em Megabytes'"

    "echo 'RESUMO: # --- GERENCIAMENTO DE USUÁRIOS E PERMISSÕES (Aulas 14 e 2) ---'"
    "echo 'RESUMO: sudo su - - Torna-se root (Administrador total)'"
    "echo 'RESUMO: adduser <user> / userdel -r - Cria ou remove usuário e sua pasta /home'"
    "echo 'RESUMO: usermod -aG sudo <user> - Adiciona usuário ao grupo de administradores'"
    "echo 'RESUMO: chmod 755 <arq> - Permissão total para dono, leitura/execução para outros'"
    "echo 'RESUMO: chown <user>:<grupo> <arq> - Altera o dono e o grupo de um arquivo'"
    "echo 'RESUMO: w / finger - Mostra quem está logado e detalhes dos usuários'"
    "echo 'RESUMO: type - - verifica o tipo de comando'"
    "echo 'RESUMO: pwd - - mostra o diretório em que estou'"
    "echo 'RESUMO: mkdir - - criar pasta, cp - - copiar arquivo'"
    "echo 'RESUMO: path - - mostra o caminho (pasta e subpastas) que existem no sistema'"
    "echo 'RESUMO: cat - - mostra o conteúdo de um texto'"
    "echo 'RESUMO: man <nome comando> - mostra todas as sintaxes do comando desejado, desde de que sejam comandos externos'"
    "echo 'RESUMO: whatis <nome comando> - mostra a definição do comandos externos'"
    "echo 'RESUMO: uname – imprimi informações do sistema, – a: mostra todas as informações'"
    "echo 'RESUMO: alias <enter> - vai mostrar todos os atalhos já existentes'"
    "echo 'RESUMO: alias <atalho>=‘<comando a ser executado’<enter>'"
    "echo 'RESUMO: unalias – remove o atalho criado'"

    "echo 'RESUMO: # --- PROCESSOS, PRIORIDADE E BACKGROUND (Aulas 6 e 7) ---'"
    "echo 'RESUMO: ps -uxaf - Mostra árvore de processos (quem iniciou o quê)'"
    "echo 'RESUMO: kill -9 <PID> - Encerra um processo travado à força'"
    "echo 'RESUMO: comando & - Executa o programa em background (libera o terminal)'"
    "echo 'RESUMO: jobs / fg / bg - Gerencia processos parados ou em segundo plano'"
    "echo 'RESUMO: nice -n -10 <cmd> - Inicia comando com alta prioridade (NI -20 a 19)'"
    "echo 'RESUMO: renice -n 15 -p <PID> - Diminui a prioridade de um processo rodando'"

    "echo 'RESUMO: # --- MANUTENÇÃO E PACOTES (Aulas 12 e 13) ---'"
    "echo 'RESUMO: apt-get update && apt-get install -f - Atualiza e corrige dependências'"
    "echo 'RESUMO: dpkg --configure -a - Destrava instalações de pacotes interrompidas'"
    "echo 'RESUMO: apt-get autoremove / clean - Limpa pacotes inúteis e cache do sistema'"
    "echo 'RESUMO: shutdown -r +10 - Agenda o reinício do sistema para daqui a 10 min'"

    "echo 'RESUMO: # --- TEXTO, BUSCAS E VIM (Aulas 3, 5, 8 e 9) ---'"
    "echo 'RESUMO: grep -i \"termo\" * - Busca termo em todos arquivos ignorando maiúsculas'"
    "echo 'RESUMO: egrep \"^A|B$\" - Busca linhas que começam com A ou terminam com B'"
    "echo 'RESUMO: > arquivo.txt - Redireciona saída sobrescrevendo o arquivo'"
    "echo 'RESUMO: >> arquivo.txt - Redireciona saída anexando ao final do arquivo'"
    "echo 'RESUMO: VIM: i (inserir), ESC (comando), :wq (salvar/sair), :q! (sair sem salvar)'"

    "echo 'RESUMO: # --- BOOT E INICIALIZAÇÃO (Aula 11) ---'"
    "echo 'RESUMO: runlevel - Verifica o nível de execução atual (Ex: N 5)'"
    "echo 'RESUMO: /etc/default/grub - Arquivo para alterar tempo e opções do BOOT'"
    "echo 'RESUMO: update-grub - Aplica as alterações feitas na configuração do GRUB'"
    
    "echo 'RESUMO: # --- SHELL E COMANDOS INTERNOS/EXTERNOS ---'"
    "echo 'RESUMO: exit / Ctrl+D - Sai do modo administrador (root)'"
    "echo 'RESUMO: history - Mostra o histórico de comandos digitados'"

    "echo 'RESUMO: # --- FILTROS DE TEXTO AVANÇADOS (Aula 3) ---'"
    "echo 'RESUMO: head -n [linhas] <arq> - Mostra o início do arquivo'"
    "echo 'RESUMO: tail -n [linhas] <arq> - Mostra o fim do arquivo'"
    "echo 'RESUMO: sort <arq> - Ordena o conteúdo do arquivo alfabeticamente'"
    "echo 'RESUMO: cut -d\":\" -f1 <arq> - Corta colunas (ex: mostra 1ª coluna antes do :)'"
    "echo 'RESUMO: wc -l <arq> - Conta quantas linhas existem no arquivo'"

    "echo 'RESUMO: # --- GESTÃO DE CONTAS E SENHAS (Aula 14) ---'"
    "echo 'RESUMO: passwd - Altera a própria senha'"
    "echo 'RESUMO: sudo passwd <user> - Altera a senha de outro usuário'"
    "echo 'RESUMO: passwd -l <user> - Bloqueia (lock) a conta do usuário'"
    "echo 'RESUMO: passwd -u <user> - Desbloqueia (unlock) a conta do usuário'"
    "echo 'RESUMO: passwd -d <user> - Deixa o usuário sem senha (acesso livre)'"
    "echo 'RESUMO: less /etc/passwd - Lista todos os usuários registrados no sistema'"
    "echo 'RESUMO: userdel <user> - Remove o usuário mas MANTÉM os arquivos dele'"

    "echo 'RESUMO: # --- TABELA DE PERMISSÕES NUMÉRICAS (CHMOD) ---'"
    "echo 'RESUMO: 0: sem permissão | 1: execução | 2: gravar | 3: gravar/executar'"
    "echo 'RESUMO: 4: ler | 5: ler/executar | 6: ler/gravar | 7: ler/gravar/executar'"
    "echo 'RESUMO: Exemplo: chmod 755 (Dono: tudo | Grupo/Outros: ler/executar)'"
)

for cmd in "${COMANDOS[@]}"; do
    eval "$cmd"
done

#  chmod +x anot.sh (não usar no modo adm, opcional)
#  source anot.sh (coloque espaço antes do comando)
# history | grep "RESUMO"