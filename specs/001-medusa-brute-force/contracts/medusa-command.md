# Contrato: Esquema do Exemplo de Comando Medusa

**Phase 1 output** · Feature: `001-medusa-brute-force` · Date: 2026-11-13

A "interface" exposta por este projeto documental é o **formato padronizado dos exemplos de comando** que o leitor encontrará no repositório. Este contrato define o esquema que todo Exemplo de Comando (ver [data-model.md](../data-model.md)) deve seguir, para garantir consistência e que cada parâmetro seja explicado (FR-004, SC-002).

## Esquema da invocação

```text
medusa -h <ALVO> -u <USUARIO> | -U <ARQUIVO_USUARIOS> -P <ARQUIVO_SENHAS> -M <MODULO> [-t <PARALELISMO>] [-f] [-v <NIVEL>]
```

## Parâmetros (contrato)

| Flag | Nome | Obrigatório | Regra |
|------|------|-------------|-------|
| `-h` | Alvo (host) | Sim | Placeholder de laboratório isolado (ex.: `192.168.56.101`); nunca alvo real de terceiro |
| `-u` / `-U` | Usuário único / arquivo de usuários | Sim (um dos dois) | Fictício; `-U` aponta para `wordlists/usuarios.txt` |
| `-P` | Arquivo de senhas (wordlist) | Sim | Fictício; aponta para `wordlists/senhas.txt` |
| `-M` | Módulo de serviço | Sim | Um por exemplo; o conjunto deve cobrir ≥ 2 serviços distintos (ex.: `ssh`, `ftp`) |
| `-t` | Paralelismo (threads) | Opcional | Explicar impacto em velocidade vs. carga/ruído |
| `-f` | Parar no primeiro sucesso | Opcional | Explicar o comportamento |
| `-v` | Verbosidade | Opcional | Explicar nível de detalhe da saída |

## Regras do contrato

1. **Toda flag presente no exemplo DEVE ter explicação em pt-BR** acompanhando o comando (FR-004).
2. **Alvo, usuários e senhas DEVEM ser placeholders/fictícios** (FR-005, SC-004).
3. **O conjunto de exemplos DEVE cobrir ≥ 2 módulos `-M` distintos** (FR-004).
4. **Cada exemplo DEVE indicar o desfecho esperado** (credencial encontrada ou lista esgotada), amarrando com a Evidência de Resultado (FR-006).

## Exemplos de referência (ilustrativos — placeholders)

```bash
# Exemplo A — SSH, lista de usuários x lista de senhas, para no primeiro sucesso
medusa -h 192.168.56.101 -U wordlists/usuarios.txt -P wordlists/senhas.txt -M ssh -t 4 -f

# Exemplo B — FTP, usuário único x lista de senhas
medusa -h 192.168.56.101 -u msfadmin -P wordlists/senhas.txt -M ftp -t 2
```

> Desfecho esperado documentado junto a cada exemplo: `SUCCESS` (credencial encontrada) ou esgotamento da wordlist sem sucesso.
