CREATE DATABASE walmartsenai;

USE walmartsenai;

CREATE TABLE produto (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    quantidade INT 
);
    
CREATE TABLE cliente (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100),
    idade INT
);
    
CREATE TABLE fornecedor (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100)
);
CREATE TABLE pedido (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_produto INT,
    id_cliente INT,
    id_fornecedor INT,
    FOREIGN KEY (id_produto) REFERENCES produto(id),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id)
);
    
INSERT INTO produto (nome, quantidade) VALUES
('celular', 20),
('cafeteira', 2),
('teclado', 30),
('poltrona', 10),
('cabana', 3);

INSERT INTO cliente (nome, idade) VALUES
('livia', 20),
('rato', 2),
('kami', 39),
('disamis', 19),
('shrek', 25);

INSERT INTO fornecedor (nome) VALUES
('renner'),
('c&a'),
('kings'),
('kabum'),
('cleber bambam');

INSERT INTO pedido (id_produto, id_cliente, id_fornecedor) VALUES
(1, 2, 3),
(2, 3, 4),
(3, 4, 5),
(4, 5, 1),
(5, 1, 2),
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(5, 1, 2),
(4, 3, 5),
(3, 3, 1),
(4, 3, 3);

SELECT cl.nome, cl.idade
FROM cliente AS cl
INNER JOIN pedido ON pedido.id_cliente = cl.id;

SELECT prod.nome, prod.quantidade, forn.nome, cl.nome
FROM produto AS prod
INNER JOIN pedido AS ped ON ped.id_produto = prod.id
INNER JOIN fornecedor AS forn ON forn.id = ped.id_fornecedor
INNER JOIN cliente AS cl ON cl.id = ped.id_cliente;
 