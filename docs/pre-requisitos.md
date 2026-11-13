# Pré-requisitos

Para reproduzir o laboratório, você precisa de:

## 1. Kali Linux com a Medusa

A Medusa já acompanha o Kali Linux. Verifique a instalação:

```bash
medusa -h | head -n 3
```

Se não estiver presente, instale:

```bash
sudo apt update && sudo apt install -y medusa
```

## 2. Um alvo de laboratório isolado e autorizado

- Uma máquina **sua**, em rede isolada (host-only/interna), com os serviços a testar habilitados (SSH e/ou FTP).
- Exemplos comuns em laboratório introdutório: uma VM propositalmente vulnerável (ex.: Metasploitable 2) ou um contêiner configurado para isso.
- Anote o IP do alvo; nos exemplos usamos `192.168.56.101` (veja [convencoes.md](./convencoes.md)).

> ⚠️ Nunca aponte os comandos para sistemas que não sejam seus ou para os quais você não tenha autorização. Veja [uso-responsavel.md](./uso-responsavel.md).

## 3. Wordlists

- Listas de exemplo deste repositório: `wordlists/usuarios.txt` e `wordlists/senhas.txt`.
- Alternativamente, wordlists públicas do Kali (ex.: `/usr/share/wordlists/rockyou.txt`) — maiores e mais realistas, porém com execução mais longa.

## Verificação rápida

```bash
# Medusa disponível
medusa -d | head            # lista os módulos de serviço

# Conectividade com o alvo
ping -c 2 192.168.56.101
```

Com esses três itens prontos, siga o roteiro em [metodologia.md](./metodologia.md) e os [exemplos.md](./exemplos.md).
