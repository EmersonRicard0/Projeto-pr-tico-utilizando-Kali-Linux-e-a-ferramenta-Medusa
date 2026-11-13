# Pré-requisitos

Para reproduzir o laboratório, você precisa de:

## 1. Kali Linux com a Medusa e o Nmap

Já acompanham o Kali. Verifique:

```bash
medusa -V | head -1
nmap --version | head -1
```

Se faltar algo:

```bash
sudo apt update && sudo apt install -y medusa nmap
```

## 2. Docker (para o laboratório de alvos)

Os alvos são contêineres descartáveis. Instale o Docker e garanta seu usuário no grupo:

```bash
sudo apt install -y docker.io
sudo usermod -aG docker "$USER"   # reabra a sessão depois
```

## 3. Subir o laboratório isolado

```bash
cd scripts
chmod +x *.sh
./lab-up.sh
```

Isso sobe os alvos **FTP, SMB, Web (auth básica) e DVWA** na rede `medusa-lab`, sem publicar portas no host. Detalhes em [laboratorio.md](./laboratorio.md).

## 4. Wordlists

- Listas de exemplo deste repositório: `wordlists/usuarios.txt` e `wordlists/senhas.txt`.
- Alternativa pública do Kali: `/usr/share/wordlists/rockyou.txt` (maior, execução mais longa).

## Verificação rápida

```bash
medusa -d | head           # módulos disponíveis
docker ps --filter network=medusa-lab   # alvos no ar
```

Com isso pronto, siga o roteiro em [metodologia.md](./metodologia.md) e os [exemplos.md](./exemplos.md).

> ⚠️ Nunca aponte os comandos para sistemas que não sejam seus ou sem autorização. Veja [uso-responsavel.md](./uso-responsavel.md).
