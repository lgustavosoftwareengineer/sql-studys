/*FILTRANDO VALORES ENTRE INTERVALOS*/
    SELECT valor, observacoes, id FROM compras
    WHERE valor BETWEEN 1000 AND 2000;

    SELECT valor, observacoes, id FROM compras
    WHERE data BETWEEN '2013-01-01' AND '2013-12-31';

/*UTILIZANDO UPDATE*/
    UPDATE compras SET valor = 1500, observacoes = 'Reforma de quartos novos'
    WHERE id = 7;

/* 3.3 UTILIZANDO UMA COLUNA COMO REFERÊNCIA PARA OUTRA COLUNA */
    UPDATE compras SET valor = 1650 WHERE id = 7;

    UPDATE compras SET valor = valor * 1.1
    WHERE id BETWEEN 11 AND 14;

    SELECT valor, observacoes FROM compras 
    WHERE id BETWEEN 11 AND 14;

/* 3.4 UTILIZANDO O DELETE */
    DELETE FROM compras 
    WHERE id = 7;
