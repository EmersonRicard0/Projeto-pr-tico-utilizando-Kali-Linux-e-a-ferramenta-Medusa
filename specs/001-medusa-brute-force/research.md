# Research: Projeto Prático de Brute Force com Medusa no Kali Linux

**Phase 0 output** · Feature: `001-medusa-brute-force` · Date: 2026-11-13

Não há marcadores `[NEEDS CLARIFICATION]` na spec. Esta pesquisa consolida as decisões de domínio que embasam o plano.

---

## Decision 1: Ferramenta e ambiente

- **Decision**: Usar a Medusa no Kali Linux como ferramenta de brute force paralelo e modular por serviço.
- **Rationale**: É o escopo explícito do desafio da DIO. A Medusa já vem disponível/instalável no Kali, suporta múltiplos módulos de serviço (ssh, ftp, http, etc.) e é projetada para testes de login em massa com paralelismo.
- **Alternatives considered**: Hydra (equivalente, muito usada) e Ncrack — rejeitadas por não serem o alvo do desafio; podem ser citadas como alternativas na documentação, sem substituir a Medusa.

## Decision 2: Serviços demonstrados

- **Decision**: Demonstrar SSH (porta 22) e FTP (porta 21) como os dois serviços representativos.
- **Rationale**: São serviços de autenticação clássicos, comuns em laboratórios introdutórios (ex.: Metasploitable), e cobrem o requisito de ≥ 2 serviços distintos (FR-004) com módulos Medusa diferentes.
- **Alternatives considered**: HTTP form / Telnet / MySQL — mais complexos de configurar em laboratório introdutório; ficam como extensões opcionais.

## Decision 3: Alvo de laboratório

- **Decision**: Alvos em rede isolada e autorizada (ex.: VM Metasploitable 2 ou contêiner com SSH/FTP), referenciados na documentação por placeholders (ex.: `192.168.56.101`).
- **Rationale**: Garante conformidade ética/legal (FR-005, FR-007, SC-004) e reprodutibilidade (SC-006) sem expor alvos reais.
- **Alternatives considered**: Alvos reais / internet pública — **rejeitado**: ilegal e fora de escopo.

## Decision 4: Insumos (wordlists)

- **Decision**: Wordlists fictícias pequenas versionadas no repo (`wordlists/usuarios.txt`, `wordlists/senhas.txt`), com menção às wordlists públicas do Kali (ex.: `rockyou.txt`) como referência.
- **Rationale**: Mantém o repo autocontido e reprodutível; listas pequenas tornam a execução rápida e a evidência legível.
- **Alternatives considered**: Depender apenas de `rockyou.txt` — rejeitado por não ser autocontido e gerar execuções longas demais para demonstração.

## Decision 5: Formato e idioma da entrega

- **Decision**: Repositório GitHub em Markdown (GFM), em pt-BR, com README raiz + `docs/` + `evidencias/`.
- **Rationale**: Formato esperado pelos desafios da DIO; Markdown renderiza direto no GitHub, permitindo avaliação só pela leitura (FR-010, SC-001).
- **Alternatives considered**: PDF único / site estático — rejeitados por menor navegabilidade e maior fricção de manutenção para o escopo.

## Decision 6: Estratégia de validação

- **Decision**: Validar por checklist de conteúdo (requisitos de FR) + reprodução manual opcional de 1 cenário em laboratório isolado conferindo a saída esperada (`quickstart.md`).
- **Rationale**: Não há software a testar automaticamente; a qualidade é do conteúdo e da reprodutibilidade.
- **Alternatives considered**: Testes automatizados — não aplicável a um projeto documental.

## Decision 7: Enquadramento ético e defensivo

- **Decision**: Seção dedicada de uso responsável + seção de contramedidas (≥ 3: política de senhas fortes, bloqueio por tentativas/rate limiting, MFA, fail2ban).
- **Rationale**: Exigência de maturidade em conteúdo de segurança (FR-007, FR-008, US3).
- **Alternatives considered**: Omitir / diluir no texto — rejeitado por reduzir clareza e responsabilidade.
