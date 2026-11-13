# Laboratório Isolado (Docker)

Para permitir a execução dos testes de forma **segura, isolada e reprodutível** — sem tocar nenhum sistema real — este projeto inclui um laboratório em contêineres Docker. Ele sobe quatro alvos descartáveis numa rede Docker dedicada (`medusa-lab`), **sem publicar portas no host**.

Todos os arquivos ficam em [`../scripts/`](../scripts/).

## Alvos

| Container | Serviço | Porta | Credencial plantada |
|-----------|---------|-------|---------------------|
| `lab-ftp` | FTP (vsftpd) | 21 | `msfadmin` / `msfadmin` |
| `lab-smb` | SMB (Samba) | 139/445 | `msfadmin` / `msfadmin` |
| `lab-web` | HTTP com autenticação básica (nginx) | 80 | `msfadmin` / `msfadmin` |
| `lab-dvwa` | DVWA (app web vulnerável) | 80 | `admin` / `password` (login padrão) |

> A credencial fraca é plantada de propósito para que o ataque de dicionário tenha o que encontrar. Em um alvo bem configurado, o esperado é a lista se esgotar sem sucesso.

## Subir o laboratório

Pré-requisito: Docker instalado (no Kali: `sudo apt install -y docker.io`).

```bash
cd scripts
chmod +x *.sh            # primeira vez
./lab-up.sh
```

Ou diretamente com o Compose:

```bash
docker compose -p medusa-lab up -d
```

## Executar os ataques

**Opção A — atacando do próprio Kali (recomendado no Kali):**
Descubra o IP de cada alvo e rode a Medusa do host (veja os [exemplos](./exemplos.md)):

```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' lab-ftp
medusa -h <IP_DO_ALVO> -U ../wordlists/usuarios.txt -P ../wordlists/senhas.txt -M ftp -t 4 -f
```

**Opção B — atacante em contêiner (qualquer SO, inclusive Windows/macOS):**

```bash
docker compose -p medusa-lab --profile attacker up -d
./lab-attack.sh
```

O `lab-attack.sh` instala Medusa/Nmap no contêiner atacante, copia as wordlists, faz o reconhecimento com Nmap e executa os três ataques, salvando as saídas em [`../images/`](../images/).

## Derrubar o laboratório

```bash
./lab-down.sh
# ou
docker compose -p medusa-lab --profile attacker down -v
```

## Observações de isolamento

- A rede `medusa-lab` é uma bridge dedicada; os alvos **não** expõem portas ao host nem à LAN.
- Os contêineres são descartáveis: `down -v` remove tudo sem deixar resíduo.
- Ainda assim, trate o laboratório como ambiente autorizado — veja [uso-responsavel.md](./uso-responsavel.md).
