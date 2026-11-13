# Convenções do Laboratório

Para manter os exemplos seguros, reprodutíveis e sem dados reais, todo o material segue as convenções abaixo.

## Alvos e credenciais (laboratório)

Os testes rodam contra o [laboratório Docker isolado](./laboratorio.md). Os nomes abaixo são os dos contêineres na rede `medusa-lab`:

| Alvo | Serviço | Porta | Credencial plantada |
|------|---------|-------|---------------------|
| `lab-ftp` | FTP | 21 | `msfadmin` / `msfadmin` |
| `lab-smb` | SMB | 139/445 | `msfadmin` / `msfadmin` |
| `lab-web` | HTTP (auth básica) | 80 | `msfadmin` / `msfadmin` |
| `lab-dvwa` | DVWA | 80 | `admin` / `password` |

> Ao atacar do Kali host (em vez do contêiner atacante), substitua o nome do contêiner pelo **IP** do alvo:
> `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' lab-ftp`

## Regras

1. **Somente ambiente autorizado e isolado.** Os alvos são contêineres descartáveis em rede dedicada, sem portas publicadas no host.
2. **Sem alvos reais de terceiros.** Nenhum IP, domínio ou serviço de produção/terceiros aparece no material.
3. **Sem credenciais reais.** As wordlists contêm apenas dados fictícios de demonstração; a credencial `msfadmin/msfadmin` é plantada de propósito nos alvos.
4. **Resultados ilustrativos.** As evidências demonstram o *tipo* de saída da Medusa, não credenciais válidas de qualquer sistema real.
