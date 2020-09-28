# 3 EXERCÍCIOS

1. Altere as compras, colocando a observação 'preparando o natal' para todas as que foram efetuadas no dia 20/12/2014.

   R -

   ```SQL
      UPDATE compras SET observacoes = 'preparando o natal' WHERE data = '2014-12-20';
   ```

2. Altere o VALOR das compras feitas antes de 01/06/2013. Some R\$10,00 ao valor atual.

   R -

   ```SQL
      UPDATE compras SET valor = valor + 10 WHERE data < '2013-07-01';
   ```

3. Atualize todas as compras feitas entre 01/07/2013 e 01/07/2014 para que elas tenham a observação 'entregue antes de 2014' e a coluna recebida com o valor TRUE.

   R -

   ```SQL
      UPDATE compras SET observacoes = 'entregue antes de 2014', recebida = TRUE WHERE data BETWEEN '2013-07-01' AND '2014-07-01';
   ```

4. Em um comando WHERE é possível especificar um intervalo de valores. Para tanto, é preciso dizer qual o valor mínimo e o valor máximo que define o intervalo. Qual é o operador que é usado para isso?

   R - Sim o operador utilizado é o `BETWEEN`

   ```SQL
      UPDATE compras SET observacoes = 'entregue antes de 2014', recebida = TRUE WHERE data BETWEEN '2013-07-01' AND '2014-07-01';
   ```

5. Qual operador você usa para remover linhas de compras de sua tabela?

   R - O `DELETE`

   ```SQL
      DELETE FROM compras WHERE valor >= '2012-12-15';
   ```

6. Exclua as compras realizadas entre 05 e 20 março de 2013.

   R -

   ```SQL
      DELETE FROM compras
      WHERE data BETWEEN
      '2013-03-05' AND '2013-03-20';
   ```

7. Existe um operador lógico chamado NOT . Esse operador pode ser usado para negar qualquer condição. Por exemplo, para selecionar qualquer registro com data diferente de 03/11/2014, pode ser
   construído o seguinte WHERE: WHERE NOT DATA = '2011-11-03' Use o operador NOT e monte um SELECT que retorna todas as compras com valor diferente de R\$ 108,00.

   R -

   ```SQL
      SELECT * FROM compras WHERE NOT valor = 108.00;
   ```
