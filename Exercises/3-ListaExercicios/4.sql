/*Sim o operador utilizado é o BETWEEN */
UPDATE compras 
SET observacoes = 'entregue antes de 2014', recebida = TRUE
WHERE data BETWEEN '2013-07-01' AND '2014-07-01';