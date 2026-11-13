#!/usr/bin/env bash
# Sobe o laboratório isolado (alvos FTP, SMB, Web e DVWA).
# Uso exclusivo em ambiente autorizado e controlado.
set -euo pipefail
cd "$(dirname "$0")"

echo "[*] Subindo alvos do laboratório na rede 'medusa-lab'..."
docker compose -p medusa-lab up -d

echo "[*] Containers no ar:"
docker ps --filter "network=medusa-lab" --format "  {{.Names}}  {{.Image}}  {{.Status}}"

cat <<'EOF'

[+] Laboratório pronto. Alvos (acessíveis por nome dentro da rede 'medusa-lab'):
      lab-ftp   -> FTP  (21)
      lab-smb   -> SMB  (139/445)
      lab-web   -> HTTP com autenticação básica (80)
      lab-dvwa  -> DVWA (80)

    Credencial plantada em todos: msfadmin / msfadmin

    Para atacar a partir de um Kali host, use o IP de cada container:
      docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' lab-ftp

    Ou rode o atacante em container:
      docker compose -p medusa-lab --profile attacker up -d
      ./lab-attack.sh
EOF
