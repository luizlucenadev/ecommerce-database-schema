# 🛒 E-Commerce Database Schema (MySQL 8.0)

Este repositório contém a modelagem, criação e consultas analíticas para um banco de dados relacional de e-commerce completo.

## 📌 Tecnologias Utilizadas
- **SGBD:** MySQL 8.0
- **Modelagem:** Relacional (1:1, 1:N, N:N)
- **Ferramenta:** MySQL Workbench

## 📐 Estrutura do Banco de Dados
O schema contempla as seguintes entidades:
- **Usuários e Endereços** (1:N)
- **Produtos, Categorias e Imagens** (1:N)
- **Carrinho de Compras e Itens** (1:N e N:N)
- **Pedidos, Itens do Pedido e Pagamentos** (1:N e N:N)
- **Avaliações / Reviews** (N:N)

## 🚀 Como Executar os Scripts
Os scripts devem ser executados na seguinte ordem:

1. `scripts/01_ddl_schema.sql`: Cria o banco de dados e todas as tabelas com suas constraints.
2. `scripts/02_dml_seed_data.sql`: Popula as tabelas com dados sintéticos de teste.
3. `scripts/03_dql_analytical_queries.sql`: Executa as consultas analíticas e relatórios de vendas.

## 📊 Exemplos de Consultas Analíticas (DQL)
O arquivo DQL contempla relatórios como:
- Visão geral consolidada de vendas com `JOIN` de múltiplas tabelas.
- Faturamento e volume de vendas agrupados por categoria.
- Mapeamento de avaliações de produtos por cliente.
