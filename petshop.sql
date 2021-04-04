CREATE TABLE Fornecedor (
  idFornecedor SERIAL NOT NULL ,
  nomeFornecedor VARCHAR    ,
  cnpj VARCHAR    ,
  telefone VARCHAR      ,
PRIMARY KEY(idFornecedor));




CREATE TABLE Estoque (
  idEstoque SERIAL NOT NULL ,
  quantidade INTEGER    ,
  dataFab DATE    ,
  dataVenc DATE      ,
PRIMARY KEY(idEstoque));




CREATE TABLE Pelagem (
  idPelagem SERIAL NOT NULL ,
  tipoPelagem VARCHAR      ,
PRIMARY KEY(idPelagem));




CREATE TABLE Funcionario (
  idFuncionario SERIAL NOT NULL ,
  nomeFuncionario VARCHAR    ,
  email VARCHAR    ,
  admin BOOL    ,
  senhaFuncionario VARCHAR      ,
PRIMARY KEY(idFuncionario));




CREATE TABLE Cliente (
  idCliente SERIAL NOT NULL ,
  nome VARCHAR    ,
  cpf VARCHAR    ,
  email VARCHAR    ,
  celular VARCHAR      ,
PRIMARY KEY(idCliente));




CREATE TABLE Produtos (
  idProdutos SERIAL NOT NULL ,
  Estoque_idEstoque INTEGER   NOT NULL ,
  codProduto INTEGER    ,
  nomeProduto VARCHAR    ,
  preco FLOAT      ,
PRIMARY KEY(idProdutos)  ,
  FOREIGN KEY(Estoque_idEstoque)
    REFERENCES Estoque(idEstoque));


CREATE TABLE Compras (
  idCompras SERIAL NOT NULL ,
  Cliente_idCliente INTEGER   NOT NULL ,
  Produtos_idProdutos INTEGER   NOT NULL ,
  dataCompras DATE    ,
  quantidade INTEGER      ,
PRIMARY KEY(idCompras)    ,
  FOREIGN KEY(Produtos_idProdutos)
    REFERENCES Produtos(idProdutos),
  FOREIGN KEY(Cliente_idCliente)
    REFERENCES Cliente(idCliente));


CREATE TABLE Produtos_has_Fornecedor (
  Produtos_idProdutos SERIAL NOT NULL ,
  Fornecedor_idFornecedor INTEGER   NOT NULL   ,
PRIMARY KEY(Produtos_idProdutos, Fornecedor_idFornecedor)    ,
  FOREIGN KEY(Produtos_idProdutos)
    REFERENCES Produtos(idProdutos),
  FOREIGN KEY(Fornecedor_idFornecedor)
    REFERENCES Fornecedor(idFornecedor));



CREATE TABLE Animal (
  idAnimal SERIAL NOT NULL ,
  Cliente_idCliente INTEGER    ,
  Pelagem_idPelagem INTEGER   NOT NULL ,
  idade INTEGER    ,
  raca VARCHAR    ,
  peso FLOAT    ,
  tamanho FLOAT      ,
PRIMARY KEY(idAnimal)    ,
  FOREIGN KEY(Pelagem_idPelagem)
    REFERENCES Pelagem(idPelagem),
  FOREIGN KEY(Cliente_idCliente)
    REFERENCES Cliente(idCliente));



CREATE TABLE Banho (
  idBanho SERIAL NOT NULL ,
  Funcionario_idFuncionario INTEGER   NOT NULL ,
  Animal_idAnimal INTEGER   NOT NULL ,
  dataBanho DATE    ,
  valorBanho FLOAT    ,
  tosa BOOL    ,
  unha BOOL      ,
PRIMARY KEY(idBanho)    ,
  FOREIGN KEY(Animal_idAnimal)
    REFERENCES Animal(idAnimal),
  FOREIGN KEY(Funcionario_idFuncionario)
    REFERENCES Funcionario(idFuncionario));


CREATE TABLE Adestramento (
  idAdestramento SERIAL  NOT NULL ,
  Animal_idAnimal INTEGER   NOT NULL ,
  Funcionario_idFuncionario INTEGER   NOT NULL ,
  dataAdestramento DATE    ,
  valorAdestramento FLOAT    ,
  tipoAdestramento VARCHAR      ,
PRIMARY KEY(idAdestramento)    ,
  FOREIGN KEY(Funcionario_idFuncionario)
    REFERENCES Funcionario(idFuncionario),
  FOREIGN KEY(Animal_idAnimal)
    REFERENCES Animal(idAnimal));


CREATE TABLE Adocao (
  idAdocao SERIAL NOT NULL ,
  Animal_idAnimal INTEGER   NOT NULL ,
  dataAdocao DATE    ,
  diaSemanaMonstuario INTEGER      ,
PRIMARY KEY(idAdocao)  ,
  FOREIGN KEY(Animal_idAnimal)
    REFERENCES Animal(idAnimal));


CREATE TABLE Hospedagem (
  idHospedagem SERIAL  NOT NULL ,
  Animal_idAnimal INTEGER   NOT NULL ,
  dataDeEntrega DATE    ,
  dataDeRetirada DATE    ,
  valorHospedagem FLOAT      ,
PRIMARY KEY(idHospedagem)  ,
  FOREIGN KEY(Animal_idAnimal)
    REFERENCES Animal(idAnimal));



CREATE TABLE Vacina (
  idVacina SERIAL NOT NULL ,
  Animal_idAnimal INTEGER   NOT NULL ,
  Funcionario_idFuncionario INTEGER   NOT NULL ,
  nomeVacina VARCHAR    ,
  dataVacina DATE    ,
  dataVencimento DATE      ,
PRIMARY KEY(idVacina)    ,
  FOREIGN KEY(Funcionario_idFuncionario)
    REFERENCES Funcionario(idFuncionario),
  FOREIGN KEY(Animal_idAnimal)
    REFERENCES Animal(idAnimal));


