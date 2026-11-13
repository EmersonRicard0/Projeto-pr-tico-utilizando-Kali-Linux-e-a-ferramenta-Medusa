# Exemplos de Comando

Dois exemplos representativos, para serviços distintos, com cada parâmetro explicado. Todos usam placeholders de laboratório (veja [convencoes.md](./convencoes.md)) — **nenhum alvo real ou credencial real**.

## Parâmetros da Medusa usados

| Flag | Significado | Observação |
|------|-------------|------------|
| `-h` | Host (alvo) | IP do alvo de laboratório isolado |
| `-u` | Usuário único | Testa um nome de usuário específico |
| `-U` | Arquivo de usuários | Lista de usuários a testar (um por linha) |
| `-P` | Arquivo de senhas | Wordlist de senhas candidatas (uma por linha) |
| `-M` | Módulo do serviço | Define o protocolo alvo (`ssh`, `ftp`, ...) |
| `-t` | Threads (paralelismo) | Nº de tentativas simultâneas; mais = mais rápido, porém mais "barulhento" |
| `-f` | Parar no primeiro sucesso | Encerra ao achar a primeira credencial válida |
| `-v` | Verbosidade | Nível de detalhe da saída (opcional) |

---

## Exemplo A — SSH (lista de usuários × lista de senhas)

```bash
medusa -h 192.168.56.101 -U wordlists/usuarios.txt -P wordlists/senhas.txt -M ssh -t 4 -f
```

**Leitura do comando:**

- `-h 192.168.56.101` — alvo de laboratório (placeholder).
- `-U wordlists/usuarios.txt` — testa cada usuário da lista.
- `-P wordlists/senhas.txt` — para cada usuário, testa cada senha da lista.
- `-M ssh` — usa o módulo SSH (porta 22).
- `-t 4` — 4 tentativas em paralelo.
- `-f` — para assim que encontrar a primeira credencial válida.

**Desfecho esperado:** `credencial-encontrada` (linha `[SUCCESS]` com usuário e senha) **ou** `lista-esgotada` (nenhuma combinação válida).

**Evidência:** ver `evidencias/ssh-resultado.png` (quando capturada em laboratório).

---

## Exemplo B — FTP (usuário único × lista de senhas)

```bash
medusa -h 192.168.56.101 -u msfadmin -P wordlists/senhas.txt -M ftp -t 2
```

**Leitura do comando:**

- `-h 192.168.56.101` — alvo de laboratório (placeholder).
- `-u msfadmin` — testa um único usuário (fictício/típico de laboratório).
- `-P wordlists/senhas.txt` — percorre a lista de senhas para esse usuário.
- `-M ftp` — usa o módulo FTP (porta 21).
- `-t 2` — 2 tentativas em paralelo.

**Desfecho esperado:** `credencial-encontrada` **ou** `lista-esgotada`.

**Evidência:** ver `evidencias/ftp-resultado.png` (quando capturada em laboratório).

---

> Esquema completo do comando e regras em [../specs/001-medusa-brute-force/contracts/medusa-command.md](../specs/001-medusa-brute-force/contracts/medusa-command.md).
