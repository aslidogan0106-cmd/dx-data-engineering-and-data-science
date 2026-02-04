# **Developer Experience (DX) aplicada a Data Engineering & Data Science**

## 🧠 Sistema de Trabalho Profissional

## PowerShell 7 • Python 3.11/3.12 • uv • VS Code

### Data Science & Data Engineering

> **Resumo curto**  
> Este repositório documenta um **sistema de trabalho profissional** para projetos Python em Data Science e Data Engineering, focado em **previsibilidade**, **isolamento de ambientes**, **governança de dependências** e **onboarding rápido**.

Não é um tutorial básico.  
É a documentação de **como eu trabalho**.

---

## 🎯 Objetivos do Setup

Este setup existe para resolver problemas reais do dia a dia:

- Python errado no PATH

- `.venv` esquecida ou vazando entre projetos

- dependências inconsistentes

- onboarding lento

- perda de tempo com ambiente quebrado

**Princípio central:**

> Menos mágica. Mais previsibilidade.

---

## 🧩 Stack Recomendada

- **PowerShell 7**

- **Python 3.11 / 3.12**

- **uv** (gerenciamento moderno de dependências e lockfile)

- **VS Code**

---

## 🏗️ Arquitetura Mental

Separação clara de responsabilidades:

| Camada             | Responsabilidade          |
| ------------------ | ------------------------- |
| PowerShell Profile | Comportamento do terminal |
| Projeto Python     | Código e dependências     |
| uv                 | Reprodutibilidade         |
| `.venv`            | Isolamento por projeto    |
| VS Code            | Desenvolvimento           |

> Se algo parece confuso, provavelmente as responsabilidades estão misturadas.

---

## 🔁 Rotina Diária Ideal

### Início do dia

```powershell
pwsh
cd D:\_DS-Projects\meu-projeto
workon
python --version
```

### Durante o trabalho

```powershell
uv sync
python -m ruff check .
python -m ruff format .
git commit -m "mensagem clara"
```

### Encerramento (obrigatório)

```powershell
leave
```

✔ Evita vazamento de ambiente  
✔ Mantém o terminal previsível

---

## 🚀 Criando um Projeto do Zero

### 1. Diretório

- DS → `D:\_DS-Projects\`

- DE → `D:\_DE-Projects\`

```powershell
mkdir D:\_DS-Projects\credit-score
cd D:\_DS-Projects\credit-score
```

### 2. Inicialização

```powershell
git init
uv init
uv venv --python 3.11
workon
```

### 3. Dependências base

```powershell
uv pip install pandas numpy scikit-learn ipykernel matplotlib
```

### 4. Estrutura padrão

```powershell
mkdir src tests notebooks docs artifacts data
mkdir data\raw data\processed
```

---

## 📏 Governança Técnica (Não Negociável)

- Um projeto = uma `.venv`

- `uv.lock` **sempre commitado**

- Nunca editar lockfile manualmente

- `.venv`, `data/`, `artifacts/` fora do Git

**Por quê?**

- Reprodutibilidade

- Onboarding rápido

- Menos erro humano

- Padrão profissional

---

## 🩺 Diagnóstico do Ambiente

Ao menor sinal de problema:

```powershell
doctor
```

Verifique:

- Python ativo

- PATH

- uv disponível

- `.venv` ativa

> Diagnóstico antes de correção. Sempre.

---

## 👥 Onboarding Rápido (30–60 minutos)

```powershell
git clone <repo>
cd <repo>
uv sync
workon
python -m src.main
doctor
```

### Como trabalhamos aqui

- Um projeto = uma `.venv`

- Nunca instalar fora do ambiente

- Sempre commit com lockfile

- Sempre encerrar com `leave`

---

## ✅ Checklists

### Início do dia

- Diretório correto

- `.venv` ativa

- Python esperado

### Fim do dia

- Commit feito

- `leave` executado

### Ambiente saudável

- `uv sync` funciona em clone limpo

- Projeto roda do zero

- `doctor` sem alertas críticos

---

## 🧠 Por que isso importa

Este repositório não documenta scripts.  
Ele documenta **um sistema de trabalho**.

Se você:

- reduz erro operacional

- facilita onboarding

- garante previsibilidade

então você não está apenas escrevendo código —  
você está **projetando sistemas de trabalho**.

---

## 📄 Versões disponíveis

- 📘 **Ebook completo (PDF)** — uso pessoal e onboarding

- 📄 **Este README** — versão pública e escaneável

---

Se quiser, próximo passo possível:

- versão **README minimalista** (1 tela)

- badges (Python, uv, PowerShell)

- diagrama simples da arquitetura

- ou adaptar o texto para **post técnico no LinkedIn**

É só me dizer.

