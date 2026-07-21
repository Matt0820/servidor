#!/bin/bash

# Configurações do Git (Altere com seus dados se necessário)
git config --global user.name "Codespace AutoSave"
git config --global user.email "codespace-bot@example.com"

echo "🟢 Script de Auto-salvamento iniciado com sucesso!"

while true; do
    # 1. Aguarda 3 minutos antes do próximo ciclo
    sleep 150  

    echo "💾 Iniciando rotina de salvamento automático..."

    # 2. Força o salvamento de todos os mundos do Minecraft no disco
    # Nota: substitua "save-all" pelo comando correspondente se você usa um wrapper/CLI do Crafty, 
    # ou confie no agendamento interno que você já criou no painel do Crafty.

    # 3. Adiciona as alterações do mundo e configurações no Git
    git add .

    # 4. Verifica se existem mudanças reais a serem salvas
    if ! git diff-index --quiet HEAD --; then
        echo "📦 Alterações detectadas! Enviando progresso para o GitHub..."
        git commit -m "Auto-salvamento automático: $(date '+%Y-%m-%d %H:%M:%S')"
        git push origin main
        echo "✅ Progresso salvo no GitHub com sucesso!"
    else
        echo "💤 Nenhuma alteração nova no mapa detectada."
    fi
done
