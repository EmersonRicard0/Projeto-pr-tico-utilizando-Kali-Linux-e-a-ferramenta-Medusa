# Contramedidas Defensivas

Entender o brute force serve, acima de tudo, para **defender** sistemas. Abaixo estão contramedidas concretas contra ataques de força bruta de autenticação.

## 1. Política de senhas fortes

- Exigir senhas longas e complexas, reduzindo drasticamente a eficácia de ataques de dicionário.
- Proibir senhas comuns (as mesmas que aparecem em wordlists públicas).
- Forçar troca de senhas padrão de fábrica (ex.: `admin/admin`).

## 2. Bloqueio por tentativas e rate limiting

- **Lockout**: bloquear a conta (temporária ou permanentemente) após N tentativas falhas.
- **Rate limiting**: limitar o número de tentativas por IP/por período, tornando o ataque lento demais para ser viável.
- **Backoff progressivo**: aumentar o tempo de espera a cada falha.

## 3. Autenticação multifator (MFA)

- Exigir um segundo fator (app autenticador, token, chave de segurança) além da senha.
- Mesmo que a senha seja descoberta, o acesso é barrado sem o segundo fator.

## 4. Proteções específicas de serviço

- **fail2ban**: monitora logs (FTP, SSH, web) e bloqueia automaticamente IPs com muitas falhas de login.
- **FTP**: preferir alternativas seguras (SFTP/FTPS), desabilitar contas anônimas/desnecessárias e aplicar TLS.
- **SMB**: desabilitar **SMBv1**, exigir **assinatura SMB** (SMB signing), restringir acesso anônimo (`restrict anonymous`) e segmentar a rede (não expor 139/445 à internet).
- **Web**: proteger logins com rate limiting/WAF, **CAPTCHA** após X falhas, tokens anti-CSRF e, preferencialmente, abandonar autenticação básica em favor de sessões + MFA.

## 5. Monitoramento e resposta

- Registrar e **alertar** sobre picos de tentativas de login falhas.
- Revisar logs regularmente para detectar padrões de ataque.

## Resumo

| Camada | Medida | Efeito |
|--------|--------|--------|
| Credencial | Senhas fortes + MFA | Reduz chance de acerto e invalida senha isolada |
| Serviço | Lockout, rate limiting, fail2ban | Torna o ataque lento/inviável |
| Configuração | SFTP/FTPS, SMB signing sem SMBv1, WAF/CAPTCHA no web | Elimina superfícies fáceis |
| Operação | Logs e alertas | Detecta e responde ao ataque |

> A técnica ofensiva descrita em [conceito.md](./conceito.md) só é perigosa contra sistemas mal configurados. As medidas acima fecham essas brechas.
