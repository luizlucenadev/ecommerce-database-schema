-- ========================================================
-- DML - DATA MANIPULATION LANGUAGE
-- Inserindo dados nas tabelas para testar
-- ========================================================

USE loja_virtual;

-- ========================================================
-- 1. POPULANDO A TABELA DE USUÁRIOS
-- ========================================================
INSERT INTO users (name, email, phone, password, cpf) VALUES
('Ana Silva', 'ana.silva@email.com', '11988881111', '$2a$12$e8N...hash_senha_1...', '12345678901'),
('Carlos Eduardo', 'carlos.eduardo@email.com', '21977772222', '$2a$12$e8N...hash_senha_2...', '98765432100'),
('Mariana Santos', 'mariana.santos@email.com', '31966663333', '$2a$12$e8N...hash_senha_3...', '45678912344');

-- ========================================================
-- 2. POPULANDO A TABELA DE ENDEREÇOS
-- ========================================================
INSERT INTO addresses (user_id, postal_code, street_name, street_number, complement, neighborhood, city, state) VALUES
(1, '01001-000', 'Praça da Sé', '100', 'Apto 42', 'Sé', 'São Paulo', 'SP'),
(2, '20000-000', 'Avenida Copacabana', '500', 'Bloco B, Ap 201', 'Copacabana', 'Rio de Janeiro', 'RJ'),
(3, '30100-000', 'Avenida Afonso Pena', '1500', NULL, 'Centro', 'Belo Horizonte', 'MG');

-- ========================================================
-- 3. POPULANDO A TABELA DE CATEGORIAS
-- ========================================================
INSERT INTO categories (name, description) VALUES
('Eletrônicos', 'Smartphones, notebooks, fones de ouvido e acessórios tech.'),
('Vestuário', 'Roupas masculinas, femininas e infantis.'),
('Casa e Decoração', 'Móveis, objetos decorativos e itens para o lar.');

-- ========================================================
-- 4. POPULANDO A TABELA DE PRODUTOS
-- ========================================================
INSERT INTO products (category_id, name, description, price, stock) VALUES
(1, 'Smartphone Galaxy S23', 'Smartphone com 128GB, câmera tripla e 8GB de RAM.', 3499.90, 15),
(1, 'Fone de Ouvido Bluetooth Noise Cancelling', 'Fone sem fio com cancelamento de ruído ativo e bateria de 30h.', 599.00, 30),
(2, 'Camiseta Basic Cotton', 'Camiseta 100% algodão, modelo unissex.', 79.90, 50),
(3, 'Luminária de Mesa LED', 'Luminária articulável com regulagem de intensidade e luz quente/fria.', 129.90, 20);

-- ========================================================
-- 5. POPULANDO A TABELA DE IMAGENS DOS PRODUTOS
-- ========================================================
INSERT INTO product_images (product_id, image_url, is_main) VALUES
(1, 'https://sualoja.com.br/images/s23-front.jpg', TRUE),
(1, 'https://sualoja.com.br/images/s23-back.jpg', FALSE),
(2, 'https://sualoja.com.br/images/fone-black.jpg', TRUE),
(3, 'https://sualoja.com.br/images/camiseta-branca.jpg', TRUE),
(4, 'https://sualoja.com.br/images/luminaria.jpg', TRUE);

-- ========================================================
-- 6. POPULANDO O CARRINHO DE COMPRAS (Para o usuário 3)
-- ========================================================
-- Cria o carrinho para a Mariana (user_id = 3)
INSERT INTO cart (user_id) VALUES (3);

-- Adiciona itens ao carrinho da Mariana (cart_id = 1)
INSERT INTO cart_items (cart_id, product_id, quantity) VALUES
(1, 3, 2), -- 2x Camiseta Basic
(1, 4, 1); -- 1x Luminária LED

-- ========================================================
-- 7. POPULANDO OS PEDIDOS
-- ========================================================
-- Pedido 1: Feito pela Ana Silva (user_id = 1)
INSERT INTO orders (user_id, status, total_amount) VALUES
(1, 'PAID', 3499.90);

-- Pedido 2: Feito pelo Carlos Eduardo (user_id = 2)
INSERT INTO orders (user_id, status, total_amount) VALUES
(2, 'PENDING', 678.90);

-- ========================================================
-- 8. POPULANDO OS ITENS DOS PEDIDOS
-- ========================================================
-- Itens do Pedido 1 (order_id = 1)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 3499.90); -- 1x Smartphone S23

-- Itens do Pedido 2 (order_id = 2)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(2, 2, 1, 599.00), -- 1x Fone Bluetooth
(2, 3, 1, 79.90);   -- 1x Camiseta Basic

-- ========================================================
-- 9. POPULANDO OS PAGAMENTOS
-- ========================================================
-- Pagamento aprovado para o Pedido 1
INSERT INTO payments (order_id, payment_method, status, transaction_id, amount, paid_at) VALUES
(1, 'PIX', 'PAID', 'PIX123456789ABCDEF', 3499.90, NOW());

-- Pagamento pendente para o Pedido 2
INSERT INTO payments (order_id, payment_method, status, transaction_id, amount) VALUES
(2, 'CREDIT_CARD', 'PENDING', 'PAY-998877665544', 678.90);

-- ========================================================
-- 10. POPULANDO AS AVALIAÇÕES (REVIEWS)
-- ========================================================
INSERT INTO reviews (product_id, user_id, rating, comment) VALUES
(1, 1, 5, 'Excelente smartphone! A câmera é incrível e a entrega foi rápida.'),
(3, 2, 4, 'O tecido da camiseta é muito bom, mas ficou um pouco justa.');
