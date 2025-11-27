# 📊 Projeto de Análise de Dados de E-commerce Brasileiro

Este repositório contém o relatório analítico e o código (Python/SQL) para um projeto de análise de dados aprofundada, focado em um negócio de e-commerce brasileiro.

## 📝 Contexto do Projeto e Objetivos

O objetivo principal é fornecer à diretoria da empresa respostas confiáveis e estatisticamente válidas sobre métricas críticas de performance. Isso inclui a análise de receita, margens, frete, prazos de entrega e o comportamento geral do cliente.

A entrega final será um relatório analítico completo (PDF) acompanhado por um código Python/SQL totalmente reprodutível (Notebook).

## 🎯 Indicadores Chave de Performance (KPIs)

A análise está centrada nas seguintes métricas cruciais, que guiarão os insights acionáveis:

* **Ticket Médio**: Valor total por pedido.

* **Take-Rate de Frete (P_Service / Total)**: Contribuição percentual do frete na receita total do pedido.

* **Prazo de Entrega (Lead Time)**: Dias entre a data do pedido e a data de entrega.

* **Atraso na Entrega (Atraso)**: Indicador binário para entregas fora do prazo (D_Date > D_Forecast).

* **Taxa de Conversão de Pagamento**: Taxa de pedidos Confirmados vs. Cancelados (analisada por tipo de pagamento).

* **Performance Logística**: Lead Time e Atraso analisados por tipo de serviço (Standard, Same-Day, Scheduled).

* **Sazonalidade**: Análise de receita e métricas por mês, Estado (UF) e Região.

* **Elasticidade de Desconto**: Relação entre o mix de produtos (Categoria/Subcategoria) e o percentual de desconto aplicado.

## 🛠️ Estrutura do Repositório

| Arquivo/Pasta | Descrição |
 | ----- | ----- |
| `projeto_ecommerce_analise.md` | Guia abrangente e estrutura detalhada para a elaboração do relatório analítico final. |
| `notebook_analise_ecommerce.py` | Código Python para Limpeza de Dados, Engenharia de Features, EDA e Inferência Estatística. |
| `data/` | Diretório recomendado para armazenar arquivos de dados brutos (e.g., CSVs ou extrações de banco de dados). |
| `report_pdf/` | Onde a versão final do relatório em PDF será armazenada (Entregável). |

## 👥 Equipe do Projeto

Este projeto foi desenvolvido em equipe com um máximo de 3 pessoas, conforme as diretrizes do projeto.

**Membros da Equipe:**

1. Levi Moraes

2. Thays Barbosa


