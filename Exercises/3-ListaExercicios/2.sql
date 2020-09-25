SELECT * FROM compras 
WHERE data < '2013-07-01';

UPDATE compras SET valor = valor + 100
WHERE data < '2013-07-01';

SELECT * FROM compras 
WHERE data < '2013-07-01';
