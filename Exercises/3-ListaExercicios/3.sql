SELECT * FROM compras 
WHERE data BETWEEN '2013-07-01' AND '2014-07-01';

UPDATE compras 
SET observacoes = 'entregue antes de 2014',
recebida = TRUE

WHERE data BETWEEN '2013-07-01' AND '2014-07-01';
