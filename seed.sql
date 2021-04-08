-- CLIENTE

INSERT INTO Cliente ( nome, cpf, email, celular) 
VALUES( 'Naruto', '656456', 'naruto@hotmail.com', '846584484');

-- PELAGEM

INSERT INTO Pelagem ( tipoPelagem) VALUES( 'Longa');

-- ANIMAL

INSERT INTO Animal (Cliente_idCliente, Pelagem_idPelagem, idade, raca, peso, tamanho) 
VALUES(1, 1, 10, 'piecher', 10.0 , 10.0);

INSERT INTO Animal (Pelagem_idPelagem, idade, raca, peso, tamanho)  VALUES(1, 10, 'gato', 10.0 , 10.0);

-- ADOCAO

INSERT INTO Adocao ( Animal_idAnimal, dataAdocao, diaSemanaMonstuario) 
VALUES(1, '2021-04-15', 5);

INSERT INTO Adocao ( Animal_idAnimal, dataAdocao, diaSemanaMonstuario) 
VALUES(2, null, 5);

-- FUNCIONARIO

INSERT INTO Funcionario ( nomeFuncionario, email, admin, senhaFuncionario) 
VALUES('Ekko', 'Ekko@gmail.com',TRUE, 'ekko123');

-- VACINA

INSERT INTO Vacina (nomeVacina, quantidade) VALUES('antirrabica', 10);

INSERT INTO Vacina (nomeVacina, quantidade) VALUES('giardia', 20);

-- ANIMAL VACINA

INSERT INTO Animal_Vacina (Animal_idAnimal, Vacina_idVacina, Funcionario_idFuncionario, dataVacina, dataVencimento) 
VALUES(1,1,1,'2021-04-15','2022-04-15');

INSERT INTO Animal_Vacina (Animal_idAnimal, Vacina_idVacina, Funcionario_idFuncionario, dataVacina, dataVencimento) 
VALUES(1,2,1,'2021-04-16','2022-04-16');


-- ESTOQUE

INSERT INTO Estoque (quantidade, dataFab, dataVenc) VALUES(30, '2021-04-15','2022-04-15');

INSERT INTO Estoque (quantidade, dataFab, dataVenc) VALUES(10, '2021-04-15','2022-04-15');

-- PRODUTO

INSERT INTO Produtos ( Estoque_idEstoque, codProduto, nomeProduto, preco) 
VALUES(1,15146,'erva', 1.0);

INSERT INTO Produtos ( Estoque_idEstoque, codProduto, nomeProduto, preco) 
VALUES(2,15156,'ração', 3.0);

-- COMPRA

INSERT INTO Compras (Cliente_idCliente, Produtos_idProdutos, dataCompras, quantidade) 
VALUES(1,1,'2021-04-15',3);
INSERT INTO Compras (Cliente_idCliente, Produtos_idProdutos, dataCompras, quantidade) 
VALUES(1,2,'2021-04-15',5);



