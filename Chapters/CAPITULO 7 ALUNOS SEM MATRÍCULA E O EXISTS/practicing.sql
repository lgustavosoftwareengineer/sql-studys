/*CRIANDO O BANCO DE DADOS ESCOLA*/
CREATE DATABASE escola;

/*IMPORTANDO A BASE DE DADOS PARA O MEU BANCO DE DADOS*/
mysql -u root -p escola < escola.sql 

/*(PARA WINDOWS) IMPORTANDO A BASE DE DADOS PARA O MEU BANCO DE DADOS*/
mysql -u root -p escola
source escola.sql;

/*OBTENDO DETALHES ACERCA DAS TABELAS DE ESCOLA*/
SHOW TABLES;
DESC aluno;
DESC curso;
DESC matricula;

/*RETORNANDO OS ALUNOS MATRICULADOS*/
SELECT a.nome FROM aluno a JOIN matricula m ON a.id = m.aluno_id;

/*RETORNANDO OS ALUNOS MATRICULADOS COM O CURSO EM QUE ESTÁ MATRICULADO*/
SELECT a.nome, c.nome FROM aluno a
JOIN matricula m ON m.aluno_id = a.id
JOIN curso c ON m.curso_id = c.id;

/*OBTENDO A QUANTIDADE DE ALUNOS*/
SELECT COUNT(*) AS 'QUANTIDADE' FROM aluno;

/*A FUNÇÃO 'EXISTS()' SERVE PARA VERIFICAR SE EXISTE ALGUM REGISTRO DE ACORDO COM UMA DETERMINADA QUERY */
/* PS. QUANDO SE É UTILIZADO UMA QUERY DENTRO DE UMA FUNÇÃO NOMEAMOS ESTA QUERY DE SUBQUERY */
SELECT a.nome FROM aluno a WHERE EXISTS (SELECT m.id FROM matricula m WHERE m.aluno_id = a.id); 

/*RETORNANDO OS ALUNOS QUE NÃO ESTÃO MATRICULADOS COM O 'NOT'*/
SELECT a.nome FROM aluno a WHERE NOT EXISTS (SELECT m.id FROM matricula m WHERE m.aluno_id = a.id);

/*RETORNANDO TODOS OS EXERCICIOS QUE NÃO FORA RESPONDIDOS*/
SELECT * FROM exercicio e WHERE NOT EXISTS (SELECT r.id FROM resposta r WHERE e.id = r.exercicio_id);
SELECT e.id, e.pergunta FROM exercicio e WHERE NOT EXISTS (SELECT r.id FROM resposta r WHERE r.exercicio_id = e.id);

/*RETORNANDO TODOS OS CURSO QUE NÃO POSSUEM MATRÍCULA*/
SELECT c.nome FROM curso c WHERE NOT EXISTS (SELECT m.id FROM matricula m WHERE m.curso_id = c.id);

/*RETORNANDO TODOS OS ALUNOS E O CURSO JUNTO COM A MATRICULA*/
SELECT a.nome as 'Nome do aluno', c.nome as 'Nome do curso' FROM aluno a 
JOIN matricula m ON m.aluno_id = a.id
JOIN curso c on m.curso_id = c.id;

/*RETORNANDO TODOS OS ALUNOS QUE NÃO RESPONDERAM E QUE ESTÃO MATRICULADOS*/
SELECT a.nome AS 'Nome do aluno', c.nome AS 'Nome do curso' FROM aluno a 
JOIN matricula m ON m.aluno_id = a.id
JOIN curso c ON m.curso_id = c.id
WHERE NOT EXISTS(SELECT r.aluno_id FROM resposta r WHERE r.aluno_id = a.id);

/*RETORNANDO TODOS OS ALUNOS MATRICULADOS QUE RESPONDERAM O EXERCICIO*/
SELECT r.id, a.nome FROM aluno a JOIN resposta r ON r.aluno_id = a.id
WHERE EXISTS(SELECT m.aluno_id FROM matricula m WHERE m.aluno_id = a.id);