CREATE DATABASE lojaLucas;

USE lojaLucas;

CREATE TABLE categorias(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60)
);
CREATE TABLE produtos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60),
    preco VARCHAR(20),
    categoriaId INT,
    
    FOREIGN KEY (categoriaId) REFERENCES categorias(id) 
);
CREATE TABLE clientes(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(60),
    telefone VARCHAR(20)
);
CREATE TABLE pedidos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dataPedido DATE,
    clienteId INT,
    
    FOREIGN KEY (clienteId) REFERENCES clientes(id)
);
CREATE TABLE itenspedidos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    quantidade INT,
    preco_unitario INT,
    pedidoId INT,
    produtoId INT,
    
    FOREIGN KEY (pedidoId) REFERENCES pedidos(id),
    FOREIGN KEY (produtoId) REFERENCES produtos(id)
);
CREATE TABLE pagamentos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    metodo_pagamento VARCHAR(100),
    valor_pago INT,
    data_pagamento DATE,
    pedidoId INT,
    
    FOREIGN KEY (pedidoId) REFERENCES pedidos(id)
);

INSERT INTO categorias (nome) VALUES
('Eletronicos'),
('Comidas');

INSERT INTO clientes (nome, email, telefone) VALUES
('Lucas','lucas@lucas.lucas', '0561451'),
('Arthur', 'arthur@arthur.arthur', '654151');

INSERT INTO produtos (nome, preco, categoriaId) VALUES
('aifon', '6515651', 1),
('cebolitos', '10', 2);

INSERT INTO pedidos (dataPedido, clienteId) VALUES
('2024-03-03', 2),
('2022-06-06', 1);

INSERT INTO itenspedidos (quantidade, preco_unitario, pedidoId, produtoId) VALUES
(2, 20, 1, 1),
(10, 5, 2, 2);

INSERT INTO pagamentos (metodo_pagamento ,valor_pago ,data_pagamento ,pedidoId) VALUES
('debito', 3000, '2024-06-10', 2),
('dinheiro', 30, '2021-10-10', 1);

SELECT prod.nome, prod.preco, categorias.nome
FROM produtos AS prod
INNER JOIN categorias ON prod.categoriaId = categorias.id;

SELECT cli.nome, pedidos.dataPedido
FROM clientes AS cli
INNER JOIN pedidos ON pedidos.clienteId = cli.id;

SELECT prod.nome, categorias.nome, pedidos.dataPedido, itenspedidos.quantidade
FROM produtos AS prod
INNER JOIN categorias ON prod.categoriaId = categorias.id
INNER JOIN itenspedidos ON prod.id = itenspedidos.id
INNER JOIN pedidos ON itenspedidos.pedidoId = pedidos.id
