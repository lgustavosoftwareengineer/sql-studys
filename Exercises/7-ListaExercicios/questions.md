# 4 EXERCÍCIOS

1. Busque todos os alunos que não tenham nenhuma matrícula nos cursos.

   R -

   ```SQL
      SELECT a.nome FROM aluno a WHERE NOT EXISTS(SELECT m.id FROM matricula m WHERE m.aluno_id = a.id);
   ```

2. Busque todos os alunos que não tiveram nenhuma matrícula nos últimos 45 dias, usando a instrução EXISTS .

   R -

   ```SQL
      SELECT a.nome from aluno a WHERE NOT EXISTS(SELECT m.id FROM matricula m WHERE m.aluno_id = a.id AND data < '2015-12-12');
   ```

3. É possível fazer a mesma consulta sem usar EXISTS ? Quais são?

   R -
   Sim, com o uso do `JOIN` no lugar. Exemplo:

   ```SQL
      SELECT a.nome FROM aluno a WHERE a.id NOT IN (SELECT m.aluno_id FROM matricula m WHERE m.aluno_id = a.id);

   ```
