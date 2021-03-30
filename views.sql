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