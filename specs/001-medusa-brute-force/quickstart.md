# Quickstart & Validação: Projeto Prático de Brute Force com Medusa

**Phase 1 output** · Feature: `001-medusa-brute-force` · Date: 2026-11-13

Guia para (A) validar a entrega apenas pela leitura e (B) reproduzir opcionalmente um cenário em laboratório isolado. Detalhes de entidades e parâmetros ficam em [data-model.md](./data-model.md) e [contracts/medusa-command.md](./contracts/medusa-command.md).

> ⚠️ **Uso responsável**: execute os comandos abaixo somente contra alvos próprios, em rede isolada e com autorização. Uso contra sistemas de terceiros sem permissão é ilegal.

---

## A. Validação por leitura (não requer execução) — cobre SC-001

Sem nenhum ambiente, confira que o repositório de entrega satisfaz:

- [ ] `README.md` na raiz com objetivo, contexto DIO, ambiente e índice (FR-001)
- [ ] Conceito de brute force + papel da Medusa explicados (FR-002)
- [ ] Metodologia passo a passo documentada (FR-003)
- [ ] ≥ 2 exemplos de comando para serviços distintos, cada parâmetro explicado (FR-004, SC-002)
- [ ] Exemplos usam apenas placeholders/alvos de laboratório (FR-005, SC-004)
- [ ] ≥ 1 evidência de resultado incluída (FR-006, SC-003)
- [ ] Seção de uso responsável presente (FR-007)
- [ ] ≥ 3 contramedidas defensivas listadas (FR-008, SC-005)
- [ ] Pré-requisitos de reprodução documentados (FR-009)
- [ ] Estrutura navegável só pela leitura (FR-010)

**Resultado esperado**: um leitor explica o fluxo completo em < 15 min.

---

## B. Reprodução em laboratório (opcional) — cobre SC-006

### Pré-requisitos

- Kali Linux com a Medusa disponível. Verificar:
  ```bash
  medusa -h | head -n 3        # mostra versão/ajuda
  # se ausente: sudo apt update && sudo apt install -y medusa
  ```
- Um alvo de laboratório isolado e autorizado (ex.: VM Metasploitable 2 ou contêiner com SSH/FTP) acessível por IP de rede isolada.
- Wordlists de exemplo do repo (`wordlists/usuarios.txt`, `wordlists/senhas.txt`).

### Passos (cenário SSH)

```bash
# 1. Confirmar conectividade com o alvo de laboratório (placeholder de IP)
ping -c 2 192.168.56.101

# 2. Executar o exemplo documentado (ver contracts/medusa-command.md)
medusa -h 192.168.56.101 -U wordlists/usuarios.txt -P wordlists/senhas.txt -M ssh -t 4 -f
```

### Resultado esperado

- **Credencial encontrada**: a Medusa imprime uma linha `ACCOUNT FOUND` / `[SUCCESS]` com usuário e senha → salvar como `evidencias/ssh-resultado.png` (desfecho `credencial-encontrada`).
- **Lista esgotada**: todas as tentativas falham e a execução termina sem sucesso → também é um resultado válido a documentar (desfecho `lista-esgotada`, Edge Case).

### Repetir para FTP

Trocar o módulo e os parâmetros conforme o Exemplo B do contrato (`-M ftp`), conferindo o mesmo tipo de desfecho.

---

## Critérios de pronto (amarração com Success Criteria)

| Verificação | Critério |
|-------------|----------|
| Leitura explica o fluxo em < 15 min | SC-001 |
| ≥ 2 serviços com parâmetros 100% explicados | SC-002 |
| ≥ 1 evidência incluída | SC-003 |
| 100% placeholders, sem alvo/credencial real | SC-004 |
| Uso responsável + ≥ 3 contramedidas | SC-005 |
| Reprodução de ≥ 1 cenário só com o repo | SC-006 |
