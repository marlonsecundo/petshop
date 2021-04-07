-- CADASTRO DE ANIMAIS

CREATE FUNCTION animal_cadastro() RETURNS trigger AS $animal_cadastro$

BEGIN
IF NEW.Cliente_idCliente IS NULL THEN
    INSERT INTO Adocao ( Animal_idAnimal, dataAdocao, diaSemanaMonstuario) 
    VALUES(New.idAnimal, null, 0);
END IF;

IF NEW.Pelagem_idPelagem IS NULL THEN
RAISE EXCEPTION 'Pelagem não pode ser nulo';
END IF;

IF NEW.idade < 0 OR NEW.idade is NULL THEN
RAISE EXCEPTION 'idade não pode ser menor que zero';
END IF;

IF LENGTH(NEW.raca)<3 OR NEW.raca IS NULL  THEN
RAISE EXCEPTION 'raca deve ter mais de 3 caracteres';
END IF;

IF NEW.peso <= 0.0 OR NEW.peso IS NULL THEN
RAISE EXCEPTION 'peso não pode ser menor ou igual a zero';
END IF;

IF NEW.tamanho <= 0.0 OR NEW.tamanho IS NULL THEN
RAISE EXCEPTION 'tamanho não pode ser menor ou igual zero';
END IF;

RETURN NEW;
END;
$animal_cadastro$ LANGUAGE plpgsql;

CREATE TRIGGER animal_gatilho AFTER INSERT OR UPDATE
ON animal
FOR EACH ROW EXECUTE 
PROCEDURE animal_cadastro();


-- CADASTRO DE VACINAS
-- WIP: DATA VACINA


CREATE FUNCTION vacina_animal() RETURNS trigger AS $vacina_animal$
BEGIN

IF NEW.Animal_idAnimal IS NULL THEN
RAISE EXCEPTION 'Animal não pode ser nulo';
END IF;

IF NEW.Funcionario_idFuncionario IS NULL THEN
RAISE EXCEPTION 'Funcionario não pode ser nulo';
END IF;

IF LENGTH(NEW.nomeVacina)<3 OR NEW.nomeVacina IS NULL THEN
RAISE EXCEPTION 'nomeVacina deve ter mais de 3 caracteres';
END IF;

IF NEW.dataVacina IS NULL THEN
RAISE EXCEPTION 'dataVacina não pode ser nulo';
END IF;

IF NEW.dataVencimento IS NULL THEN
RAISE EXCEPTION 'dataVencimento não pode ser nulo';
END IF;

RETURN NEW;
END;
$vacina_animal$ LANGUAGE plpgsql;

CREATE TRIGGER vacina_gatilho AFTER INSERT OR UPDATE
ON vacina
FOR EACH ROW EXECUTE 
PROCEDURE vacina_animal();


-- ADOÇÃO ANIMAL
-- WIP: CLIENTE ID NA HORA DE ADOTAR

CREATE FUNCTION adocao_animal() RETURNS trigger AS $adocao_animal$
BEGIN
IF NEW.Animal_idAnimal IS NULL THEN
RAISE EXCEPTION 'Animal não pode ser nulo';
END IF;

IF NEW.diaSemanaMonstuario < 0 OR NEW.diaSemanaMonstuario > 6 OR NEW.diaSemanaMonstuario IS NULL THEN
RAISE EXCEPTION 'DiaSemanaMonstuario tem que ser um valor entre 0 e 6';
END IF;

RETURN NEW;
END;
$adocao_animal$ LANGUAGE plpgsql;


CREATE TRIGGER adocao_gatilho AFTER INSERT OR UPDATE
ON adocao
FOR EACH ROW EXECUTE 
PROCEDURE adocao_animal();

--- COMPRA DE PRODUTOS

CREATE FUNCTION compra_produto() RETURNS trigger AS $compra_produto$
BEGIN 
IF NEW.dataCompras IS NULL THEN
RAISE EXCEPTION 'Data não pode ser nula';
END IF;

IF NEW.quantidade <= 0 OR NEW.quantidade IS NULL THEN
RAISE EXCEPTION 'Quantidade não pode ser menor ou igual a zero';
END IF;

IF NEW.Cliente_idCliente IS NULL THEN
RAISE EXCEPTION 'Cliente não pode ser nulo';
END IF;

IF NEW.Produtos_idProdutos IS NULL THEN
RAISE EXCEPTION 'Produto não pode ser nulo';
END IF;
RETURN NEW; 
END;
$compra_produto$ LANGUAGE plpgsql;

CREATE TRIGGER compra_gatilho AFTER INSERT OR UPDATE
ON compras
FOR EACH ROW EXECUTE 
PROCEDURE compra_produto();



-- WIP: COMPRA DE PRODUTO DIMINUI O ESTOQUE
-- WIP: VACINAÇÃO DIMINUI O ESTOQUE
-- WIP: HOSPEDAGEM DIMINUI O NUMERO DE VAGAS