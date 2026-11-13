#!/usr/bin/env bash
# Derruba e remove todo o laboratório (containers + rede + volumes).
set -euo pipefail
cd "$(dirname "$0")"
echo "[*] Removendo o laboratório 'medusa-lab'..."
docker compose -p medusa-lab --profile attacker down -v
echo "[+] Laboratório removido."
