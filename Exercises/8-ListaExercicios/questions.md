# 4 EXERCÍCIOS

1. Exiba a média das notas por curso.

   R -

   ```SQL
      SELECT c.nome, AVG(n.nota) FROM nota n
         JOIN resposta r ON n.resposta_id = r.id
         JOIN exercicio e ON r.exercicio_id = e.id
         JOIN secao s ON e.secao_id = s.id
         JOIN curso c ON s.curso_id = c.id
         GROUP BY c.nome;
   ```

2. Devolva o curso e as médias de notas, levando em conta somente alunos que tenham "Silva" ou "Santos" no sobrenome.

   R -

   ```SQL
      SELECT c.nome, a.nome, AVG(n.nota) FROM nota n
         JOIN resposta r ON n.resposta_id = r.id
         JOIN exercicio e ON r.exercicio_id = e.id
         JOIN secao s ON e.secao_id = s.id
         JOIN curso c ON s.curso_id = c.id
         JOIN matricula m ON m.curso_id = m.id
         JOIN aluno a ON m.aluno_id = a.id
         WHERE a.nome LIKE '%silva%' OR a.nome LIKE'%santos%'
         GROUP BY c.nome, a.nome;
   ```

3. Conte a quantidade de respostas por exercício. Exiba a pergunta e o número de respostas.

   R -

   ```SQL
      SELECT e.pergunta, COUNT(r.id) FROM resposta r
         JOIN exercicio e ON r.exercicio_id = e.id
         GROUP BY e.pergunta;
   ```

4. Você pode ordenar pelo COUNT também. Basta colocar ORDER BY COUNT(coluna).Pegue a resposta do exercício anterior, e ordene por número de respostas, em ordem decrescente.

   R -

   ```SQL
         SELECT e.pergunta, COUNT(r.id) FROM resposta r
         JOIN exercicio e ON r.exercicio_id = e.id
         GROUP BY e.pergunta
         ORDER BY COUNT(r.id);
   ```
