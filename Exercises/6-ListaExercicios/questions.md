# 4 EXERCÍCIOS

1. Crie a tabela compradores com id , nome , endereco e telefone .

   R -

   ```SQL
      CREATE TABLE compradores(
         id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
         nome VARCHAR(255),
         endereco VARCHAR(255),
         telefone VARCHAR(255),
      );
   ```

2. Insira os compradores, Guilherme e João da Silva.

   R -

   ```SQL
   /*GUILHERME*/
      INSERT INTO compradores (nome, endereco, telefone) VALUES (
        'Guilherme',
        'Rua Tal',
        '9.9188-7722'
      );

   /*JOÃO DA SILVA*/
      INSERT INTO compradores (nome, endereco, telefone) VALUES (
         'João Da Silva',
         'Rua Tal Tal',
         '9.8188-2233'
      );
   ```

3. Adicione a coluna id_compradores na tabela compras e defina a chave estrangeira (FOREIGN KEY) referenciando o id da tabela compradores.

   R -

   ```SQL
   /*ADICIONANDO COLUNA 'id_compradores'*/
      ALTER TABLE compras ADD COLUMN id_compradores INT;
   /*DEFININDO CHAVE ESTRANGEIRA*/
      ALTER TABLE compras ADD CONSTRAINT fk_compradores FOREIGN KEY (id_compradores) REFERENCES compradores(id);
   ```

4. Atualize a tabela compras e insira o id dos compradores na coluna id_compradores.

   R -

   ```SQL
   /*ATUALIZANDO A PRIMEIRA METADE DA TABELA*/
      UPDATE compras set id_compradores = 1 WHERE id < 21;
   /*ATUALIZANDO A SEGUNDA METADE*/
      UPDATE compras set id_compradores = 2 WHERE id > 20;
   ```

5. Exiba o NOME do comprador e o VALOR de todas as compras feitas antes de 09/08/2014.

   R -

   ```SQL
      SELECT compradores.nome, compras.valor, data
      FROM compras
      JOIN compradores ON compras.id_compradores = compradores.id
      WHERE data < '2014-08-09' ORDER BY data;
   ```

6. Exiba todas as compras do comprador que possui ID igual a 2.

   R -

   ```SQL
      SELECT
      compras.data as 'Data da compra',
      compras.obs as 'Observação',
      compras.valor as 'Valor',
      compradores.nome as 'Comprador'
      FROM compras
      JOIN compradores ON compras.id_compradores = compradores.id
      WHERE compradores.id = 2 ORDER BY compras.data;
   ```

7. Exiba todas as compras (mas sem os dados do comprador), cujo comprador tenha nome que começa com 'GUILHERME'.

   R -

   ```SQL
      SELECT compras.id, compras.valor, compras.data, compras.obs, compras.recebida
      FROM compras
      JOIN compradores ON compras.id_compradores = compradores.id
      WHERE compradores.nome LIKE 'GUILHERME%';
   ```

8. Exiba o nome do comprador e a soma de todas as suas compras.

   R -

   ```SQL
      SELECT
      SUM(compras.valor) AS 'Soma',
      compradores.nome AS 'Nome'
      FROM compras
      JOIN compradores ON compras.id_compradores = compradores.id
      GROUP BY compradores.nome;
   ```

9. A tabela compras foi alterada para conter uma FOREIGN KEY referenciando a coluna id da tabela compradores . O objetivo é deixar claro para o banco de dados que compras.id_compradores está de alguma forma relacionado com a tabela compradores através da coluna compradores.id . Mesmo sem criar a FOREIGN KEY é possível relacionar tabelas através do comando JOIN.

   R -

   ```
      Sim, é possível. O FOREIGN KEY funciona somente para adicionar um constraints na tabela compras, de que só será possível adicionar um id de comprador existente na tabela compradores.
   ```

10. Qual a vantagem em utilizar a FOREIGN KEY?

R -

```
   Ela adiciona um constraints na coluna referente a FOREIGN KEY na tabela compras de que só poderá ser adicionado um id existente na tabela a qual essa chave estrangeira faz alusão.
```

11. Crie uma coluna chamada "forma_pagto" do tipo ENUM e defina os valores: 'BOLETO' e 'CREDITO'.

R -

```SQL
   ALTER TABLE compras ADD COLUMN forma_pagto ENUM('BOLETO', 'CREDITO');
```

12. Ative o strict mode na sessão que está utilizando para impossibilitar valores inválidos. Utilize o modo "STRICT_ALL_TABLES". E verifique se o SQL mode foi alterado fazendo um SELECT na sessão.

R -

```SQL
   SET SESSION sql_mode = 'STRICT_ALL_TABLES';
   SELECT @@SESSION.sql_mode; /*VERIFICANDO A MODIFICAÇÃO DO MODO*/
```

13. Tente inserir uma compra com forma de pagamento diferente de 'BOLETO' ou 'CREDITO', por exemplo, 'DINHEIRO' e verifique se o MySQL recusa a inserção.

R -

```SQL
   INSERT INTO compras (obs, valor, forma_pagto) VALUES ('Guloseimas', 20, 'DINHEIRO');
   -- ERROR 1265 (01000): Data truncated for column 'forma_pagto' at row 1 --
```

14. Adicione as formas de pagamento para todas as compras por meio da instrução UPDATE.

R -

```SQL

   /*ATUALIZANDO PARTE DA TABELA PARA BOLETO*/
   UPDATE compras SET forma_pagto = 'BOLETO' WHERE MOD(id, 2) != 0;

   /*ATUALIZANDO PARTE DA TABELA PARA CREDITO*/
   UPDATE compras SET forma_pagto = 'CREDITO' WHERE MOD(id, 2) = 0;

```

15. Faça a configuração global do MySQL para que ele sempre entre no strict mode.

R -

```SQL
   SET GLOBAL sql_mode = 'STRICT_ALL_TABLES';
   SELECT @@GLOBAL.sql_mode;
```
