-- alterando o tamanho do varchar da coluna nome_departamento
ALTER TABLE departamentos ALTER COLUMN nome_departamento TYPE VARCHAR(50);

--povoando a entidade departamentos
INSERT INTO departamentos 
VALUES (1, 'CST', 'Curso Superior em Tecnologia');

INSERT INTO departamentos 
VALUES (2, 'CT', 'Curso Técnico');

-- é possível inserir tudo sem precisar declarar o insert into toda hora
INSERT INTO departamentos 
VALUES
(3, 'CT', 'Curso Técnico'),
(4, 'CAI', 'Curso de Aprendizagem Industrial');

-- verificando se os dados chegaram na tabela 
SELECT * FROM departamentos;

-- atualizando um dado inserido
-- UPDATE departamentos SET nome_departamento = 'Formação Inicial e Continuada'
-- WHERE id_departamento=4
-- é importante ter o WHERE, se não ele atualiza todos os nome_departamento
UPDATE departamentos 
SET sigla_departamento = '' 
WHERE id_departamento = '';

-- visualizar a tabela ordenada pelo id decrescente 
SELECT * FROM departamentos 
ORDER BY id_departamento DESC;

-- visualizar a rablea ordenada pela sigla 
SELECT * FROM cursos;
ORDER BY sigla_departamento;

-- fazer contagem de todas linhas, incluindo o null
SELECT COUNT (*) FROM departamentos;

-- fazer contagem de todas as linhas que não possuem o null
SELECT COUNT ('any') FROM departamentos;


-- alterando dados da tabela cursos 
INSERT INTO cursos 
VALUES

(3,2,'DEV', 'Técnico em Desenvolvimento de Sistemas'),
(4,2,'MEC','Técnico em Mecatrônica'),
(5,3,'EME','Eletricista de Manutenção Eletroeletrônico'),
(6,3,'MUS','Mecânico de Usinagem'),
(7,3,'ADM','Administração'),
(8,4,'CLP','Controladores Lógico Programáveis'),
(9,4,'EXC','Excel'),
(10, 4, 'PBI', 'Power BI'),
(11,4, 'ROB', 'Robótica Industrial'),
(12,4,'EIN', 'Eletricista Instalador'),
(13, 4, 'HDR', 'Hidráulixa'),
(14, 4, 'PNE', 'Pneumática'),
(15, 4, 'FER', 'Ferramenteiro');

UPDATE departamentos 
SET nome_departamento= 'Formação Inicial e Continuada'
WHERE id_departamento=3;

SELECT * FROM cursos;
SELECT * FROM departamentos;
SELECT sigla_curso, nome_curso FROM cursos;

-- quantos cursos então cadastrados?
SELECT COUNT ('any') FROM cursos;
SELECT COUNT (*) FROM cursos;

-- mostrar tabela de departamemto e seus respectivos cursos (junta depart e cursos)
SELECT departamentos.sigla_departamento, cursos.nome_curso
FROM cursos INNER JOIN departamentos
ON departamentos.id_departamento= cursos.id_departamento;
-- sigla_departamento pertence à departamento e nome_curso pertence à tabela curso

-- variação do mesmo comando acima
SELECT sigla_departamento,nome_curso
FROM cursos INNER JOIN departamentos
USING (id.departamento) -- precisa ter o mesmo nome nas colunas

--outra variação do INNER JOIN 
SELECT sigla_departamento, nome_curso
FROM cursos NATURAL INNER JOIN departamentos; --acha a chave primária dos dois 

--quantos cursos cada departamento possui?
SELECT id_departamento, COUNT (id_curso)
FROM cursos --tabela cursos 
GROUP BY id_departamento
ORDER BY id_departamento; -- exibe números repetidos apenas uma vez

--exiba as siglas dos departamentos e a contagem dos cursos para cada sigla
-- a exibição será feita a partir da tabela derivada pela junção de cursos com departamentos agrupada pelas
--siglas de departamento
SELECT sigla_departamento, COUNT(nome_curso)
FROM cursos NATURAL INNER JOIN departamentos
GROUP BY sigla_departamento;
