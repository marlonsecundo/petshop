-- PESQUISAR ANIMAIS QUE AINDA ESTÃO EM ADOCAO
CREATE VIEW animais_em_adocao as
SELECT a.idAnimal, a.Cliente_idCliente, a.Pelagem_idPelagem, a.idade,
a.raca, a.peso, a.tamanho, ad.idAdocao, ad.dataAdocao, ad.diaSemanaMonstuario FROM animal as a

INNER JOIN adocao as ad on a.idAnimal = ad.IdAdocao WHERE ad.dataAdocao is null;


-- PESQUISAR ANIMAIS DOS CLIENTES
CREATE VIEW animais_dos_clientes as
SELECT a.idAnimal, a.Pelagem_idPelagem, a.idade,
a.raca, a.peso, a.tamanho, 
c.idCliente, c.nome, c.cpf, c.email, c.celular
FROM animal as a

INNER JOIN cliente as c on a.Cliente_idCliente = c.IdCliente;


-- PESQUISAR VACINAS DE UM ANIMAL

CREATE VIEW animais_vacinados as
SELECT  a.idAnimal, a.Cliente_idCliente, a.Pelagem_idPelagem, a.idade,
a.raca, a.peso, a.tamanho, v.idAnimalVacina, v.Funcionario_idFuncionario,
v.dataVacina, v.dataVencimento, vac.nomeVacina

FROM animal as a INNER JOIN animal_vacina as v
on a.idAnimal = v.Animal_idAnimal
INNER JOIN vacina as vac on v.Vacina_idVacina = vac.idVacina;

-- COMPRAS DOS CLIENTES COM VALOR TOTAL

CREATE VIEW nota_fiscal_cliente AS
SELECT c.idCliente, c.nome, c.cpf, c.email, c.celular, 
com.idCompras, com.Produtos_idProdutos, com.dataCompras, com.quantidade,
p.Estoque_idEstoque, p.codProduto, p.nomeProduto, p.preco,
SUM (com.quantidade*p.preco) as valorTotal
FROM cliente as c INNER JOIN compras AS com
ON c.idCliente = com.Cliente_idCliente 
INNER JOIN produtos AS p 
ON p.idProdutos = com.Produtos_idProdutos
GROUP BY c.idCliente, com.idCompras, p.idProdutos;



