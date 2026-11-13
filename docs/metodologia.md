# Metodologia

O laboratório segue cinco etapas. A ideia é que a mesma metodologia sirva para qualquer serviço suportado pela Medusa — muda apenas o módulo (`-M`) e detalhes do alvo.

## 1. Preparação do alvo de laboratório

- Use um alvo **próprio e isolado** em rede host-only/interna (ex.: uma VM de laboratório com SSH e FTP habilitados).
- Anote o endereço IP do alvo. Nos exemplos usamos o placeholder `192.168.56.101` (veja [convencoes.md](./convencoes.md)).
- Confirme a conectividade antes de prosseguir:

  ```bash
  ping -c 2 192.168.56.101
  ```

## 2. Escolha do serviço

- Identifique qual serviço de autenticação será testado (neste laboratório: **SSH** na porta 22 e **FTP** na porta 21).
- Cada serviço corresponde a um módulo da Medusa (`-M ssh`, `-M ftp`). A relação de módulos disponíveis pode ser consultada com:

  ```bash
  medusa -d
  ```

## 3. Montagem das listas (wordlists)

- **Usuários**: uma lista com os nomes de usuário a testar — `wordlists/usuarios.txt`.
- **Senhas**: uma lista com as senhas candidatas — `wordlists/senhas.txt`.
- Mantenha listas pequenas para a demonstração ser rápida e a saída legível. Em cenários reais de laboratório, wordlists públicas (como a `rockyou.txt`, disponível no Kali) podem ser usadas, mas geram execuções longas.
- As listas deste repositório são **fictícias** — veja [convencoes.md](./convencoes.md).

## 4. Execução

- Monte o comando conforme o esquema em [../specs/001-medusa-brute-force/contracts/medusa-command.md](../specs/001-medusa-brute-force/contracts/medusa-command.md) e os exemplos prontos em [exemplos.md](./exemplos.md).
- Estrutura geral:

  ```bash
  medusa -h <ALVO> -U <USUARIOS> -P <SENHAS> -M <SERVICO> [-t <PARALELISMO>] [-f]
  ```

### Roteiro — cenário SSH

```bash
medusa -h 192.168.56.101 -U wordlists/usuarios.txt -P wordlists/senhas.txt -M ssh -t 4 -f
```

### Roteiro — cenário FTP

Basta trocar o módulo (e ajustar usuário, se desejar testar um único):

```bash
medusa -h 192.168.56.101 -u msfadmin -P wordlists/senhas.txt -M ftp -t 2
```

> A metodologia é a mesma; apenas `-M` muda entre serviços.

## 5. Análise de resultados

A Medusa informa dois desfechos possíveis, ambos legítimos:

- **Credencial encontrada**: linha de sucesso (`ACCOUNT FOUND` / `[SUCCESS]`) com o usuário e a senha válidos. Se `-f` estiver ativo, a execução para no primeiro sucesso.
- **Lista esgotada**: todas as combinações foram testadas sem sucesso — resultado válido que indica que as credenciais testadas não constam nas listas.

Registre a saída como evidência (veja [exemplos.md](./exemplos.md) e a pasta `evidencias/`). A interpretação de cada parâmetro está detalhada em [exemplos.md](./exemplos.md).

> ⚠️ Execute apenas contra o seu alvo autorizado. Veja [uso-responsavel.md](./uso-responsavel.md).
