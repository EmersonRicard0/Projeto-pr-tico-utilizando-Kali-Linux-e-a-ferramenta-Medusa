# Data Model: Projeto Prático de Brute Force com Medusa no Kali Linux

**Phase 1 output** · Feature: `001-medusa-brute-force` · Date: 2026-11-13

Projeto documental: as "entidades" são artefatos de conteúdo do repositório de entrega, não tabelas de banco. Abaixo, cada entidade com seus atributos, relações e regras de validação derivadas dos requisitos (FR) da spec.

---

## Entidade: Repositório de Entrega

Artefato final publicado no GitHub; agrega todos os demais.

| Atributo | Descrição |
|----------|-----------|
| readme | README.md na raiz: objetivo, contexto DIO, ambiente, índice, aviso de uso responsável |
| documentacao | Conjunto de páginas em `docs/` (metodologia, exemplos, uso responsável, defesa) |
| evidencias | Coleção de Evidências de Resultado |
| wordlists | Listas de credenciais fictícias de exemplo |

**Relações**: contém 1 README, N páginas de documentação, 1+ Exemplo de Comando, 1+ Evidência, 1+ Wordlist.

**Regras de validação**:
- MUST ter README na raiz (FR-001, FR-010).
- MUST ser navegável só pela leitura (FR-010, SC-001).

---

## Entidade: Exemplo de Comando

Invocação representativa da Medusa para um serviço, com explicação. Contrato detalhado em [contracts/medusa-command.md](./contracts/medusa-command.md).

| Atributo | Descrição |
|----------|-----------|
| servico | Serviço/módulo alvo (ex.: `ssh`, `ftp`) |
| alvo | Host de laboratório (placeholder, ex.: `192.168.56.101`) |
| usuarios | Usuário único ou arquivo de usuários |
| senhas | Arquivo de senhas (wordlist) |
| opcoes | Paralelismo e outras flags relevantes |
| explicacao | Descrição em pt-BR de cada parâmetro |

**Relações**: referencia 1 Alvo de Laboratório e 1+ Wordlist; pode gerar 1 Evidência de Resultado.

**Regras de validação**:
- MUST existir para ≥ 2 serviços distintos (FR-004).
- Cada parâmetro relevante MUST ser explicado (FR-004, SC-002).
- `alvo`/`usuarios`/`senhas` MUST ser placeholders/fictícios — sem alvo real ou credencial real (FR-005, SC-004).

---

## Entidade: Lista de Credenciais (Wordlist)

Insumo fictício de usuários e senhas.

| Atributo | Descrição |
|----------|-----------|
| tipo | `usuarios` ou `senhas` |
| caminho | Caminho no repo (ex.: `wordlists/senhas.txt`) |
| conteudo | Entradas fictícias, uma por linha |

**Regras de validação**:
- MUST conter apenas dados fictícios/de laboratório, sem dados sensíveis reais (Assumptions, FR-005).

---

## Entidade: Evidência de Resultado

Captura ou saída que demonstra o desfecho de uma execução.

| Atributo | Descrição |
|----------|-----------|
| cenario | Serviço demonstrado (ex.: SSH) |
| formato | Imagem (screenshot) ou bloco de texto de saída |
| desfecho | `credencial-encontrada` ou `lista-esgotada` |
| caminho | Local no repo (ex.: `evidencias/ssh-resultado.png`) |

**Estados do desfecho**:
- `credencial-encontrada` — Medusa reporta login válido (SUCCESS).
- `lista-esgotada` — todas as tentativas falharam (resultado legítimo; Edge Case).

**Regras de validação**:
- MUST existir para ≥ 1 cenário (FR-006, SC-003).

---

## Entidade: Alvo de Laboratório

Serviço em ambiente isolado e autorizado contra o qual os exemplos são demonstrados.

| Atributo | Descrição |
|----------|-----------|
| host | Endereço em rede isolada (placeholder) |
| servico | Serviço exposto (SSH, FTP) |
| autorizacao | Ambiente próprio e autorizado |

**Regras de validação**:
- MUST ser isolado/autorizado; nunca alvo de terceiro (FR-005, FR-007).
