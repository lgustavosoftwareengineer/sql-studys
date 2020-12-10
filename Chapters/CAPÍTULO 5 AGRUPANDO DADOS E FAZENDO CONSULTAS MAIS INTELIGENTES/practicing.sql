/*A FUNÇÃO "SUM()" SOMA TODOS OS VALORES DE UMA COLUNA*/
SELECT SUM(valor) FROM compras;

/*ADICIONEI UMA CONDIÇÃO: SOMAR TODOS OS VALORES ONDE AS COMPRAS FORAM RECEBIDAS*/
SELECT SUM(valor) FROM compras WHERE recebida = 1;

/*ADICIONEI UMA CONDIÇÃO: SOMAR TODOS OS VALORES ONDE AS COMPRAS NÃO FORAM RECEBIDAS*/
SELECT SUM(valor) FROM compras WHERE recebida = 0;

/*A FUNÇÃO "COUNT()" CONTA A QUANTIDADE DE ELEMENTOS*/
SELECT COUNT(*) FROM compras WHERE recebida = 1;

/*"GROUP BY" É RESPONSÁVEL POR AGRUPAR UMA CONSULTA NUMA LINHA SÓ */
/*
GROUP BY deve ser utilizado sempre que queremos utilizar uma função de agregação 
para trazer um valor (no exemplo, a coluna valor) com alguma outra coluna 
onde não efetuamos nenhuma operação (no exemplo, a coluna recebida).
*/
SELECT recebida, SUM(valor) FROM compras GROUP BY recebida;

/*O "AS" PODE SER UTILIZADO PARA RENOMEAR COLUNAS*/
SELECT recebida, SUM(valor) AS soma FROM compras GROUP BY recebida;

/*SE PODE AINDA APLICAR FILTRO EM "FUNÇÕES DE AGREGAÇÃO(SUM, COUNT, ETC)"*/
SELECT recebida, SUM(valor) AS soma FROM compras WHERE valor < 1000 GROUP BY recebida;

/*VERIFICANDO ANO (YEAR) E MÊS (MONTH) QUE A COMPRA FOI ENTREGUE OU NÃO E O VALOR DA SOMA*/
SELECT MONTH(data) AS mes, YEAR(data) as ano, recebida, SUM(valor) as soma FROM compras GROUP BY recebida, mes, ano;

/*ORDENANDO OS RESULTADOS DAS QUERYS ROBUSTAS COMO "ORDER BY"*/
SELECT MONTH(data) AS mes, YEAR(data) AS ano, recebida, SUM(valor) AS soma FROM compras GROUP BY recebida, mes, ano ORDER BY mes;

/*AINDA EXISTE OUTRAS FUNÇÕES DE AGREGAÇÃO COMO AVG*/
SELECT MONTH(data) as mes, YEAR(data) as ano, recebida, AVG(valor) as média FROM compras GROUP BY recebida, mes, ano ORDER BY ano, mes;