---
description: "Task list for feature implementation"
---

# Tasks: Projeto Prático de Brute Force com Medusa no Kali Linux

**Input**: Design documents from `/specs/001-medusa-brute-force/`

**Prerequisites**: plan.md (required), spec.md (required), research.md, data-model.md, contracts/, quickstart.md

**Tests**: Não solicitados — projeto documental, sem código executável. Nenhuma tarefa de teste gerada.

**Organization**: Tarefas agrupadas por user story, cada uma entregável e verificável de forma independente.

> ⚠️ **Regra do projeto**: nenhum conteúdo, arquivo ou commit pode citar IA, assistente ou ferramentas de IA. Texto em pt-BR, em primeira pessoa do autor. Apenas placeholders/alvos de laboratório — nunca alvo real ou credencial real.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Pode rodar em paralelo (arquivos diferentes, sem dependências)
- **[Story]**: User story a que a tarefa pertence (US1, US2, US3)

---

## Phase 1: Setup (Estrutura do Repositório)

**Purpose**: Inicializar a estrutura do repositório de entrega

- [X] T001 Criar a estrutura de pastas do repositório na raiz: `docs/`, `wordlists/`, `evidencias/`
- [X] T002 [P] Criar `.gitignore` adequado (ignorar artefatos locais, saídas temporárias; manter `wordlists/` e `evidencias/`)
- [X] T003 [P] Definir no topo do repositório a convenção de placeholders (ex.: IP `192.168.56.101`, usuários/senhas fictícios) a ser usada em todos os exemplos — registrar em `docs/convencoes.md`

**Checkpoint**: Estrutura pronta para receber o conteúdo.

---

## Phase 2: Foundational (Pré-requisitos Bloqueantes)

**Purpose**: Base compartilhada por todas as stories

**⚠️ CRITICAL**: Nenhuma user story pode ser concluída antes desta fase

- [X] T004 Criar o esqueleto do `README.md` na raiz com seções-âncora (Objetivo, Contexto DIO, Ambiente, Índice, Aviso de uso responsável) — conteúdo detalhado preenchido nas stories (FR-001)
- [X] T005 Incluir no `README.md` o aviso curto e destacado de uso responsável/autorização apontando para `docs/uso-responsavel.md` (FR-007, baseline exigido já no README)

**Checkpoint**: README navegável e aviso ético presente — stories podem começar.

---

## Phase 3: User Story 1 - Avaliador entende a metodologia só pela leitura (Priority: P1) 🎯 MVP

**Goal**: Documentação autossuficiente que explica brute force, o papel da Medusa e a metodologia com exemplos de comando explicados.

**Independent Test**: Um leitor sem ambiente explica o fluxo completo e o significado dos parâmetros lendo apenas o repositório em < 15 min (SC-001).

### Implementation for User Story 1

- [X] T006 [P] [US1] Escrever `docs/conceito.md` explicando, em linguagem acessível (pt-BR), o que é brute force de autenticação e o papel da Medusa (FR-002)
- [X] T007 [P] [US1] Escrever `docs/metodologia.md` com o passo a passo: preparação do alvo de laboratório → escolha do serviço → montagem das wordlists → execução → análise de resultados (FR-003)
- [X] T008 [US1] Escrever `docs/exemplos.md` com ≥ 2 exemplos de comando Medusa para serviços distintos (SSH e FTP), seguindo o esquema de `contracts/medusa-command.md`; cada flag relevante (`-h`, `-u`/`-U`, `-P`, `-M`, `-t`, `-f`, `-v`) explicada em pt-BR (FR-004, SC-002)
- [X] T009 [US1] Em `docs/exemplos.md`, usar exclusivamente placeholders/alvos de laboratório conforme `docs/convencoes.md`; garantir ausência de alvo real ou credencial real (FR-005, SC-004)
- [X] T010 [US1] Em cada exemplo de `docs/exemplos.md`, indicar o desfecho esperado (`credencial-encontrada` ou `lista-esgotada`) (data-model §Evidência; contrato regra 4)
- [X] T011 [US1] Preencher no `README.md` o Objetivo, Contexto DIO, Ambiente (Kali + Medusa) e o Índice com links para `docs/conceito.md`, `docs/metodologia.md`, `docs/exemplos.md` (FR-001, FR-010)

**Checkpoint**: MVP — repositório já avaliável apenas pela leitura.

---

## Phase 4: User Story 2 - Estudante reproduz o laboratório em ambiente autorizado (Priority: P2)

**Goal**: Instruções e insumos suficientes para reproduzir ≥ 1 cenário em laboratório isolado, com evidência do resultado.

**Independent Test**: Seguindo só o repositório, reproduzir ≥ 1 cenário (ex.: SSH) em ambiente isolado e obter o desfecho descrito (SC-006).

### Implementation for User Story 2

- [X] T012 [P] [US2] Criar `wordlists/usuarios.txt` com usuários fictícios (uma entrada por linha) (data-model §Wordlist; FR-005)
- [X] T013 [P] [US2] Criar `wordlists/senhas.txt` com senhas fictícias pequenas (uma por linha), adequadas a uma demonstração rápida (data-model §Wordlist; research §Decision 4)
- [X] T014 [US2] Escrever `docs/pre-requisitos.md` com pré-requisitos de reprodução (Medusa no Kali, alvo de laboratório isolado, wordlists) e como verificar a Medusa (FR-009; quickstart §B)
- [X] T015 [US2] Documentar em `docs/metodologia.md` (ou `docs/reproducao.md`) o roteiro executável para o cenário SSH e a troca de módulo para FTP, alinhado ao `quickstart.md` (FR-003; Edge Case de serviço diferente)
- [ ] T016 [US2] Capturar e salvar ≥ 1 evidência de resultado em `evidencias/` (ex.: `evidencias/ssh-resultado.png`) mostrando `credencial-encontrada` e/ou `lista-esgotada`; referenciá-la em `docs/exemplos.md` (FR-006, SC-003)
- [X] T017 [US2] Atualizar o Índice do `README.md` com links para `docs/pre-requisitos.md` e a seção de evidências

**Checkpoint**: US1 + US2 funcionam de forma independente; laboratório reprodutível.

---

## Phase 5: User Story 3 - Leitor compreende limites éticos/legais e defesas (Priority: P3)

**Goal**: Deixar explícitos o uso autorizado e as contramedidas defensivas.

**Independent Test**: O repositório contém seção clara de uso responsável e ≥ 3 contramedidas identificáveis (SC-005).

### Implementation for User Story 3

- [X] T018 [P] [US3] Escrever `docs/uso-responsavel.md`: ambiente autorizado/controlado, ilegalidade do uso contra terceiros sem permissão, escopo de laboratório (FR-007, US3)
- [X] T019 [P] [US3] Escrever `docs/defesa.md` com ≥ 3 contramedidas concretas contra brute force (ex.: política de senhas fortes, bloqueio por tentativas/rate limiting, MFA, fail2ban) (FR-008, SC-005)
- [X] T020 [US3] Atualizar o Índice do `README.md` com links para `docs/uso-responsavel.md` e `docs/defesa.md`

**Checkpoint**: Todas as stories independentemente completas.

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Consistência e validação final

- [X] T021 [P] Revisar todos os arquivos garantindo **nenhuma** menção a IA, assistente ou ferramentas de IA, e texto em pt-BR na primeira pessoa do autor (regra do projeto)
- [X] T022 [P] Auditar 100% dos exemplos/evidências para confirmar apenas placeholders/laboratório — sem alvo real ou credencial real (SC-004)
- [X] T023 Verificar consistência entre `README.md`, `docs/exemplos.md` e `contracts/medusa-command.md` (serviços, flags, desfechos)
- [X] T024 Conferir links do Índice do `README.md` e navegabilidade de ponta a ponta (FR-010)
- [X] T025 Rodar a validação por leitura do `quickstart.md §A` (checklist de FRs) e marcar pendências
- [ ] T026 Preparar o repositório para publicação no GitHub (confirmar que commits não contêm linhas de atribuição de IA)

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: sem dependências
- **Foundational (Phase 2)**: depende do Setup — BLOQUEIA as stories
- **User Stories (Phase 3–5)**: dependem da Foundational; podem ser escritas em paralelo (equipe), ou em ordem P1 → P2 → P3
- **Polish (Phase 6)**: depende das stories desejadas concluídas

### User Story Dependencies

- **US1 (P1)**: após Foundational — sem dependência de outras stories (MVP)
- **US2 (P2)**: após Foundational — T016 referencia `docs/exemplos.md` (US1); escrever US1 antes é recomendado, mas US2 é testável de forma independente
- **US3 (P3)**: após Foundational — independente (o aviso baseline já existe desde T005)

### Parallel Opportunities

- Setup: T002 e T003 em paralelo
- US1: T006 e T007 em paralelo (arquivos diferentes)
- US2: T012 e T013 em paralelo
- US3: T018 e T019 em paralelo
- Polish: T021 e T022 em paralelo
- Com equipe: após a Foundational, US1/US2/US3 podem ser tocadas por pessoas diferentes

---

## Parallel Example: User Story 1

```text
# Escrever em paralelo (arquivos distintos):
Task: "Escrever docs/conceito.md (conceito de brute force + Medusa)"
Task: "Escrever docs/metodologia.md (passo a passo)"
```

---

## Implementation Strategy

### MVP First (User Story 1)

1. Phase 1: Setup
2. Phase 2: Foundational (bloqueia as stories)
3. Phase 3: US1 — documentação legível
4. **PARAR e VALIDAR**: avaliação só por leitura (SC-001)
5. Publicar/demonstrar se pronto

### Incremental Delivery

1. Setup + Foundational → base pronta
2. US1 → validar por leitura → MVP
3. US2 → reproduzir em laboratório + evidência → validar
4. US3 → uso responsável + defesa → validar
5. Polish → auditoria final (sem IA, só placeholders) e publicação

---

## Notes

- [P] = arquivos diferentes, sem dependências
- [Story] mapeia a tarefa à user story para rastreabilidade
- Cada story é concluível e verificável de forma independente
- Commit após cada tarefa ou grupo lógico — **sem** linhas de atribuição de IA
- Evitar: tarefas vagas, conflito no mesmo arquivo, dependências entre stories que quebrem a independência

---

## Phase 7: Convergence

- [ ] T027 Capturar ≥ 1 evidência real de execução da Medusa em laboratório isolado e salvá-la em `evidencias/` (ex.: `evidencias/ssh-resultado.png` ou `.txt`), mostrando `credencial-encontrada` e/ou `lista-esgotada`, e referenciá-la em `docs/exemplos.md` per FR-006, SC-003, US2/AC3 (partial) — requer o alvo de laboratório do autor
