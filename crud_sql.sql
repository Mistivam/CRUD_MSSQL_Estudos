-- Operações CRUD Treinamento --

-- realizando operações CRUD no estoque da loja Bookstop (uma loja fictícia para estudos) --

-- CRIAR / CREATE --

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
	ID_livro INTEGER PRIMARY KEY IDENTITY (1,1) NOT NULL,
	nome_Livro VARCHAR (100) NOT NULL,
	assunto_livro VARCHAR(40) NOT NULL,
	preco_livro NUMERIC (10,2) NOT NULL	
	);

-- Nosso chefe gostou do resultado e pediu para fazermos o mesmo com a tabela vendedores --

SELECT * FROM tb_estoque;

DROP TABLE tb_vendedores;

CREATE TABLE tb_vendedores(
	matricula INTEGER PRIMARY KEY IDENTITY (1,1) NOT NULL,
	nome_vendedor VARCHAR (100) NOT NULL,
	departamento VARCHAR (50) NOT NULL,
	salario NUMERIC (10,2) NOT NULL,
	vendas NUMERIC (10,2) NOT NULL	
	);

	SELECT * FROM tb_vendedores;

	-- Agora que criamos as planilhas, na véspera do feriado de Carnaval, sexta feira ás 17:50 nosso chefe nos mandou --
	-- popular as planilhas de estoque e vendedor --

	INSERT INTO tb_estoque(nome_Livro, assunto_livro, preco_livro)
			VALUES 
				('A Revolução dos Bichos', 'Ficção', 12.90),
				('O Hobbit', 'Fantasia', 41.90),
				('Coraline', 'Fantasia',43.90),
				('O Pequeno Príncipe', 'Infantil', 16.30),
				('E não sobrou nenhum', 'suspense', 32.90),
				('Coleção Harry Potter', 'Fantasia', 199.90),
				('O Chamado de Cthulhu ', 'Terror', 35.00),
				('Carmilla a Vampira de Karnstein', 'Terror', 69.90),
				('O Lobo do Mar', 'Ficção-Aventura', 40.00),
				('Crime e Castigo', 'Romance', 79.90),
				('O Segredo de Luísa', 'Administração', 49.90);

SELECT * FROM tb_estoque;

INSERT INTO tb_vendedores(nome_vendedor, departamento, salario, vendas)
	VALUES
		('José da Silva', 'vendas chat', 2500.00, 13076.00),
		('Maria Souza', 'vendas loja', 2500.00, 15430.90);

SELECT * FROM tb_vendedores;

/*Nosso chefe pediu para excluirmos o campo vendas da tb_vendedores e criarmos uma tb_vendas com matricula e
  valores de vendas por vendedor */

ALTER TABLE tb_vendedores DROP COLUMN vendas;

CREATE TABLE tb_vendas(
	matricula INTEGER NOT NULL,
	vendas NUMERIC (10,2)
	);

/*Nosso chefe também pediu para cadastrarmos uma Foreign Key para a tabela vendas e devemos usar a 
  matrícula do vendedor */

ALTER TABLE tb_vendas ADD CONSTRAINT FK_matricula FOREIGN KEY (matricula)
	REFERENCES tb_vendedores (matricula);

SELECT * FROM tb_vendas;

INSERT INTO tb_vendas (matricula, vendas)
	VALUES
		(1, 13076.00),
		(2, 15430.90);


			

		