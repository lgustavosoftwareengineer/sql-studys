# 4 EXERCÍCIOS

1. Calcule a média de todas as compras com datas inferiores a 12/05/2013.

   R -

   ```SQL
      SELECT AVG(valor) AS média FROM compras WHERE data < '2013-05-12';
   ```

2. Calcule a quantidade de compras com datas inferiores a 12/05/2013 e que já foram recebidas.

   R -

   ```SQL
     SELECT COUNT(*) AS 'AMOUNT OF ITENS' FROM compras WHERE data < '2013-05-12' AND recebida = 1;
   ```

3. Calcule a soma de todas as compras, agrupadas se a compra recebida ou não.

   R -

   ```SQL
      SELECT SUM(valor) AS 'SUM OF THE ITENS', recebida AS 'RECEIVED' FROM compras GROUP BY recebida;
   ```
