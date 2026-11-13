# Metodologia

O laboratório segue seis etapas. A mesma metodologia serve para qualquer serviço suportado pela Medusa — muda o módulo (`-M`) e detalhes do alvo.

## 1. Preparação do alvo de laboratório

- Use alvos **próprios e isolados**. Este projeto fornece um [laboratório Docker](./laboratorio.md) com alvos FTP, SMB, Web (auth básica) e DVWA numa rede dedicada, sem expor portas ao host.
- Suba o laboratório:

  ```bash
  cd scripts && ./lab-up.sh
  ```

## 2. Reconhecimento (Nmap)

Antes de atacar, identifique os serviços e portas abertas do alvo:

```bash
nmap -Pn -sV -p 21,80,139,445 lab-ftp lab-smb lab-web lab-dvwa
```

Isso confirma quais serviços estão ativos (FTP/21, HTTP/80, SMB/139-445) e orienta a escolha do módulo. Saída de referência em [`../images/00-nmap.txt`](../images/00-nmap.txt).

## 3. Escolha do serviço e do módulo

Cada serviço corresponde a um módulo da Medusa:

| Serviço | Módulo | Porta |
|---------|--------|-------|
| FTP | `-M ftp` | 21 |
| SMB | `-M smbnt` | 139/445 |
| Web (auth básica) | `-M http` | 80 |

- Lista completa de módulos: `medusa -d`
- Opções de um módulo: `medusa -M <módulo> -q`

## 4. Montagem das listas (wordlists)

- **Usuários**: `wordlists/usuarios.txt`.
- **Senhas**: `wordlists/senhas.txt`.
- Listas pequenas tornam a demonstração rápida e a saída legível. Em cenários maiores, wordlists públicas do Kali (ex.: `/usr/share/wordlists/rockyou.txt`) podem ser usadas.

## 5. Execução

Estrutura geral (detalhes e saídas reais em [exemplos.md](./exemplos.md)):

```bash
medusa -h <ALVO> -U wordlists/usuarios.txt -P wordlists/senhas.txt -M <MÓDULO> [-m <OPÇÃO>] [-t <N>] [-f]
```

Atalho: com o laboratório de pé, `cd scripts && ./lab-attack.sh` executa o reconhecimento e os três ataques, salvando tudo em `../images/`.

## 6. Análise de resultados

Dois desfechos possíveis, ambos legítimos:

- **Credencial encontrada** — linha `ACCOUNT FOUND ... [SUCCESS]` com usuário e senha.
- **Lista esgotada** — todas as combinações testadas sem sucesso (indica que as credenciais testadas não constam nas listas).

Registre a saída como evidência (pasta [`../images/`](../images/)).

> ⚠️ Atenção ao módulo `smbnt` contra Samba moderno: pode gerar falsos positivos por incompatibilidade de SMBv1 — veja a nota em [exemplos.md](./exemplos.md).

> ⚠️ Execute apenas contra o seu alvo autorizado. Veja [uso-responsavel.md](./uso-responsavel.md).
