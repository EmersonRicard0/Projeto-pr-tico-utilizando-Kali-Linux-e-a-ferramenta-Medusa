# Conceito: Brute Force de Autenticação e a Ferramenta Medusa

## O que é brute force de autenticação

Brute force ("força bruta") é uma técnica de teste de autenticação que consiste em **tentar sistematicamente diversas combinações de usuário e senha** contra um serviço até encontrar uma credencial válida ou esgotar a lista de tentativas.

A ideia é simples: se um serviço aceita login por usuário e senha e não possui proteções adequadas (senhas fortes, bloqueio por tentativas, múltiplos fatores), um atacante pode automatizar milhares de tentativas para descobrir credenciais fracas.

Existem variações comuns:

- **Força bruta pura**: testa todas as combinações possíveis de caracteres (lento, inviável para senhas longas).
- **Ataque de dicionário**: testa uma lista pré-definida de senhas prováveis (wordlist). É o mais usado na prática e o adotado neste laboratório.
- **Credential stuffing**: reutiliza pares usuário/senha vazados em outros serviços.

Neste projeto trabalhamos com **ataque de dicionário** contra serviços de autenticação em um ambiente de laboratório controlado.

## O papel da Medusa

A **Medusa** é uma ferramenta de linha de comando, disponível no Kali Linux, voltada a testes de login por força bruta. Suas características principais:

- **Modular por serviço**: cada protocolo é um módulo (`-M ssh`, `-M ftp`, etc.), então a mesma lógica serve para vários serviços.
- **Paralela**: testa várias credenciais simultaneamente (`-t`), acelerando a demonstração.
- **Flexível nas entradas**: aceita usuário único (`-u`) ou lista de usuários (`-U`), e listas de senhas (`-P`).
- **Saída objetiva**: reporta claramente quando uma credencial é encontrada e quando a lista se esgota.

Em resumo, a Medusa automatiza o processo descrito acima: dado um alvo, uma lista de usuários e uma lista de senhas, ela percorre as combinações e informa o resultado.

## Por que estudar isso

Entender como o brute force funciona é essencial para **defender** sistemas: conhecendo a técnica, fica claro por que senhas fortes, bloqueio por tentativas e autenticação multifator são tão importantes. As contramedidas estão detalhadas em [defesa.md](./defesa.md).

> ⚠️ Esta técnica só pode ser aplicada em ambientes próprios e autorizados. Veja [uso-responsavel.md](./uso-responsavel.md).
