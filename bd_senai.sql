-- criar entidade departamentos
CREATE TABLE departamentos(
	id_departamento int primary key,
	sigla_departamento VARCHAR(3) NOT NULL,
	nome_departamento VARCHAR(30) NOT NULL

);
-- visualiza a entidade criada
SELECT * FROM cursos;

-- renomeua as colunas
ALTER TABLE departamentos
RENAME COLUMN nomeDepartamento 
to nome_departamento;

-- criar entidade curso
CREATE TABLE curso(
	id_curso int primary key,
	id_departamento int references departamentos(id_departamento),
	sigla_curso varchar(3) not null,
	nome_curso varchar (30) not null
);

ALTER TABLE curso RENAME TO cursos;

SELECT * FROM disciplinas;
CREATE TABLE disciplinas(
	id_disciplina int primary key,
	id_curso int REFERENCES cursos,
	sigla_disciplina VARCHAR(4) NOT NULL,
	nome_disciplina VARCHAR (50) NOT NULL,
	optativa BOOLEAN DEFAULT FALSE
);

alter table CURSOS ALTER COLUMN nome_curso TYPE varchar(50);

SELECT * FROM alunos;
CREATE TABLE aluno(
	ra INT PRIMARY KEY,
	cpf VARCHAR(14) NOT NULL UNIQUE, -- chave candidata
	nome_aluno VARCHAR(50) NOT NULL,
	data_nascimento DATE CHECK (AGE(CURRENT_DATE,DATA_NASCIMENTO)>='14 years')
);

ALTER TABLE aluno ADD COLUMN status BOOLEAN DEFAULT true;
ALTER TABLE aluno RENAME TO alunos;
SELECT * FROM alunos;

-- criar entidade disciplina_alunos
CREATE TABLE disciplina_aluno(
	id_disciplina_aluno INT PRIMARY KEY,
	id_disciplina INT REFERENCES disciplinas,
	ra INT REFERENCES alunos,
	data_matricula DATE

);

SELECT * FROM disciplina_aluno;