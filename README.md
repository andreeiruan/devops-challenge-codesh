# 🚀 DevOps Challenge - Infraestrutura como Código e CI/CD

## 📝 Sobre o Projeto
Este projeto demonstra como automatizar a infraestrutura na nuvem e implementar entrega contínua. Usamos Terraform para criar a infraestrutura e GitHub Actions para automatizar o deploy.

## 🛠️ Tecnologias e Seus Papéis

### 🌐 Infraestrutura
- Terraform: Cria e gerencia toda a infraestrutura como código
- Opentofu: Versão open-source do Terraform
- AWS: Fornece servidores (EC2), armazenamento (S3) e serviços de deploy
- Ubuntu 22.04: Sistema operacional estável e seguro
- Nginx: Servidor web rápido e confiável

### 🔄 CI/CD
- GitHub Actions: Automatiza o processo de deploy
- AWS CodeDeploy: Gerencia o deploy nos servidores
- AWS S3: Armazena os arquivos de deploy

### 🔒 Segurança
- AWS Security Groups: Controla acesso à rede
- UFW: Firewall simples e eficiente
- Fail2ban: Bloqueia tentativas de invasão
- AWS SSM Agent: Gerencia servidores remotamente

## 📋 Como Usar

### ⚙️ O que Você Precisa
- Conta AWS
- Terraform/Opentofu
- GitHub
- AWS CLI

### 🔧 Passo a Passo

1. Clone o projeto:
```bash
git clone https://github.com/andreeiruan/devops-challenge-codesh.git
cd devops-challenge-codesh
```

2. Configure AWS:
```bash
aws configure
```

3. Inicie o Terraform:
```bash
cd .infra
tofu init
```

4. Crie a infraestrutura:
```bash
tofu apply
```

5. Configure as secrets no GitHub:
   - AWS_ACCESS_KEY_ID
   - AWS_SECRET_ACCESS_KEY
   - S3_BUCKET

### 📁 O que Tem no Projeto
```
.
├── .github/          # Configurações do GitHub
├── .infra/          # Código da infraestrutura
├── scripts/         # Scripts de automação
└── web/            # Arquivos da aplicação
```

### 🚀 Deploy
1. Push para `main`
2. GitHub Actions faz o resto:
   - Empacota a aplicação
   - Envia para AWS
   - Faz o deploy
3. Pronto! Acesse o site (após o apply o terraform terá um output que será o IP para acessar).

## 🔒 Segurança
- Firewall ativo (UFW e Security groups)
- Proteção contra ataques
- Permissões restritas
- Secrets protegidos

## 📊 Monitoramento
- Métricas em tempo real com cloudwatch.

## Limpeza
Para limpar a infra apenas rode: 
```bash
tofu destroy
```

---

This is a challenge by [Coodesh](https://coodesh.com/)
