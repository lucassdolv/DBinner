CREATE DATABASE salaslibbs;

USE salaslibbs;

CREATE TABLE professor (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    idade INT
);
CREATE TABLE aluno (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    idade int
);
CREATE TABLE turma (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_aluno INT,
    id_professor INT,
    -- FK (coluna atual) RF tablea (nome coluna)
    FOREIGN KEY (id_aluno) REFERENCES aluno(id),
    FOREIGN KEY (id_professor) REFERENCES professor(id)
);

INSERT INTO aluno (nome, idade) VALUES
('rafael',10),
('jorge', 15),
('victor', 18),
('julia', 18),
('nakajima', 29);

INSERT INTO professor (nome, idade) VALUES
('samuel', 30),
('giovanna', 20),
('welton', 30),
('arthur', 22);

INSERT INTO turma (id_professor, id_aluno) VALUES
(2, 4),
(1, 3),
(3, 2),
(4, 1),
(3, 2),
(1, 1),
(4, 3),
(2, 2),
(3, 1);

SELECT al.nome, al.idade, turma.id_professor
FROM aluno AS al
INNER JOIN turma ON turma.id_aluno = al.id;

SELECT pf.nome, pf.idade, turma.id_aluno
FROM professor AS pf
INNER JOIN turma ON turma.id_professor = pf.id;

SELECT al.nome, al.idade, professor.nome
FROM aluno AS al
INNER JOIN turma ON turma.id_aluno = al.id
INNER JOIN professor ON turma.id_professor = professor.id;

SELECT 
	al.nome AS AlunoNome,
    al.idade AS AlunoIdade,
    prof.nome AS NomeProfessor
FROM aluno AS al
INNER JOIN turma AS tm ON tm.id_aluno = al.id
INNER JOIN professor AS prof ON tm.id_professor = prof.id;
