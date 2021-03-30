-- PESQUISAR ANIMAIS QUE AINDA ESTÃO EM ADOCAO
CREATE VIEW animais_em_adocao as
SELECT a.idAnimal, a.Cliente_idCliente, a.Pelagem_idPelagem, a.idade,
a.raca, a.peso, a.tamanho, ad.idAdocao, ad.dataAdocao, ad.diaSemanaMonstuario FROM animal as a

RIGHT JOIN adocao as ad on a.idAnimal = ad.IdAdocao WHERE ad.dataAdocao is null;


