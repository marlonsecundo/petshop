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

CREATE FUNCTION animal_vacina() RETURNS trigger AS $animal_vacina$
BEGIN

IF NEW.Animal_idAnimal IS NULL THEN
RAISE EXCEPTION 'Animal não pode ser nulo';
END IF;

IF NEW.Funcionario_idFuncionario IS NULL THEN
RAISE EXCEPTION 'Funcionario não pode ser nulo';
END IF;

IF NEW.dataVacina IS NULL THEN
RAISE EXCEPTION 'dataVacina não pode ser nulo';
END IF;

IF NEW.dataVencimento IS NULL THEN
RAISE EXCEPTION 'dataVencimento não pode ser nulo';
END IF;

IF NEW.Vacina_idVacina IS NULL THEN
RAISE EXCEPTION 'idVacina não pode ser nulo';
END IF;

IF (SELECT quantidade FROM vacina WHERE idVacina = NEW.Vacina_idVacina) <= 0 THEN
RAISE EXCEPTION 'Estoque desse tipo de vacina esgotou';
END IF;

UPDATE vacina SET quantidade = quantidade - 1 WHERE idVacina = NEW.Vacina_idVacina;

RETURN NEW;
END;
$animal_vacina$ LANGUAGE plpgsql;

CREATE TRIGGER vacina_gatilho AFTER INSERT OR UPDATE
ON animal_vacina
FOR EACH ROW EXECUTE 
PROCEDURE animal_vacina();


-- ADOÇÃO ANIMAL

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

IF (SELECT quantidade FROM estoque WHERE idEstoque = 
   (SELECT Estoque_idEstoque FROM produtos WHERE idProdutos = New.Produtos_idProdutos)) < NEW.quantidade THEN
    RAISE EXCEPTION 'Estoque menor que quantidade comprada!';
END IF;

UPDATE estoque SET quantidade = quantidade - NEW.quantidade WHERE idEstoque = (SELECT Estoque_idEstoque FROM produtos WHERE idProdutos = New.Produtos_idProdutos);

RETURN NEW; 
END;
$compra_produto$ LANGUAGE plpgsql;

CREATE TRIGGER compra_gatilho AFTER INSERT OR UPDATE
ON compras
FOR EACH ROW EXECUTE 
PROCEDURE compra_produto();


-- ADESTRAMENTO

CREATE FUNCTION adestramento() RETURNS trigger AS $adestramento$
BEGIN
IF NEW.Animal_idAnimal IS NULL THEN
RAISE EXCEPTION 'Animal não pode ser nulo';
END IF;

IF NEW.Funcionario_idFuncionario IS NULL THEN
RAISE EXCEPTION 'Funcionario não pode ser nulo';
END IF;

IF NEW.DataAdestramento IS NULL THEN
RAISE EXCEPTION 'DataAdestramento não pode ser nulo';
END IF;

IF NEW.ValorAdestramento IS NULL OR NEW.ValorAdestramento < 0 THEN
RAISE EXCEPTION 'ValorAdestramento não pode menor que zero';
END IF;

IF LENGTH(NEW.TipoAdestramento)<3 OR NEW.TipoAdestramento IS NULL THEN
RAISE EXCEPTION 'TipoAdestramento deve ter mais de 3 caracteres';
END IF;

RETURN NEW;
END;
$adestramento$ LANGUAGE plpgsql;


CREATE TRIGGER adestramento_gatilho AFTER INSERT OR UPDATE
ON adestramento
FOR EACH ROW EXECUTE 
PROCEDURE adestramento();


