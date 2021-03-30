CREATE TABLE Fornecedor (
  idFornecedor serial NOT NULL ,
  nomeFornecedor VARCHAR    ,
  cnpj VARCHAR    ,
  telefone VARCHAR      ,
PRIMARY KEY(idFornecedor));




CREATE TABLE Estoque (
  idEstoque serial NOT NULL ,
  quantidade INTEGER    ,
  dataFab DATE    ,
  dataVenc DATE      ,
PRIMARY KEY(idEstoque));


CREATE TABLE Pelagem (
  idPelagem serial NOT NULL ,
  tipoPelagem VARCHAR      ,
PRIMARY KEY(idPelagem));




CREATE TABLE Funcionario (
  idFuncionario serial NOT NULL ,
  nomeFuncionario VARCHAR    ,
  email VARCHAR    ,
  admin BOOL    ,
  senhaFuncionario VARCHAR      ,
PRIMARY KEY(idFuncionario));




CREATE TABLE Cliente (
  idCliente serial NOT NULL ,
  nome VARCHAR    ,
  cpf VARCHAR    ,
  email VARCHAR    ,
  celular VARCHAR      ,
PRIMARY KEY(idCliente));




CREATE TABLE Produtos (
  idProdutos serial NOT NULL ,
  Estoque_idEstoque INTEGER   NOT NULL ,
  codProduto INTEGER    ,
  nomeProduto VARCHAR    ,
  preco VARCHAR      ,
PRIMARY KEY(idProdutos)  ,
  FOREIGN KEY(Estoque_idEstoque)
    REFERENCES Estoque(idEstoque));


CREATE TABLE Vendas (
  idVendas serial NOT NULL ,
  Cliente_idCliente INTEGER   NOT NULL ,
  Produtos_idProdutos INTEGER   NOT NULL ,
  dataVenda DATE    ,
  valorTotal FLOAT      ,
PRIMARY KEY(idVendas)    ,
  FOREIGN KEY(Produtos_idProdutos)
    REFERENCES Produtos(idProdutos),
  FOREIGN KEY(Cliente_idCliente)
    REFERENCES Cliente(idCliente));



CREATE TABLE Produtos_has_Fornecedor (
  Produtos_idProdutos serial  NOT NULL ,
  Fornecedor_idFornecedor INTEGER   NOT NULL   ,
PRIMARY KEY(Produtos_idProdutos, Fornecedor_idFornecedor)    ,
  FOREIGN KEY(Produtos_idProdutos)
    REFERENCES Produtos(idProdutos),
  FOREIGN KEY(Fornecedor_idFornecedor)
    REFERENCES Fornecedor(idFornecedor));




CREATE TABLE Animal (
  idAnimal serial  NOT NULL ,
  Cliente_idCliente INTEGER    ,
  Pelagem_idPelagem INTEGER   NOT NULL ,
  idade INTEGER    ,
  raça VARCHAR    ,
  peso FLOAT    ,
  tamanho FLOAT      ,
PRIMARY KEY(idAnimal)    ,
  FOREIGN KEY(Pelagem_idPelagem)
    REFERENCES Pelagem(idPelagem),
  FOREIGN KEY(Cliente_idCliente)
    REFERENCES Cliente(idCliente));





CREATE TABLE Adestramento (
  idAdestramento serial NOT NULL ,
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




CREATE TABLE Hospedagem (
  idHospedagem serial  NOT NULL ,
  Animal_idAnimal INTEGER   NOT NULL ,
  dataDeEntrega DATE    ,
  dataDeRetirada DATE    ,
  valorHospedagem FLOAT      ,
PRIMARY KEY(idHospedagem)  ,
  FOREIGN KEY(Animal_idAnimal)
    REFERENCES Animal(idAnimal));


CREATE TABLE Adocao (
  idAdocao serial NOT NULL ,
  Animal_idAnimal INTEGER   NOT NULL ,
  dataAdocao DATE    ,
  diaSemanaMonstuario INTEGER      ,
PRIMARY KEY(idAdocao)  ,
  FOREIGN KEY(Animal_idAnimal)
    REFERENCES Animal(idAnimal));



CREATE TABLE Vacina (
  idVacina serial NOT NULL ,
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


CREATE TABLE Banho (
  idBanho serial NOT NULL ,
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






