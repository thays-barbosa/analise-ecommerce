# Análise Exploratória e Inferencial de Dados de E-commerce

**Equipe:** Levi Moraes e Thays Barbosa

**Contexto:** Análise de dados de um e-commerce brasileiro com o objetivo de fornecer respostas confiáveis (com tratamento estatístico) sobre receita, margens, frete, prazos de entrega e comportamento do cliente.

---

## 1. Metodologia e Entregáveis

O projeto seguiu um pipeline de análise de dados robusto, culminando em um relatório analítico e artefatos de código para garantir a reprodutibilidade.

### 1.1. Entregáveis Principais

| Entregável | Descrição | Localização |
| :--- | :--- | :--- |
| **Relatório Analítico** | Documento principal com Sumário Executivo, Análise de Dados & Método, EDA, Inferência Estatística e Insights Acionáveis. | Diretório raiz (`.pdf` e `.md`) |
| **Notebook Python** | Código completo para reprodutibilidade da limpeza, Feature Engineering, EDA e Inferência. | `notebooks/notebook_analise_ecommerce.ipynb` |
| **Script SQL** | Consulta SQL para reprodutibilidade da etapa de Feature Engineering em ambiente de banco de dados. | `code/sql/main_query.sql` |
| **Dados Brutos** | Arquivos CSV originais para garantir a reprodutibilidade total da análise. | `data/raw/` |

### 1.2. Abordagem Estatística

A análise focou em três pilares estatísticos:

1.  **Qualidade e Preparação:** Tratamento de NAs, tipagem correta e documentação de outliers (regra IQR).
2.  **Análise Descritiva (EDA):** Uso de medidas de tendência central/dispersão, histogramas, boxplots e heatmaps de correlação.
3.  **Inferência Estatística:** Cálculo de **Intervalos de Confiança de 95%** para o Ticket Médio, Atraso Médio e Proporções (Atraso e Cancelamento), fornecendo margens de erro confiáveis para a tomada de decisão.

---

## 2. KPIs e Insights Chave

O Sumário Executivo do relatório detalha os achados mais acionáveis, destacando:

*   **Risco Logístico Crítico:** Taxa de Atraso de **83.25%** (IC 95% [81.61%, 84.89%]), com o serviço *Same-Day* apresentando o pior desempenho.
*   **Perda de Conversão:** O método **Boleto** apresenta a menor taxa de confirmação (23.14%), indicando alto abandono no funil de pagamento.
*   **Elasticidade do Desconto:** Correlação positiva entre Desconto e Volume de Vendas apenas para a subcategoria **Celulares, Tablets e Acessórios**.

---

## 3. Estrutura do Repositório

Para facilitar a navegação e a reprodutibilidade, o projeto segue a seguinte estrutura:

analise-ecommerce/
├── code/
│   └── sql/
│       └── main_query.sql          # Script SQL para Feature Engineering
├── data/
│   └── raw/
│       └── *.csv                   # Arquivos de dados brutos (FACT_Orders, DIM_Delivery, etc.)
├── docs/
│   └── *.png                       # Gráficos gerados na EDA
├── notebooks/
│   └── notebook_analise_ecommerce.ipynb # Notebook Python com a análise completa
├── relatorio_analitico.pdf         # Relatório final em PDF (Entregável principal)
├── relatorio_analitico.md          # Relatório final em Markdown
├── README.md                       # Este arquivo
└── .gitignore                      # Arquivos ignorados (temporários, processados)