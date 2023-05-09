/* A */

select count(*) from lcliente;

/* B */

select * from llicenca
where month(dtAquisicao) = 12;

/* C */

select * from llicenca
where month(dtAquisicao) = 05 and year(dtAquisicao) = 2007;

/* D */

select idTIPO_Empresa, DescricaoTipo, left(DescricaoTipo, 5) from ltipo_empresa order by DescricaoTipo asc;

/* E */

select idTIPO_Empresa, DescricaoTipo, right(DescricaoTipo, 5) from ltipo_empresa order by DescricaoTipo desc;

/* F */

select substr(DescricaoTipo, 6, 10) as LETRAS from ltipo_empresa;

/* G */

select Nome_RazaoSocial as NOME, LENGTH(Nome_RazaoSocial) as bytes from lcliente order by Nome_RazaoSocial asc;

/* H */

select NumLicenca as LICENCA, DtAquisicao as DATA, datediff(now(), DtAquisicao) as DIAS_ATRAS from llicenca;

/* I */

select upper(NomeSetor) as MAIUSCULO, lower(NomeSetor) as MINUSCULO from lsetor;

#Atividades dos JOINs

/* J */

select NomeSoftware as SOFTWARE, Versao as VERSAO from lsoftware 
join lvversao on lsoftware.idSOFTWARE = lversao.idSOFTWARE_FK order by NomeSoftware, Versao asc;

/* K */

select Nome_RazaoSocial as CLIENTE, DescricaoTipo as TIPO, NomeSetor as SETOR  from lcliente c 
join lsetor s on c.idSETOR_FK = s.idSETOR join ltipo_empresa tm on c.idTIPO_Empresa_FK = tm.idTIPO_Empresa;

/* L */

select idCLiente as IDENTIFICADOR, Nome_RazaoSocial as NOME, NumLicenca as LICENCA, DtAquisicao as DATA, ValorAquisicao as VALOR from lcliente c 
join llicenca l on l.idCLIENTE_FK =  c.idCLIENTE;

/* M */

select Nome_RazaoSocial as CLIENTE, NomeSoftware as SOFTWARE from lcliente c join 
llicenca l on l.idCLIENTE_FK = c.idCLIENTE join lsoftware s on s.idSOFTWARE = l.idSOFTWARE_FK_FK;

/* O */

select Nome_RazaoSocial as CLIENTE, DescricaoTipo as TIPO, NomeSetor as SETOR from lcliente c join 
lsetor s on c.idSETOR_FK = s.idSETOR join ltipo_empresa tm on c.idTIPO_Empresa_FK = tm.idTIPO_Empresa where UF in ("SP", "RS", "PR", "MG");

#Exercicios sobre as Funções estatisticas

/* P */

select count(NumLicenca) as LICENCAS_VENDIDAS from llicenca;

/* Q */

select sum(ValorAquisicao) as SOMA, avg(ValorAquisicao) as MEDIA, max(ValorAquisicao) as MAIOR_VALOR, min(ValorAquisicao) as MENOR_VALOR from llicenca;

/* R */

select count(*) as CLIENTES_FARMACEUTICA from lcliente c where c.idTIPO_Empresa_FK = 4;

/* S */

select c.Nome_RazaoSocial as CLIENTE, count(l.NumLicenca) as N°_LICENCAS from lcliente c 
join llicenca l on c.idCLIENTE = l.idCLIENTE_FK group by c.Nome_RazaoSocial order by c.Nome_RazaoSocial asc;

/* T */

select c.Nome_RazaoSocial as CLIENTE, sum(l.ValorAquisicao) as TOTAL, avg(l.ValorAquisicao) as MEDIA from lcliente c 
join llicenca l on c.idCLIENTE = l.idCLIENTE_FK group by c.Nome_RazaoSocial order by c.Nome_RazaoSocial asc;

/* U */

select NomeSetor as SETOR, sum(ValorAquisicao) as TOTAL from lsetor s join lcliente c on s.idSETOR = c.idSETOR_FK 
join llicenca l on c.idCLIENTE = l.idCLIENTE_FK group by NomeSetor order by NomeSetor asc;

/* V */

select so.NomeSOFTWARE as SOFTWARE, v.Versao as VERSAO, c.Nome_RazaoSocial as CLIENTE, te.DescricaoTipo as TIPO, 
s.NomeSetor as SETOR, l.NumLicenca as LICENCA, l.DtAquisicao as DATA, l.ValorAquisicao as VALOR from lcliente c 
join ltipo_empresa te on c.idTIPO_Empresa_FK = te.idTIPO_Empresa join lsetor s on c.idSETOR_FK = s.idSETOR 
join llicenca l on l.idCLIENTE_FK = c.idCLIENTE join lversao v on v.Versao = l.Versao_FK 
join lsoftware so on v.idSOFTWARE_FK = so.idSOFTWARE;

/* W */

select DescricaoTipo as TIPO_EMPRESA, sum(ValorAquisicao) as TOTAL from ltipo_empresa te 
join lcliente c on c.idTIPO_Empresa_FK = te.idTIPO_Empresa join llicenca l on c.idCLIENTE = l.idCLIENTE_FK group by DescricaoTipo order by DescricaoTipo asc;

/* X */

select NomeSoftware as SOFTWARE, Nome_RazaoSocial as CLIENTE, count(NumLicenca) as TOTAL_LICENCAS from llicenca l 
join lcliente c on c.idCLIENTE = l.idCLIENTE_FK join lsoftware s on l.idSOFTWARE_FK_FK = s.idSOFTWARE group by idCLIENTE_FK, idSOFTWARE;
 
/* Y */

select NomeSoftware as SOFTWARE, Versao as VERSAO, sum(ValorAquisicao) as TOTAL from lsoftware s
 join lversao v on v.idSOFTWARE_FK = s.idSOFTWARE join llicenca l on l.idSOFTWARE_FK_FK = v.idSOFTWARE_FK group by NomeSoftware, Versao order by NomeSoftware, Versao;