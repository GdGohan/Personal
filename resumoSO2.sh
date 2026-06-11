#!/bin/bash

# Configurações de histórico para manter o resumo acessível
export HISTIGNORE="*resumoSO2.sh*"
export HISTCONTROL=ignoreboth:erasedups:ignorespace

COMANDOS=(
    # --- AULA 9: VIM ---
    "vi <arquivo> # Abrir ou criar arquivo"
    "vi +18 <arquivo> # Abrir na linha 18"
    "view <arquivo> # Abrir em modo leitura"
    "i # Modo de inserção"
    "ESC # Voltar para modo de navegação/comando"
    "dd # Apagar linha"
    "yy # Copiar linha"
    "p # Colar linha copiada"
    ":wq # Salvar e sair"
    ":q! # Sair sem salvar"
    ":set nu # Mostrar números de linha"

    # --- AULA 10: ARQUITETURA ---
    "cat /proc/interrupts # Verificar IRQs"
    "cat /proc/ioports # Verificar portas de I/O"
    "cat /proc/dma # Verificar uso de DMA"
    "lsmod # Listar módulos carregados"
    "modprobe <modulo> # Carregar módulo"
    "rmmod <modulo> # Remover módulo"

    # --- AULA 11: INICIALIZAÇÃO E RUNLEVELS ---
    "runlevel # Verificar RunLevel atual"
    "init 0 # Desligar sistema"
    "init 6 # Reiniciar sistema"
    "systemctl status <servico> # Status de um serviço"
    "shutdown -h now # Desligar imediatamente"
    "reboot # Reiniciar"
    "poweroff # Desligar e cortar energia"

    # --- AULA 12: BOOT E DISCOS ---
    "f12 # Acessar interação do GRUB"
    "fdisk -l # Listar partições"
    "lsblk # Listar blocos de armazenamento"
    "blkid # Identificar UUIDs e sistemas de arquivo"
    "df -h # Verificar partições montadas e espaço"
    "pydf # Versão amigável do df"
    "dd if=/dev/sda of=MBRCOPIA bs=1 count=512 # Backup MBR"

    # --- AULA 12/13: PACOTES E MANUTENÇÃO ---
    "sudo apt-get update # Atualizar repositórios"
    "sudo apt-get install <pacote> # Instalar pacote"
    "sudo apt-get -f install # Corrigir dependências"
    "sudo dpkg --configure -a # Reconfigurar pacotes interrompidos"
    "sudo apt-get clean # Limpar cache de pacotes"
    "sudo apt-get autoremove # Remover pacotes inúteis"
    "fsck /dev/sda1 # Corrigir erros no disco"
    "mkfs.ext3 /dev/sda1 # Formatar partição (CUIDADO!)"

    # --- AULA 14: USUÁRIOS ---
    "adduser <usuario> # Criar novo usuário"
    "userdel -r <usuario> # Remover usuário e diretório home"
    "usermod -aG sudo <usuario> # Dar permissão sudo"
    "su <usuario> # Alternar de usuário"
    "passwd <usuario> # Alterar senha"
    "chmod 755 <arquivo> # Alterar permissões (rwx, r-x, r-x)"
    "less /etc/passwd # Listar usuários do sistema"
)

for cmd in "${COMANDOS[@]}"; do
    history -s "$cmd"
    eval "$cmd"
done