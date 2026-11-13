# Projeto Prático: Brute Force com Medusa no Kali Linux

Projeto prático de segurança da informação que demonstra, de forma didática e em ambiente de laboratório **controlado e autorizado**, como a ferramenta **Medusa** é utilizada no **Kali Linux** para testes de força bruta (brute force) de autenticação em serviços como **SSH** e **FTP**.

> ⚠️ **Uso responsável:** todo o conteúdo pressupõe um laboratório isolado e autorizado. Tentar acessar sistemas de terceiros sem permissão é **crime**. Leia [docs/uso-responsavel.md](docs/uso-responsavel.md) antes de reproduzir qualquer passo.

## Objetivo

Documentar, de ponta a ponta, a metodologia de um ataque de dicionário com a Medusa — do conceito à análise dos resultados — de modo que o conteúdo seja compreensível **apenas pela leitura**, e reproduzível por quem tiver um ambiente de laboratório próprio.

## Contexto

Entrega do desafio prático de brute force com Kali Linux e Medusa. O foco é demonstrar o domínio da técnica e, principalmente, o **entendimento das defesas** correspondentes.

## Ambiente

- **Sistema**: Kali Linux
- **Ferramenta**: Medusa (ataque de login modular e paralelo)
- **Serviços demonstrados**: SSH (porta 22) e FTP (porta 21)
- **Alvo**: máquina de laboratório em rede isolada (placeholders — veja [docs/convencoes.md](docs/convencoes.md))

## Índice

1. [Conceito — brute force e a Medusa](docs/conceito.md)
2. [Metodologia — passo a passo](docs/metodologia.md)
3. [Exemplos de comando (SSH e FTP)](docs/exemplos.md)
4. [Pré-requisitos para reprodução](docs/pre-requisitos.md)
5. [Convenções do laboratório](docs/convencoes.md)
6. [Uso responsável](docs/uso-responsavel.md)
7. [Contramedidas defensivas](docs/defesa.md)
8. [Evidências de execução](evidencias/)

## Estrutura do repositório

```text
README.md              # Este arquivo
docs/                  # Documentação da metodologia e conteúdo didático
├── conceito.md
├── metodologia.md
├── exemplos.md
├── pre-requisitos.md
├── convencoes.md
├── uso-responsavel.md
└── defesa.md
wordlists/             # Listas fictícias de usuários e senhas (laboratório)
├── usuarios.txt
└── senhas.txt
evidencias/            # Capturas/saídas das execuções
```

## Começo rápido

```bash
# Em um Kali Linux, contra o SEU alvo de laboratório isolado:
medusa -h 192.168.56.101 -U wordlists/usuarios.txt -P wordlists/senhas.txt -M ssh -t 4 -f
```

Explicação de cada parâmetro em [docs/exemplos.md](docs/exemplos.md).
