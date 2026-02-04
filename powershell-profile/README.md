📘 Ebook de Uso Diário

## PowerShell 7 + Profile Modular + Template Padrão de Projeto Python (DS/DE)

### Para quem é este ebook

Para quem quer trabalhar todo dia com Python (DS/DE) **sem cair** em:

- “python fantasma” no PATH
  
- venv errado
  
- dependência quebrando
  
- projeto não reprodutível
  

O objetivo do seu profile é exatamente esse: padronizar PowerShell 7, Python consistente e automação do uso de `.venv` com menos risco de conflitos.

---

## Capítulo 1 — O que você ganhou com esse setup

### 1.1 Vantagens práticas (do jeito que importa)

1. **Python consistente** e com prioridade explícita (evita WindowsApps/shims).
  
2. **Ambiente virtual só aparece quando está ativo** (sem confundir pasta `.venv` com venv realmente ativado).
  
3. **Comandos de trabalho padronizados** para venv:
  

- `workon/wo` ativa a `.venv`
  
- `leave/lv` desativa e restaura prioridade do Python global
  

4. **Automação inteligente** ao navegar:

- pode auto-ativar ao entrar em pasta com `.venv`
  
- pode auto-desativar ao sair do projeto (reduz “pip no lugar errado”).
  

5. **Sync de dependências com uv** como rotina (comando `uvsync/sync`).

---

## Capítulo 2 — Regras de Ouro (colar na parede)

Estas regras são o que impede 90% dos problemas:

1. **Nunca instale pacotes fora do `.venv` do projeto.**
  
2. **Um projeto = uma `.venv` local.**
  
3. Ao terminar, use **`leave`** para encerrar a sessão do projeto.
  
4. Se o Python “ficar estranho”, valide com:
  

- `where.exe python`
  
- `Get-Command python | Format-List Name,CommandType,Source`
  

Complemento (governança do template):

- **Nunca edite `uv.lock` manualmente e sempre commit junto com mudanças de deps.**
  
- **Nunca versione `.env`, `data/`, `artifacts/`.**
  

---

## Capítulo 3 — Rotina diária (o “flow” certo)

### 3.1 Começar o dia (2 minutos)

1. Abra PowerShell 7
  
2. Vá até o projeto:
  

```powershell
cd D:\_DE-Projects\meu-projeto
# ou
cd D:\_DS-Projects\meu-projeto
```

3. Ative o ambiente:

```powershell
workon
```

4. Valide (rápido e objetivo):

```powershell
python --version
where.exe python
```

Esperado: `.venv\Scripts\python.exe` quando ativo.

### 3.2 Durante o trabalho (modo produtivo)

- Sincronize dependências quando necessário:

```powershell
uvsync
```

(é `uv sync` por baixo para alinhar `pyproject/lock`).

- Qualidade de código:

```powershell
python -m ruff check .
python -m ruff format .
```

- Commit com governança local (pre-commit roda no commit):

```powershell
git commit -m "mensagem"
```

### 3.3 Encerrar o dia (obrigatório)

```powershell
leave
```

---

## Capítulo 4 — Passo a passo “do zero absoluto” (projeto novo)

### 4.1 Defina onde o projeto vai morar

- DE: `D:\_DE-Projects\`
  
- DS: `D:\_DS-Projects\`
  

### 4.2 Criar pasta e entrar

```powershell
mkdir D:\_DE-Projects\duckdb-analytics-pipeline
cd D:\_DE-Projects\duckdb-analytics-pipeline
```

### 4.3 Git + .gitignore mínimo

```powershell
git init
```

E ignore `.venv/`, `__pycache__/`, `artifacts/` etc.

### 4.4 Inicializar com uv + criar venv

```powershell
uv init
uv venv --python 3.11
workon
```

### 4.5 Instalar base (exemplo)

```powershell
uv pip install pandas polars duckdb ipykernel matplotlib
```

### 4.6 Kernel (opcional recomendado)

```powershell
python -m ipykernel install --user --name duckdb-analytics-pipeline --display-name "Python (duckdb-analytics-pipeline)"
```

### 4.7 Estrutura padrão de pastas

```powershell
mkdir src, tests, notebooks, docs, artifacts, data
mkdir data\raw, data\processed
```

### 4.8 Primeiro commit + abrir no VS Code

```powershell
git add .
git commit -m "chore: bootstrap project structure (uv + venv + folders)"
code .
```

---

## Capítulo 5 — Template padrão (DS/DE) na prática

### 5.1 Estrutura “padrão ouro”

Inclui `src/`, `tests/`, `notebooks/`, `docs/`, `data/`, `artifacts/`, `.vscode/`, `.venv/`, além de `pyproject.toml` e `uv.lock`.

### 5.2 Onboarding em 5 minutos (para qualquer pessoa)

1. Clonar + entrar:

```bash
git clone <url>
cd <repo>
```

2. Reproduzir ambiente:

```powershell
uv sync
```

(gera `.venv` exatamente como o lock define).  
3) Ativar:

```powershell
workon
```

4. Rodar:

```powershell
python -m src.main
```

### 5.3 Dependências (como manter limpo)

- Adicionar dependência com rastreabilidade:

```powershell
workon
uv add <pacote>
deps
git add pyproject.toml uv.lock
git commit -m "deps: add <pacote>"
```

- Upgrade controlado:

```powershell
deps-upgrade
```

- Upgrade major (cautela):

```powershell
deps-upgrade -Major
```

---

## Capítulo 6 — Cuidados e anti-erros (os “vilões” reais)

### 6.1 “Tenho `.venv`, mas não está ativo”

O prompt só deve indicar venv se `$env:VIRTUAL_ENV` estiver setado. Verifique:

```powershell
$env:VIRTUAL_ENV
```

### 6.2 Python apontando para lugar errado

Use diagnóstico direto:

```powershell
where.exe python
Get-Command python | Format-List Name,CommandType,Source
```

E compare com o esperado:

- fora de venv: Python global priorizado
  
- dentro de venv: `<projeto>\.venv\Scripts\python.exe`
  

### 6.3 `uv` duplicado / inconsistente

```powershell
where.exe uv
uv --version
```

---

## Capítulo 7 — Checklist final: “Ambiente saudável”

Antes de dizer “ok”:

- `uv sync` funciona em clone limpo
  
- `workon` ativa corretamente
  
- `python -m src.main` executa
  
- `ruff check .` sem erros
  
- `git commit` roda pre-commit
  

---

## Epílogo — O seu padrão editorial (e por que isso é portfólio forte)

Você criou um workflow que:

- reduz erro humano
  
- facilita onboarding
  
- garante reprodutibilidade
  
- e deixa evidências de engenharia (lint/format/pre-commit/lockfile)
  

E isso é exatamente o tipo de “sistema de trabalho” que recrutador técnico respeita.
