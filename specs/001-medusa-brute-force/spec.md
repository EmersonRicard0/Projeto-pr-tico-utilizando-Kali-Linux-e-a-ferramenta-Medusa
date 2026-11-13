# Feature Specification: Projeto Prático de Brute Force com Medusa no Kali Linux

**Feature Branch**: `001-medusa-brute-force`

**Created**: 2026-11-13

**Status**: Draft

**Input**: User description: "Projeto prático de brute force de autenticação usando a ferramenta Medusa no Kali Linux, documentando a metodologia, os comandos/exemplos representativos de ataque a serviços (ex.: SSH, FTP), e a entrega como repositório GitHub para o desafio da DIO."

## Visão Geral

Este projeto é um **laboratório educacional** do desafio da DIO. O objetivo não é um software a ser construído, mas uma **entrega documentada** (repositório GitHub) que demonstra, de forma didática e reprodutível, como a ferramenta Medusa é usada para testes de brute force de autenticação em um ambiente **controlado e autorizado** (Kali Linux contra alvos de laboratório próprios).

O valor central está na documentação clara da metodologia, em exemplos representativos de comandos e na contextualização ética/defensiva — para que um avaliador ou outro estudante entenda o processo sem precisar executar ataques contra sistemas reais de terceiros.

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Avaliador entende a metodologia completa (Priority: P1)

Um avaliador da DIO (ou outro estudante) abre o repositório no GitHub e, lendo o `README.md` e a documentação, consegue compreender de ponta a ponta o que é brute force de autenticação, como a Medusa opera e como ela foi aplicada neste laboratório — incluindo comandos representativos e a leitura dos resultados.

**Why this priority**: É o coração da entrega do desafio. Sem uma documentação clara e autoexplicativa, o projeto não cumpre seu propósito didático nem permite avaliação.

**Independent Test**: Pode ser validado por uma pessoa lendo apenas o repositório (sem executar nada) e conseguindo explicar com as próprias palavras o fluxo de um ataque de brute force com Medusa e o significado de cada parâmetro dos exemplos.

**Acceptance Scenarios**:

1. **Given** o repositório publicado no GitHub, **When** o leitor abre o `README.md`, **Then** encontra uma descrição do objetivo, do ambiente usado (Kali Linux + Medusa) e um índice/roteiro da documentação.
2. **Given** a seção de metodologia, **When** o leitor a percorre, **Then** entende as etapas (preparação do alvo de laboratório, escolha do serviço, montagem de listas de usuários/senhas, execução, análise do resultado).
3. **Given** um exemplo de comando documentado, **When** o leitor o examina, **Then** cada flag/parâmetro relevante (host, usuário, lista de senhas, módulo do serviço, paralelismo) está explicado em linguagem acessível.

---

### User Story 2 - Estudante reproduz o laboratório em ambiente autorizado (Priority: P2)

Um estudante com um ambiente de laboratório próprio (ex.: VM alvo em rede isolada) segue o passo a passo do repositório e reproduz com sucesso pelo menos um cenário de brute force (ex.: SSH ou FTP), obtendo e interpretando o resultado.

**Why this priority**: Reprodutibilidade eleva a qualidade da entrega e comprova que a documentação é correta e suficiente, mas depende de o leitor ter um ambiente de laboratório, por isso fica abaixo da documentação em si.

**Independent Test**: Pode ser testado montando um alvo de laboratório isolado, seguindo apenas as instruções do repositório e verificando que os comandos executam e produzem o resultado descrito, sem passos ausentes.

**Acceptance Scenarios**:

1. **Given** as instruções de pré-requisitos, **When** o estudante prepara o ambiente de laboratório isolado e autorizado, **Then** possui Medusa disponível no Kali e um alvo de teste controlado.
2. **Given** o roteiro de execução para um serviço (ex.: SSH), **When** o estudante executa o comando documentado contra seu alvo de laboratório, **Then** a Medusa roda e reporta sucesso/falha de credenciais de forma coerente com o que a documentação descreve.
3. **Given** as evidências esperadas, **When** o estudante compara sua saída com os exemplos/capturas do repositório, **Then** reconhece o mesmo tipo de resultado (credencial encontrada ou esgotamento da lista).

---

### User Story 3 - Leitor compreende limites éticos/legais e defesas (Priority: P3)

Um leitor termina a documentação entendendo claramente que a técnica só pode ser usada em ambientes autorizados, e conhece as principais contramedidas defensivas contra brute force.

**Why this priority**: Enquadramento ético e defensivo agrega maturidade e responsabilidade à entrega e é esperado em conteúdo de segurança, mas é complementar ao núcleo prático.

**Independent Test**: Pode ser validado verificando que o repositório contém uma seção explícita de uso responsável/autorização e uma seção de mitigações (ex.: políticas de senha, bloqueio por tentativas, MFA, fail2ban).

**Acceptance Scenarios**:

1. **Given** o repositório, **When** o leitor procura por orientações de uso, **Then** encontra um aviso claro de que o laboratório é autorizado/controlado e que uso contra terceiros sem permissão é ilegal.
2. **Given** a seção defensiva, **When** o leitor a lê, **Then** identifica pelo menos três contramedidas concretas contra ataques de brute force.

---

### Edge Cases

- O que acontece quando a lista de senhas se esgota sem encontrar credenciais válidas? A documentação deve mostrar essa saída como um resultado legítimo e esperado.
- Como o conteúdo trata serviços/alvos diferentes? Deve deixar claro que o módulo da Medusa muda conforme o serviço (ex.: ssh, ftp) e que o restante da metodologia se mantém.
- Como o leitor é impedido de aplicar a técnica indevidamente? A documentação não deve conter alvos reais de terceiros nem credenciais reais, apenas exemplos de laboratório e placeholders.
- O que acontece se o avaliador não tiver ambiente Kali? O repositório deve ser compreensível apenas pela leitura, sem exigir execução.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: O repositório MUST conter um `README.md` que apresente o objetivo do projeto, o contexto do desafio da DIO, o ambiente utilizado (Kali Linux + Medusa) e um roteiro/índice da documentação.
- **FR-002**: A documentação MUST explicar, em linguagem acessível, o conceito de brute force de autenticação e o papel da Medusa nesse processo.
- **FR-003**: A documentação MUST descrever a metodologia passo a passo: preparação do alvo de laboratório, escolha do serviço, montagem das listas de usuários e senhas, execução e análise de resultados.
- **FR-004**: O repositório MUST fornecer pelo menos dois exemplos representativos de comandos da Medusa para serviços distintos (ex.: SSH e FTP), com cada parâmetro relevante explicado.
- **FR-005**: Os exemplos MUST usar alvos de laboratório/placeholders (ex.: IPs de rede isolada, usuários e listas fictícias) e MUST NOT conter alvos reais de terceiros nem credenciais reais.
- **FR-006**: A documentação MUST apresentar evidências do resultado (ex.: capturas de tela ou saídas de terminal) para pelo menos um cenário executado, mostrando credencial encontrada e/ou lista esgotada.
- **FR-007**: O repositório MUST conter uma seção de uso responsável, deixando explícito que a atividade ocorre em ambiente autorizado e controlado, e que o uso não autorizado é ilegal.
- **FR-008**: A documentação MUST listar pelo menos três contramedidas defensivas contra brute force (ex.: política de senhas fortes, bloqueio por tentativas, MFA, fail2ban).
- **FR-009**: O repositório MUST documentar os pré-requisitos para reproduzir o laboratório (disponibilidade da Medusa no Kali, um alvo de teste controlado, listas de wordlist).
- **FR-010**: A estrutura do repositório MUST ser organizada e navegável (README na raiz, e documentação/evidências em locais previsíveis), permitindo avaliação apenas pela leitura.

### Key Entities *(include if feature involves data)*

- **Repositório de Entrega**: O artefato final publicado no GitHub; agrega README, documentação da metodologia, exemplos de comandos e evidências.
- **Exemplo de Comando**: Uma invocação representativa da Medusa para um serviço específico, com alvo (placeholder), usuário(s), lista de senhas, módulo de serviço e opções, acompanhada de explicação.
- **Lista de Credenciais (Wordlist)**: Conjunto fictício/de laboratório de usuários e senhas usado como insumo dos exemplos.
- **Evidência de Resultado**: Captura de tela ou saída de terminal que demonstra o desfecho de uma execução (credencial encontrada ou lista esgotada).
- **Alvo de Laboratório**: Serviço em ambiente isolado e autorizado contra o qual os exemplos são demonstrados.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Um leitor sem acesso ao ambiente consegue, lendo apenas o repositório em menos de 15 minutos, explicar o fluxo completo de um ataque de brute force com Medusa e o significado dos parâmetros dos exemplos.
- **SC-002**: O repositório cobre pelo menos dois serviços distintos com exemplos de comando explicados (100% dos exemplos com todos os parâmetros relevantes descritos).
- **SC-003**: Pelo menos um cenário possui evidência visual/textual do resultado incluída no repositório.
- **SC-004**: 100% dos exemplos usam placeholders/alvos de laboratório, sem nenhum alvo real de terceiro ou credencial real.
- **SC-005**: O repositório contém seção de uso responsável e pelo menos três contramedidas defensivas claramente identificáveis.
- **SC-006**: Um estudante com ambiente de laboratório isolado consegue reproduzir pelo menos um cenário seguindo exclusivamente as instruções do repositório, sem precisar de passos não documentados.

## Assumptions

- O ambiente de execução é o Kali Linux com a Medusa já disponível (ou instalável via gerenciador de pacotes padrão do Kali).
- Todos os testes ocorrem em ambiente de laboratório isolado e autorizado (ex.: VMs próprias como Metasploitable ou contêineres em rede isolada); nenhum alvo real de terceiros é utilizado.
- A entrega final é um repositório público no GitHub, conforme o formato esperado pelos desafios da DIO.
- O público-alvo são avaliadores da DIO e estudantes de segurança da informação em nível introdutório/intermediário.
- Os serviços demonstrados por padrão são SSH e FTP, por serem comuns em laboratórios introdutórios; outros serviços podem ser adicionados como extensão.
- As wordlists usadas são fictícias ou exemplos públicos de laboratório, sem dados sensíveis reais.
- O conteúdo é redigido em português (pt-BR), coerente com o contexto da DIO.
