# 4 EXERCÍCIOS

1. Configure o valor padrão para a coluna recebida.

   R -

   ```SQL
      ALTER TABLE compras MODIFY COLUMN recebida tinyint(1) DEFAULT 0;
   ```

2. Configure a coluna observacoes para não aceitar valores nulos.

   R -

   ```SQL
     ALTER TABLE compras MODIFY COLUMN observacoes varchar(255) NOT NULL;
   ```

3. No nosso modelo atual, qual campo você deixaria com valores DEFAULT e quais não? Justifique sua decisão. Note que como estamos falando de modelagem, não existe uma regra absoluta, existe
   vantagens e desvantagens na decisão que tomar, tente citá-las.

   R - Os campos que eu deixaria com valor default seria o `data` que iria possuir o tempo atual em que a compra foi inserida e o `recebida` para 1, pois subentende-se que todas as compras já estão entregues, pois estou as comprando na hora

4. NOT NULL e DEFAULT podem ser usados também no CREATE TABLE ? Crie uma tabela nova e
   adicione Constraints e valores DAFAULT.

   R -

   ```SQL
      CREATE TABLE compras(
          id INT AUTO_INCREMENT PRIMARY KEY,
          valor DECIMAL(18,2) NOT NULL,
          data DATETIME DEFAULT CURRENT_TIMESTAMP,
          obs VARCHAR(255) NOT NULL,
          recebida TINYINT NOT NULL DEFAULT 1
      );
   ```

5. Reescreva o CREATE TABLE do começo do curso, marcando observacoes como nulo e valor
   padrão do recebida como 1.

   R -

   ```SQL
      CREATE TABLE comprasTwo(
          id INT AUTO_INCREMENT PRIMARY KEY,
          valor DECIMAL(18,2) NOT NULL,
          data DATETIME DEFAULT CURRENT_TIMESTAMP,
          observacoes VARCHAR(255),
          recebida TINYINT NOT NULL DEFAULT 1
      );
   ```
