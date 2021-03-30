-- PELAGEM

INSERT INTO Pelagem ( tipoPelagem) VALUES( 'Longa');

-- ANIMAL

INSERT INTO Animal (Pelagem_idPelagem, idade, raca, peso, tamanho) 
VALUES(1, 10, 'piecher', 10.0 , 10.0);

-- ADOCAO

INSERT INTO Adocao ( Animal_idAnimal, dataAdocao, diaSemanaMonstuario) 
VALUES(3, '2021-04-15', 5);