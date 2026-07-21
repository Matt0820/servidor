#!/bin/bash

echo "==================================="
echo " Iniciando Playit..."
echo "==================================="

# Só inicia se ainda não estiver rodando
if ! pgrep -f "playitd.*playitd.sock" >/dev/null; then
    playitd --socket-path /tmp/playitd.sock &
    sleep 3
fi

echo
echo "==================================="
echo " Iniciando Crafty..."
echo "==================================="

cd /workspaces/servidor/Fominhas
source .venv/bin/activate 
cd crafty-4 
exec python3 main.py 
