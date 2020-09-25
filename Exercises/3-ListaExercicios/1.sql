UPDATE compras 
SET observacoes = 'preparando o natal'
WHERE data = '2014-12-20';

SELECT observacoes, valor, id, data FROM compras
WHERE data = '2014-12-20';