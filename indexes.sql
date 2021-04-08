CREATE INDEX Produtos_FKIndex1 ON Produtos (Estoque_idEstoque);

CREATE INDEX IFK_Rel_03 ON Produtos (Estoque_idEstoque);

CREATE INDEX Compra_Produto_FKIndex2 ON Compras (Produtos_idProdutos);
CREATE INDEX Compra_Cliente_FKIndex2 ON Compras (Cliente_idCliente);

CREATE INDEX IFK_Rel_08 ON Compras (Produtos_idProdutos);
CREATE INDEX IFK_Rel_18 ON Compras (Cliente_idCliente);

CREATE INDEX Produtos_has_Fornecedor_FKIndex1 ON Produtos_has_Fornecedor (Produtos_idProdutos);
CREATE INDEX Produtos_has_Fornecedor_FKIndex2 ON Produtos_has_Fornecedor (Fornecedor_idFornecedor);

CREATE INDEX IFK_Rel_06 ON Produtos_has_Fornecedor (Produtos_idProdutos);
CREATE INDEX IFK_Rel_07 ON Produtos_has_Fornecedor (Fornecedor_idFornecedor);

CREATE INDEX Animal_FKIndex1 ON Animal (Pelagem_idPelagem);
CREATE INDEX Animal_FKIndex2 ON Animal (Cliente_idCliente);

CREATE INDEX IFK_Rel_01 ON Animal (Pelagem_idPelagem);
CREATE INDEX IFK_Rel_02 ON Animal (Cliente_idCliente);

CREATE INDEX Banho_FKIndex1 ON Banho (Animal_idAnimal);
CREATE INDEX Banho_FKIndex2 ON Banho (Funcionario_idFuncionario);


CREATE INDEX IFK_Rel_10 ON Banho (Animal_idAnimal);
CREATE INDEX IFK_Rel_11 ON Banho (Funcionario_idFuncionario);
	
CREATE INDEX Vacina_FKIndex1 ON Animal_Vacina (Funcionario_idFuncionario);
CREATE INDEX Vacina_FKIndex2 ON Animal_Vacina (Animal_idAnimal);
CREATE INDEX Animal_Vacina_FKIndex3 ON Animal_Vacina (Vacina_idVacina);


CREATE INDEX IFK_Rel_12 ON Animal_Vacina (Funcionario_idFuncionario);
CREATE INDEX IFK_Rel_19 ON Animal_Vacina (Animal_idAnimal);
CREATE INDEX IFK_Rel_16 ON Animal_Vacina (Vacina_idVacina);

CREATE INDEX Hospedagem_FKIndex1 ON Hospedagem (Animal_idAnimal);

CREATE INDEX IFK_Rel_21 ON Hospedagem (Animal_idAnimal);

CREATE INDEX Adocao_FKIndex1 ON Adocao (Animal_idAnimal);

CREATE INDEX IFK_Rel_17 ON Adocao (Animal_idAnimal);

CREATE INDEX Adestramento_Funcionario_FKIndex2 ON Adestramento (Funcionario_idFuncionario);
CREATE INDEX Adestramento_Animal_FKIndex2 ON Adestramento (Animal_idAnimal);

CREATE INDEX IFK_Rel_15 ON Adestramento (Funcionario_idFuncionario);
CREATE INDEX IFK_Rel_20 ON Adestramento (Animal_idAnimal);
