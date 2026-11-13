# Evidências

Saídas reais das execuções no [laboratório Docker isolado](../docs/laboratorio.md), geradas pelo script [`../scripts/lab-attack.sh`](../scripts/lab-attack.sh).

| Arquivo | Conteúdo | Desfecho |
|---------|----------|----------|
| [`00-nmap.txt`](./00-nmap.txt) | Reconhecimento Nmap dos quatro alvos | Portas/serviços identificados |
| [`01-ftp-medusa.txt`](./01-ftp-medusa.txt) | Brute force FTP (`-M ftp`) | `ACCOUNT FOUND ... msfadmin [SUCCESS]` |
| [`02-smb-medusa.txt`](./02-smb-medusa.txt) | Brute force SMB (`-M smbnt`) | `ACCOUNT FOUND ... msfadmin [SUCCESS]` |
| [`03-web-http-medusa.txt`](./03-web-http-medusa.txt) | Brute force Web / auth básica (`-M http`) | `ACCOUNT FOUND ... msfadmin [SUCCESS]` |

As evidências estão em texto (saída fiel do terminal).

> Todos os resultados vêm de alvos de laboratório próprios e descartáveis. Nenhum sistema real de terceiros foi testado.
