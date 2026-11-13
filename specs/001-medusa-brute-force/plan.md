# Implementation Plan: Projeto Prático de Brute Force com Medusa no Kali Linux

**Branch**: `001-medusa-brute-force` | **Date**: 2026-11-13 | **Spec**: [spec.md](./spec.md)

**Input**: Feature specification from `/specs/001-medusa-brute-force/spec.md`

## Summary

Entregar um **repositório GitHub documental** para o desafio da DIO que ensina, de forma reprodutível e eticamente enquadrada, como usar a ferramenta Medusa no Kali Linux para testes de brute force de autenticação em ambiente de laboratório autorizado. O "produto" não é software executável, e sim um conjunto de artefatos de conteúdo (README, metodologia, exemplos de comando explicados, evidências de resultado e seções de uso responsável/defesa). A abordagem técnica é: estruturar o repositório em Markdown + pasta de evidências, produzir exemplos representativos para SSH e FTP contra alvos de laboratório (placeholders), e validar a entrega pelo próprio conteúdo (leitura) e por uma reprodução opcional em ambiente isolado.

## Technical Context

**Language/Version**: Markdown (GitHub Flavored Markdown); exemplos de comando em shell Bash (Kali Linux)

**Primary Dependencies**: Medusa (ferramenta de brute force, disponível no Kali Linux); Git/GitHub para versionamento e entrega. Para reprodução opcional: um alvo de laboratório (ex.: VM Metasploitable ou contêiner com SSH/FTP em rede isolada) e wordlists de exemplo

**Storage**: N/A (arquivos versionados no repositório; evidências como imagens/saídas de texto)

**Testing**: Validação por checklist de conteúdo + revisão do `quickstart.md`; reprodução manual opcional de um cenário em laboratório isolado conferindo a saída esperada

**Target Platform**: Repositório GitHub (leitura em qualquer navegador); execução dos exemplos em Kali Linux

**Project Type**: Projeto de documentação / conteúdo educacional (não há código de aplicação)

**Performance Goals**: N/A em termos de software. Meta de legibilidade: leitor compreende o fluxo completo em < 15 min lendo apenas o repositório (SC-001)

**Constraints**: Uso exclusivo em ambiente autorizado e isolado; nenhum alvo real de terceiro ou credencial real (apenas placeholders/laboratório); conteúdo em pt-BR

**Scale/Scope**: Repositório pequeno — 1 README raiz, documentação de metodologia, ≥ 2 exemplos de comando (SSH, FTP), ≥ 1 evidência de resultado, seções de uso responsável e de contramedidas defensivas

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

A constituição do projeto (`.specify/memory/constitution.md`) ainda está como **template não preenchido** — não define princípios concretos, portanto **não há gates formais aplicáveis** neste momento. Não há violações a justificar.

Princípios implícitos adotados por este plano (a serem formalizados via `/speckit-constitution`, recomendado):

- **Uso ético e autorizado (NÃO-NEGOCIÁVEL)**: todo conteúdo pressupõe laboratório isolado e autorizado; proibido alvo real de terceiros ou credencial real.
- **Valor didático**: a entrega deve ser compreensível apenas pela leitura, para avaliação sem execução.
- **Reprodutibilidade**: instruções suficientes para reproduzir ≥ 1 cenário em ambiente isolado.
- **Enquadramento defensivo**: toda técnica ofensiva acompanhada de contramedidas.

→ **Gate: PASS** (sem gates formais; princípios implícitos respeitados).

## Project Structure

### Documentation (this feature)

```text
specs/001-medusa-brute-force/
├── plan.md              # This file (/speckit-plan command output)
├── research.md          # Phase 0 output (/speckit-plan command)
├── data-model.md        # Phase 1 output (/speckit-plan command)
├── quickstart.md        # Phase 1 output (/speckit-plan command)
├── contracts/           # Phase 1 output (/speckit-plan command)
│   └── medusa-command.md # Esquema/contrato dos exemplos de comando Medusa
└── tasks.md             # Phase 2 output (/speckit-tasks command - NOT created by /speckit-plan)
```

### Source Code (repository root)

Este é um projeto de documentação; o "código-fonte" é o conteúdo do repositório de entrega. Layout proposto para a raiz do repositório GitHub:

```text
README.md                 # Visão geral, objetivo, ambiente, índice, aviso de uso responsável
docs/
├── metodologia.md        # Passo a passo (preparação → serviço → wordlists → execução → análise)
├── exemplos.md           # Exemplos de comando Medusa (SSH, FTP) com cada parâmetro explicado
├── uso-responsavel.md    # Autorização, legalidade, escopo de laboratório
└── defesa.md             # Contramedidas contra brute force (≥ 3)
wordlists/
├── usuarios.txt          # Lista fictícia de usuários (exemplo de laboratório)
└── senhas.txt            # Lista fictícia de senhas (exemplo de laboratório)
evidencias/
├── ssh-resultado.png     # Evidência de execução (credencial encontrada / lista esgotada)
└── ftp-resultado.png     # (opcional) evidência adicional
```

**Structure Decision**: Estrutura de repositório de documentação única. `README.md` na raiz como porta de entrada (FR-001), conteúdo detalhado em `docs/`, insumos de exemplo em `wordlists/`, e provas em `evidencias/`. Não há `src/`/`tests/` de software porque não há aplicação a construir — a validação é por leitura e reprodução manual (ver `quickstart.md`).

## Complexity Tracking

> Nenhuma violação de constituição a justificar (sem gates formais definidos). Tabela não aplicável.
