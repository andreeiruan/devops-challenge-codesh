# 🚀 DevOps Challenge - Infraestrutura como Código e CI/CD

## 📝 Sobre o Projeto
Este projeto demonstra como automatizar a infraestrutura na nuvem e implementar entrega contínua. Usamos Terraform para criar a infraestrutura e GitHub Actions para automatizar o deploy.

## 💭 Processo de Desenvolvimento

### Decisões Técnicas
1. **Infraestrutura como Código**
   - Escolhi Terraform/Opentofu por ser ferramentas que estou mais acostumado no dia a dia.
   - Separei os recursos em arquivos por tipo (ec2.tf, vpc.tf, etc.) para melhor organização, utilizei a doc do Terraform como fonte de busca para criação dos recursos.
   - Usei locals para manter consistência nos nomes dos recursos

2. **Segurança**
   - Implementei UFW e Security Groups para dupla camada de proteção
   - Fail2ban para proteção contra ataques de força bruta
   - Permissões IAM mínimas seguindo o princípio do menor privilégio

3. **CI/CD**
   - GitHub Actions para integração com o repositório
   - CodeDeploy para gerenciar deploys de forma confiável
   - S3 para versionamento dos artefatos

4. **Monitoramento**
   - CloudWatch Agent para métricas e logs
   - Configuração básica para começar, com possibilidade de expansão

5. **Documentação**
   - Utilização de IA para ajudar a ter uma documentação mais estruturada e clara.

### Desafios e Soluções
1. **Configuração do CodeDeploy**
   - Desafio: Garantir que o agente do CodeDeploy estivesse funcionando
   - Solução: Adicionei o script de instalação no user_data da EC2

2. **Segurança da EC2**
   - Desafio: Balancear segurança e usabilidade
   - Solução: Implementei múltiplas camadas de proteção (UFW + Security Groups)

3. **Pipeline de Deploy**
   - Desafio: Garantir deploy consistente
   - Solução: Uso do appspec.yml para definir o processo de deploy

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
