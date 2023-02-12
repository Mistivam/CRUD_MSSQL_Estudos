-- Operações CRUD Treinamento --

-- realizando operações CRUD no estoque da loja Bookstop (uma loja fictícia para estudos) --

-- CRIAR / CREATE --

CREATE DATABASE Bookstop;

CREATE TABLE tb_estoque(
	ID_livro INTEGER PRIMARY KEY (ID_Livro) IDENTITY (1,1),
	nome_Livro VARCHAR (100),
	assunto_livro VARCHAR(40),
	preco_livro DECIMAL(10,2)
	);

CREATE TABLE tb_vendedores(
	ID_vendedor INTEGER PRIMARY KEY (ID_vendedor) IDENTITY (1,1),
	nome_vendedor VARCHAR (100),
	total_vendas DECIMAL(10,2)
);

-- VISUALIZAR /READ --

SELECT * FROM tb_estoque;
SELECT * FROM tb_vendedores;

-- INSERIR INFORMAÇÃO / INSERT DATA --

INSERT INTO tb_estoque (nome_Livro, assunto_livro,preco_livro)
VALUES 
	('Código Limpo', 'Computação', 50.00),
	('Use a Cabeça!: Java', 'Computação', 60.00),
	('Fundamentos de Matemática Elementar', 'Matemática', 40.00);

INSERT INTO tb_vendedores (nome_vendedor, total_vendas)
VALUES
	('Caio Lucena', 4450.00),
	('Felipe Oliveira', 6530.00),
	('Marcela Lucena', 5570.00);

SELECT * FROM tb_vendedores;

-- ATUALIZAR / UPDATE --

SELECT * FROM tb_vendedores;
SELECT * FROM tb_estoque;

-- O livro 'Código Limpo' está em promoção só neste fim de semana !--
-- Corra já para a Bookstop mais próxima de você e leve o seu pra casa! --

UPDATE tb_estoque SET preco_livro = 40.00 WHERE ID_livro = 1;

-- EXCLUIR /DELETE --

-- Por conta da volta às aulas todos os exemplares do livro ' Fundamentos de Matemática Elementar foram vendidos! --
-- Precisamos atualizar a nossa base de dados --

DELETE FROM tb_estoque WHERE ID_livro = 3;

SELECT * FROM tb_estoque;