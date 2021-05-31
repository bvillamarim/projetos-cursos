-- Conferindo o horário
SELECT NOW();

-- Criando tabela aluno
CREATE TABLE aluno (
	id SERIAL,
	nome VARCHAR(255),
	cpf CHAR(11),
	observacao TEXT,
	idade INTEGER,
	dinheiro NUMERIC(10,2),
	altura real,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_aula TIME,
	matriculado_em timestamp
);

-- Visualizando tabela aluno
SELECT * FROM aluno;

-- Incluindo dados
INSERT INTO aluno (
	nome, 
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em
) 
VALUES(
	'Bianca',
	'12345678901',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc imperdiet tempor fringilla. Duis vitae fringilla risus. Donec sed volutpat justo. Aenean et enim non purus lobortis cursus porttitor cursus metus. Aenean at metus ipsum. Nullam facilisis arcu ultricies, hendrerit eros ac, tempor tellus. Nam quis tristique nisi. Pellentesque sollicitudin varius pretium. Donec at tempor arcu. Quisque egestas lobortis sagittis. Vestibulum pellentesque, leo ut consectetur viverra, dui felis hendrerit sem, in lacinia sapien dolor non tellus. Aliquam interdum elementum ante sit amet volutpat. Fusce non dui neque. Mauris non pellentesque quam, eu ullamcorper tellus. Pellentesque nec ultrices magna. In hac habitasse platea dictumst. Nunc maximus placerat mi. Donec ac lorem nec mauris fermentum cursus in interdum augue. Cras egestas dui vel odio aliquam, vitae placerat orci tincidunt. Pellentesque a elit a justo efficitur vulputate. Mauris facilisis tortor massa.',
	26,
	100.5,
	1.77,
	TRUE,
	'1994-07-22',
	'17:30:00',
	'2021-05-02 17:11:45'
);

-- Visualizando tabela aluno
SELECT * FROM aluno;

-- Selecionando somente uma determinada linha
SELECT * 
	FROM aluno
WHERE id = 1; 

-- Modificando somente uma determinada linha
UPDATE aluno
	SET nome = 'Nico', 
	cpf = '10987654321',
	observacao = 'Teste',
	idade = 38,
	dinheiro = 15.23,
	altura = 1.90,
	ativo = FALSE,
	data_nascimento = '1980-01-15',
	hora_aula = '13:00:00',
	matriculado_em = '2020-01-02 15:00:00'
WHERE id = 1;

-- Visualizando tabela aluno
SELECT * FROM aluno;

-- Selecionando somente uma determinada linha
SELECT * 
	FROM aluno
WHERE nome = 'Nico'; 

-- Deletar dados do Nico
DELETE 
	FROM aluno 
WHERE nome = 'Nico';

-- Incluindo dados novamente
INSERT INTO aluno (
	nome, 
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em
) 
VALUES(
	'Bianca',
	'12345678901',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc imperdiet tempor fringilla. Duis vitae fringilla risus. Donec sed volutpat justo. Aenean et enim non purus lobortis cursus porttitor cursus metus. Aenean at metus ipsum. Nullam facilisis arcu ultricies, hendrerit eros ac, tempor tellus. Nam quis tristique nisi. Pellentesque sollicitudin varius pretium. Donec at tempor arcu. Quisque egestas lobortis sagittis. Vestibulum pellentesque, leo ut consectetur viverra, dui felis hendrerit sem, in lacinia sapien dolor non tellus. Aliquam interdum elementum ante sit amet volutpat. Fusce non dui neque. Mauris non pellentesque quam, eu ullamcorper tellus. Pellentesque nec ultrices magna. In hac habitasse platea dictumst. Nunc maximus placerat mi. Donec ac lorem nec mauris fermentum cursus in interdum augue. Cras egestas dui vel odio aliquam, vitae placerat orci tincidunt. Pellentesque a elit a justo efficitur vulputate. Mauris facilisis tortor massa.',
	26,
	100.5,
	1.77,
	TRUE,
	'1994-07-22',
	'17:30:00',
	'2021-05-02 17:11:45'
);

-- Visualizando tabela aluno
SELECT * FROM aluno;

-- Visualizando e renomeando colunas específicas
SELECT 
	nome AS "Nome do aluno", 
	idade,
	matriculado_em AS quando_se_matriculou
FROM aluno;

-- Inserindo mais dados
INSERT INTO aluno (nome) VALUES ('Vinicius Dias');
INSERT INTO aluno (nome) VALUES ('Nico Steppat');
INSERT INTO aluno (nome) VALUES ('João Roberto');
INSERT INTO aluno (nome) VALUES ('Diego');
INSERT INTO aluno (nome) VALUES ('Diogo');

-- Visualizando tabela aluno
SELECT * FROM aluno;

-- Diversas formas de filtrar 
SELECT *
 FROM aluno
WHERE nome = 'Bianca'
;

SELECT *
 FROM aluno
WHERE nome <> 'Bianca'
;

SELECT *
 FROM aluno
WHERE nome != 'Bianca'
;

SELECT *
 FROM aluno
WHERE nome LIKE 'Bianca'
;

SELECT *
 FROM aluno
WHERE nome LIKE '_iogo'
;

SELECT *
 FROM aluno
WHERE nome LIKE 'Di_go'
;

SELECT *
 FROM aluno
WHERE nome NOT LIKE 'Di_go'
;

SELECT *
 FROM aluno
WHERE nome LIKE '%s'
;

SELECT *
 FROM aluno
WHERE nome LIKE '% %'
;

SELECT *
 FROM aluno
WHERE nome LIKE '%i%a%'
;

SELECT *
 FROM aluno
WHERE cpf IS NOT NULL
;

SELECT *
 FROM aluno
WHERE idade <= 35
;

SELECT *
 FROM aluno
WHERE idade BETWEEN 10 AND 40
;

SELECT *
 FROM aluno
WHERE ativo = TRUE
;

SELECT *
 FROM aluno
WHERE nome LIKE 'D%' 
	AND cpf IS NOT NULL
;

SELECT *
 FROM aluno
WHERE nome LIKE 'Diogo' 
	OR nome LIKE 'Rodrigo'
	OR nome LIKE 'Nico%'
;

-- Criando tabela com chave primária
DROP TABLE curso;
CREATE TABLE curso (
	id INTEGER PRIMARY KEY,
	---id INTEGER NOT NULL UNIQUE,
	nome VARCHAR(255) NOT NULL
);

-- Tentando inserir valores nulos
INSERT INTO curso (id, nome) VALUES (NULL, NULL);
INSERT INTO curso (id, nome) VALUES (1, NULL);
INSERT INTO curso (id, nome) VALUES (NULL, 'HTML');

-- Tentando inserir ids iguais
INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (1, 'Javascript');

-- Inserindo corretamente
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');

-- Visualizando tabela curso
SELECT * FROM curso;
-- Visualizando tabela aluno
SELECT * FROM aluno;

-- Simplificando tabela aluno
DROP TABLE aluno;
CREATE TABLE aluno (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);
INSERT INTO aluno (nome) VALUES ('Diogo');
INSERT INTO aluno (nome) VALUES ('Vinicius');

-- Conectando tabelas
CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id)
);

-- Inserindo dados e visualizando os resultados
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1); -- aluno 3 não existe
 
SELECT * FROM aluno WHERE id = 1;
SELECT * FROM curso WHERE id = 1;

SELECT * FROM aluno WHERE id = 2;
SELECT * FROM curso WHERE id = 1;

SELECT * FROM aluno WHERE id = 3; -- aluno 3 não existe
SELECT * FROM curso WHERE id = 1;

-- Criando tabela com chave estrangeira
DROP TABLE aluno_curso;
CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	
	FOREIGN KEY (aluno_id)
	REFERENCES aluno (id),
	
	FOREIGN KEY (curso_id)
	REFERENCES curso (id)
);

-- Inserindo dados
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
-- Tentando inserir id de aluno e de curso inexistentes
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,3);

-- Juntando tabelas
SELECT *
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso 		 ON curso.id 			 = aluno_curso.curso_id
;

-- Inserindo dados
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,2);

-- Busca refinada
SELECT
	aluno.nome as "Nome do aluno",
	curso.nome as "Nome do curso"
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso 		 ON curso.id 			 = aluno_curso.curso_id
;

-- Inserindo dados e visualizando
INSERT INTO aluno (nome) VALUES ('Nico');
SELECT * FROM aluno; --- Tem Nico
SELECT
	aluno.nome as "Nome do aluno",
	curso.nome as "Nome do curso"
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso 		 ON curso.id 			 = aluno_curso.curso_id
; --- Não tem Nico

INSERT INTO curso (id, nome) VALUES (3, 'CSS');
SELECT * FROM curso; --- Tem CSS
SELECT
	aluno.nome as "Nome do aluno",
	curso.nome as "Nome do curso"
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso 		 ON curso.id 			 = aluno_curso.curso_id
; --- Não tem CSS

--- Juntando tabelas
-- LEFT JOIN
SELECT
	aluno.nome as "Nome do aluno",
	curso.nome as "Nome do curso"
	FROM aluno
	LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	LEFT JOIN curso 		 ON curso.id 			 = aluno_curso.curso_id
; --- Tem Nico, mas não CSS

-- RIGHT JOIN
SELECT
	aluno.nome as "Nome do aluno",
	curso.nome as "Nome do curso"
	FROM aluno
	RIGHT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	RIGHT JOIN curso 		 ON curso.id 			 = aluno_curso.curso_id
; --- Tem CSS, mas não Nico

-- FULL JOIN
SELECT
	aluno.nome as "Nome do aluno",
	curso.nome as "Nome do curso"
	FROM aluno
	FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	FULL JOIN curso 		 ON curso.id 			 = aluno_curso.curso_id
; --- Tem Nico e CSS

-- CROSS JOIN
SELECT
	aluno.nome as "Nome do aluno",
	curso.nome as "Nome do curso"
	FROM aluno
	CROSS JOIN curso
;
INSERT INTO aluno(nome) VALUES ('João');
SELECT
	aluno.nome as "Nome do aluno",
	curso.nome as "Nome do curso"
	FROM aluno
	CROSS JOIN curso
;

SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso;

-- Tentando deletar aluno 1
DELETE FROM aluno WHERE id = 1;

-- Refazendo regra de negócio
DROP TABLE aluno_curso;
CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	
	FOREIGN KEY (aluno_id)
	REFERENCES aluno (id)
	ON DELETE CASCADE,
	
	FOREIGN KEY (curso_id)
	REFERENCES curso (id)
);

-- Inserindo dados
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,3);

-- Busca refinada
SELECT
	aluno.nome as "Nome do aluno",
	curso.nome as "Nome do curso"
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso 		 ON curso.id 			 = aluno_curso.curso_id
;

-- Deletando aluno 1
DELETE FROM aluno WHERE id = 1;

-- Tentando mudar id do aluno
UPDATE aluno
	SET id = 12
	WHERE id = 4;
UPDATE aluno
	SET id = 10
	WHERE id = 2;

-- Refazendo regra de negócio
DROP TABLE aluno_curso;
CREATE TABLE aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	
	FOREIGN KEY (aluno_id)
	REFERENCES aluno (id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	
	FOREIGN KEY (curso_id)
	REFERENCES curso (id)
);

-- Inserindo dados
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);

-- Mudar id do aluno
UPDATE aluno
	SET id = 10
	WHERE id = 2;

-- Busca refinada
SELECT
	aluno.id as aluno_id,
	aluno.nome as "Nome do aluno",
	curso.id as "curso_id",
	curso.nome as "Nome do curso"
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso 		 ON curso.id 			 = aluno_curso.curso_id
;

-- Ordenando consultas
DROP TABLE funcionarios;
CREATE TABLE funcionarios (
	id SERIAL PRIMARY KEY,
	matricula VARCHAR(10),
	nome VARCHAR(255),
	sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M007', 'Diogo', 'Oliveira');

SELECT * 
	FROM funcionarios
	ORDER BY nome, matricula DESC;

SELECT * 
	FROM funcionarios
	ORDER BY 3, 4, 2;

SELECT * 
	FROM funcionarios
	ORDER BY 4 DESC, funcionarios.nome, 2 ASC;

-- Limitando consulta
SELECT * 
	FROM funcionarios
	ORDER BY nome
	LIMIT 5;
	
SELECT * 
	FROM funcionarios
	ORDER BY id
	LIMIT 5
	OFFSET 3;

-- COUNT	- Retorna a quantidade de registros
-- SUM		- Retorna a soma dos registros
-- MAX		- Retorna o maior valor dos registros
-- MIN		- Retorna o menor valor dos registros
-- AVG		- Retorna a média dos registros

SELECT 
	COUNT(id),
	SUM(id),
	MAX(id),
	MIN(id),
	ROUND(AVG(id), 0)
	FROM funcionarios;

SELECT DISTINCT 
	nome 
	FROM funcionarios
	ORDER BY nome;	

SELECT 
	nome,
	sobrenome,
	COUNT(id)
	FROM funcionarios
	GROUP BY 1, 2
	ORDER BY nome;
	
SELECT 
	curso.nome,
	COUNT(aluno.id)
	FROM aluno
	JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
	JOIN curso ON curso.id = aluno_curso.curso_id
	GROUP BY 1
	ORDER BY 1;
	
SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso;

SELECT curso.nome,
	COUNT (aluno.id)
	FROM curso
	LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
	LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
	--WHERE curso.nome = 'Javascript'
	GROUP BY 1
	HAVING COUNT (aluno.id) > 0;

SELECT nome,
	COUNT(id)
	FROM funcionarios
	GROUP BY nome
	HAVING COUNT(id) > 1;
	