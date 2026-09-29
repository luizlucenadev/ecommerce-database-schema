-- ========================================================
-- DQL - DATA QUERY LANGUAGE / CONSULTAS ANALÍTICAS
-- Projeto: LOJA VIRTUAL
-- Descrição: Scripts de consulta para relatórios e métricas de negócio
-- ========================================================

USE loja_virtual;

-- ========================================================
-- 1. VISÃO GERAL DAS VENDAS (RELATÓRIO DETALHADO)
-- Descrição: Une pedidos, clientes, produtos, categorias e pagamentos.
-- Nota: Utiliza nomes explícitos de tabelas para máxima clareza.
-- ========================================================

SELECT 
    orders.id AS num_pedido,
    orders.created_at AS data_compra,
    users.name AS cliente,
    users.email AS email_cliente,
    categories.name AS categoria,
    products.name AS produto,
    order_items.quantity AS qtd,
    order_items.unit_price AS preco_unitario,
    (order_items.quantity * order_items.unit_price) AS subtotal_item,
    orders.total_amount AS valor_total_pedido,
    orders.status AS status_pedido,
    payments.payment_method AS forma_pagamento,
    payments.status AS status_pagamento
FROM orders
JOIN users ON orders.user_id = users.id
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON order_items.product_id = products.id
JOIN categories ON products.category_id = categories.id
LEFT JOIN payments ON orders.id = payments.order_id
ORDER BY orders.id DESC;


-- ========================================================
-- 2. MÉTRICAS DE FATURAMENTO POR CATEGORIA
-- Descrição: Calcula o total faturado e quantidade de itens vendidos por categoria.
-- ========================================================

SELECT 
    categories.name AS categoria,
    COUNT(DISTINCT orders.id) AS total_pedidos,
    SUM(order_items.quantity) AS total_produtos_vendidos,
    SUM(order_items.quantity * order_items.unit_price) AS faturamento_total
FROM categories
JOIN products ON categories.id = products.category_id
JOIN order_items ON products.id = order_items.product_id
JOIN orders ON order_items.order_id = orders.id
WHERE orders.status = 'PAID'
GROUP BY categories.id, categories.name
ORDER BY faturamento_total DESC;


-- ========================================================
-- 3. AVALIAÇÕES DE PRODUTOS POR CLIENTE
-- Descrição: Lista os comentários e notas atribuídas aos produtos.
-- ========================================================

SELECT 
    products.name AS produto,
    users.name AS cliente,
    reviews.rating AS nota,
    reviews.comment AS comentario,
    reviews.created_at AS data_avaliacao
FROM reviews
JOIN products ON reviews.product_id = products.id
JOIN users ON reviews.user_id = users.id
ORDER BY reviews.created_at DESC;


-- ========================================================
-- 4. CONTAGEM GERAL DE REGISTOS POR TABELA (AUDITORIA DBA)
-- Descrição: Verificação rápida da quantidade de dados em cada entidade.
-- ========================================================

SELECT 'users' AS tabela, COUNT(*) AS total_registos FROM users
UNION ALL
SELECT 'addresses', COUNT(*) FROM addresses
UNION ALL
SELECT 'categories', COUNT(*) FROM categories
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'product_images', COUNT(*) FROM product_images
UNION ALL
SELECT 'cart', COUNT(*) FROM cart
UNION ALL
SELECT 'cart_items', COUNT(*) FROM cart_items
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'payments', COUNT(*) FROM payments
UNION ALL
SELECT 'reviews', COUNT(*) FROM reviews;