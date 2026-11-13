# Projeto Prático: Brute Force com Medusa no Kali Linux

Projeto prático de segurança da informação que demonstra, de forma didática e em um laboratório **controlado e isolado**, como a ferramenta **Medusa** é utilizada no **Kali Linux** para testes de força bruta (brute force) de autenticação nos serviços **FTP**, **SMB** e **Web**.

> ⚠️ **Uso responsável:** todo o conteúdo roda em contêineres de laboratório descartáveis, sem tocar sistemas reais. Tentar acessar sistemas de terceiros sem permissão é **crime**. Leia [docs/uso-responsavel.md](docs/uso-responsavel.md) antes de reproduzir qualquer passo.

## Objetivo

Documentar, de ponta a ponta, a metodologia de um ataque de dicionário com a Medusa — do reconhecimento à análise dos resultados — de modo compreensível **apenas pela leitura** e **reprodutível** por qualquer pessoa com Docker e Kali Linux.

## Serviços demonstrados

| Serviço | Módulo Medusa | Porta | Evidência |
|---------|---------------|-------|-----------|
| FTP | `-M ftp` | 21 | [images/01-ftp-medusa.txt](images/01-ftp-medusa.txt) |
| SMB | `-M smbnt` | 139/445 | [images/02-smb-medusa.txt](images/02-smb-medusa.txt) |
| Web (autenticação básica) | `-M http` | 80 | [images/03-web-http-medusa.txt](images/03-web-http-medusa.txt) |

Resultado em todos (credencial fraca plantada no laboratório):

```text
ACCOUNT FOUND: ... User: msfadmin Password: msfadmin [SUCCESS]
```

> Evidências completas (FTP, SMB, Web e Nmap) na pasta [images/](images/).

## Ambiente

- **Sistema**: Kali Linux + Docker
- **Ferramentas**: Medusa (brute force) e Nmap (reconhecimento)
- **Alvos**: contêineres descartáveis (FTP, SMB, Web/nginx e DVWA) em rede Docker isolada `medusa-lab`

## Começo rápido

```bash
# 1. Subir o laboratório isolado (alvos descartáveis)
cd scripts && chmod +x *.sh && ./lab-up.sh

# 2a. Atacar do Kali host (use o IP do alvo) ...
medusa -h <IP_DO_ALVO> -U wordlists/usuarios.txt -P wordlists/senhas.txt -M ftp -t 4 -f

# 2b. ... ou via contêiner atacante, executando os 3 ataques de uma vez
docker compose -p medusa-lab --profile attacker up -d
./lab-attack.sh

# 3. Derrubar o laboratório
./lab-down.sh
```

## Índice

1. [Conceito — brute force e a Medusa](docs/conceito.md)
2. [Metodologia — reconhecimento, execução, análise](docs/metodologia.md)
3. [Exemplos de comando (FTP, SMB, Web)](docs/exemplos.md)
4. [Laboratório isolado (Docker)](docs/laboratorio.md)
5. [Pré-requisitos](docs/pre-requisitos.md)
6. [Convenções do laboratório](docs/convencoes.md)
7. [Uso responsável](docs/uso-responsavel.md)
8. [Contramedidas defensivas](docs/defesa.md)
9. [Evidências de execução](images/)

## Estrutura do repositório

```text
README.md              # Este arquivo
docs/                  # Documentação da metodologia e conteúdo didático
├── conceito.md
├── metodologia.md
├── exemplos.md
├── laboratorio.md
├── pre-requisitos.md
├── convencoes.md
├── uso-responsavel.md
└── defesa.md
scripts/               # Laboratório reprodutível (Docker)
├── docker-compose.yml
├── lab-up.sh / lab-attack.sh / lab-down.sh
└── web/               # Config do alvo web (nginx + .htpasswd)
wordlists/             # Listas fictícias de usuários e senhas
├── usuarios.txt
└── senhas.txt
images/                # Evidências reais das execuções (nmap + medusa)
```
