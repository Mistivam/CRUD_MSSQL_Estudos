-- Operações CRUD Treinamento --

-- realizando operações CRUD no estoque da loja Bookstop (uma loja fictícia para estudos) --

-- CRIAR / CREATE --

CREATE DATABASE Bookstop;

CREATE TABLE tb_estoque(
	ID_livro INTEGER PRIMARY KEY (ID_Livro) IDENTITY (1,1),
	nome_Livro VARCHAR (100),
	assunto_livro VARCHAR(40),
	preco_livro DECIMAL(10,2)
	CONSTRAINT PK_ID_livro PRIMARY KEY (ID_livro)
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

-- ALTERAR / UPDATE --

-- A funcionária Marcela Lucena se separou, e pediu para o RH atualizar seus dados. Devemos fazer o mesmo! --

UPDATE tb_vendedores SET nome_vendedor = 'Marcela Carvalho' WHERE ID_vendedor = 3;

SELECT * FROM tb_vendedores;

-- Chegaram novos livros para serem cadastrados no nosso estoque --

INSERT INTO tb_estoque (nome_Livro, assunto_livro,preco_livro)
VALUES 
	('O Chamado de Cthulhu ', 'Terror', 35.00),
	('Carmilla a Vampira de Karnstein', 'Terror', 69.90),
	('O Lobo do Mar', 'Ficção-Aventura', 40.00),
	('Crime e Castigo', 'Romance', 79.90),
	('O Segredo de Luísa', 'Administração', 49.90);

-- Mais um vendedor foi admitido --

INSERT INTO tb_vendedores (nome_vendedor, total_vendas)
VALUES
	('Larissa Santanna', 0);

-- O funcionário Caio Lucena conseguiu um emprego na área de TI e pediu demissão. Excluí-lo da tabela de vendedores --

DELETE FROM tb_vendedores WHERE ID_vendedor = 1;

SELECT * FROM tb_vendedores;

-- Nosso chefe pediu para criarmos uma nova tabela para o estoque. Ele também pediu para incluírmos uma CONSTRAINT --
-- Ele também definiu que devemos impedir campos nulos na nossa base de dados --

DROP TABLE tb_estoque;

CREATE TABLE tb_estoque(
	ID_livro INTEGER IDENTITY (1,1) NOT NULL,
	nome_Livro VARCHAR (100) NOT NULL,
	assunto_livro VARCHAR(40) NOT NULL,
	preco_livro DECIMAL(10,2) NOT NULL
	CONSTRAINT PK_ID_livro PRIMARY KEY (ID_livro)
	);

-- Nosso chefe gostou do resultado e pediu para fazermos o mesmo com a tabela vendedores --

