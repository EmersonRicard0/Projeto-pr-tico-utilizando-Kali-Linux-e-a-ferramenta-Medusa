# Convenções do Laboratório

Para manter os exemplos seguros, reprodutíveis e sem dados reais, todo o material deste repositório segue as convenções abaixo.

## Placeholders padrão

| Elemento | Valor usado nos exemplos | Observação |
|----------|--------------------------|------------|
| Host do alvo | `192.168.56.101` | IP de rede isolada (host-only); **nunca** um alvo real |
| Usuário de exemplo | `msfadmin`, entradas de `wordlists/usuarios.txt` | Fictícios / típicos de laboratório |
| Senhas de exemplo | entradas de `wordlists/senhas.txt` | Lista curta e fictícia |
| Serviços demonstrados | SSH (porta 22), FTP (porta 21) | Comuns em laboratórios introdutórios |

## Regras

1. **Somente ambiente autorizado e isolado.** Todos os comandos pressupõem um alvo próprio em rede isolada (ex.: VM de laboratório), com autorização.
2. **Sem alvos reais de terceiros.** Nenhum IP, domínio ou serviço de produção/terceiros aparece no material.
3. **Sem credenciais reais.** As wordlists contêm apenas dados fictícios de demonstração.
4. **Resultados são ilustrativos.** As evidências servem para mostrar o *tipo* de saída, não credenciais válidas de qualquer sistema real.

> Ao reproduzir, substitua `192.168.56.101` pelo endereço do **seu** alvo de laboratório.
