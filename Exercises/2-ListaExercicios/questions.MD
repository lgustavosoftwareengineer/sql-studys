# 2 EXERCÍCIOS

1. Selecione valor e observacoes de todas as compras cuja data seja maior-ou-igual que 15/12/2012.

   R -

   ```SQL
      SELECT valor, observacoes, data
      FROM compras
      WHERE valor >= '2012-12-15';
   ```

2. Qual o comando SQL para juntar duas condições diferentes? Por exemplo, SELECT \* FROM TABELA WHERE campo > 1000 campo < 5000. Faça o teste e veja o resultado.

   R -

   ```SQL
      SELECT * FROM compras
      WHERE valor > 1000
      AND valor < 5000;
   ```

3. Vimos que todo texto é passado através de aspas simples ('). Posso passar aspas duplas (") no lugar?

   R - Sim

4. Selecione todas as compras cuja data seja maior-ou-igual que 15/12/2012 e menor do que 15/12/2014.

   R -

   ```SQL
      SELECT * FROM compras
      WHERE valor > 1000
      AND valor < 5000;
   ```

5. Selecione todas as compras cujo valor esteja entre R$15,00 e R$35,00 e a observação comece com a palavra 'Lanchonete'.

   R -

   ```SQL
      SELECT * FROM compras
      WHERE valor >= 15 AND valor <= 35
      AND observacoes LIKE "Lanchonete";
   ```

6. Selecione todas as compras que já foram recebidas.

   R -

   ```SQL
      SELECT * FROM compras
      WHERE recebida = 1;
   ```

7. Selecione todas as compras que ainda não foram recebidas.

   R -

   ```SQL
      SELECT * FROM compras
      WHERE recebida = 0;
   ```

8. Vimos que para guardar o valor VERDADEIRO para a coluna recebida , devemos passar o valor 1.

   R - Funciona True e FALSE;

9. Selecione todas as compras com valor maior que 5.000,00 ou que já foram recebidas.

   R -

   ```SQL
      SELECT * FROM compras
      WHERE valor > 5000 OR recebida = TRUE;
   ```

10. Selecione todas as compras que o valor esteja entre 1.000,00 e 3.000,00 ou seja maior que 5.000,00.

    R -

    ```SQL
      SELECT * FROM compras
      WHERE valor >= 1000 AND
      valor <= 3000 OR  valor > 5000;
    ```
