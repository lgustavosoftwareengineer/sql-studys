-- SELECIONANDO TODAS AS NOTAS
SELECT n.nome FROM nota n;

/*AGRUPANDO NOTAS E RESPOSTAS*/
SELECT n.nota FROM nota n 
    JOIN resposta r ON r.id = n.resposta_id; 

/*AGRUPANDO NOTAS, RESPOSTAS E EXERCICIOS*/
SELECT n.nota FROM nota n
    JOIN resposta r ON r.id = n.resposta_id
    JOIN exercicio e on e.id = r.exercicio_id;

/*AGRUPANDO NOTAS, RESPOSTAS, EXERCICIOS E SEÇÕES*/
SELECT n.nota FROM nota n
    JOIN resposta r ON r.id = n.resposta_id
    JOIN exercicio e ON e.id = r.exercicio_id
    JOIN secao s ON s.id = e.secao_id;

/*AGRUPANDO NOTAS, RESPOSTAS, EXERCICIOS, SEÇÕES e CURSOS*/
SELECT n.nota FROM nota n
    JOIN resposta r ON r.id = n.resposta_id
    JOIN exercicio e ON e.id = r.exercicio_id
    JOIN secao s ON s.id = e.secao_id
    JOIN curso c ON c.id = s.curso_id;

/*OBTENDO A MÉDIA DE TODAS AS NOTAS*/
SELECT AVG(n.nota) FROM nota n
    JOIN resposta r ON r.id = n.resposta_id
    JOIN exercicio e ON e.id = r.exercicio_id
    JOIN secao s ON s.id = e.secao_id
    JOIN curso c ON c.id = s.curso_id;

/*OBTENDO A MÉDIA DE ACORDO COM OS CURSOS*/
SELECT c.nome AS 'NOME DO CURSO', AVG(n.nota) AS 'MÉDIA' FROM nota n
    JOIN resposta r ON n.resposta_id = r.id
    JOIN exercicio e ON r.exercicio_id = e.id
    JOIN secao s ON e.secao_id = s.id
    JOIN curso c ON s.curso_id = c.id
    GROUP BY c.nome;

/*OBTENDO A QUANTIDADE DE EXERCICIOS*/
SELECT COUNT(*) FROM exercicio;

/*OBTENDO TODOS OS EXERCICIOS E OS AGRUPANDO POR CURSO*/
SELECT c.nome, COUNT(*) FROM exercicio e 
    JOIN secao s ON e.secao_id = s.id
    JOIN curso c on s.curso_id = c.id
    GROUP BY c.nome;

/*OBTENDO A QUANTIDADE DE ALUNOS POR CURSO*/
SELECT c.nome, COUNT(a.id) FROM curso c 
    JOIN matricula m ON m.curso_id = c.id
    JOIN aluno a ON m.aluno_id = a.id
    GROUP BY c.nome;