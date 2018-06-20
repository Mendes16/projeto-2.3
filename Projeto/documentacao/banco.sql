-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE estado (
sigla_uf varchar(10),
nome varchar(50),
cod_estado varchar(30) PRIMARY KEY NOT NULL AUTO_INCREMENT
);

CREATE TABLE cidade (
nome varchar(50),
cod_cidade varchar(30) PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_estado varchar(30),
FOREIGN KEY(cod_estado) REFERENCES estado (cod_estado)
);

CREATE TABLE juridico (
razao_social varchar(50),
cnpj varchar(80),
cod_juridico number(12) PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_usuario number(12)
);

CREATE TABLE fisico (
descricao varchar(250),
especificacao varchar(250),
cpf varchar(50),
cod_fisico number(12) PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_usuario number(12)
);

CREATE TABLE estabelecimento (
cep varchar(50),
bairro varchar(25),
rua varchar(80),
nome varchar(80),
complemento varchar(20),
posicao_geografica float,
id varchar(30) PRIMARY KEY NOT NULL AUTO_INCREMENT,
cod_juridico number(12),
cod_cidade varchar(30),
FOREIGN KEY(cod_juridico) REFERENCES juridico (cod_juridico),
FOREIGN KEY(cod_cidade) REFERENCES cidade (cod_cidade)
);

CREATE TABLE usuario (
senha varchar(20),
email varchar(50),
nome varchar(80),
cod_usuario number(12) PRIMARY KEY
);

CREATE TABLE avaliacao (
id varchar(30),
cod_fisico number(12),
nota int,
data_hrnota timestamp,
FOREIGN KEY(id) REFERENCES estabelecimento (id),
FOREIGN KEY(cod_fisico) REFERENCES fisico (cod_fisico)
);

CREATE TABLE comentario (
id varchar(30),
cod_fisico Texto(1),
comentario varchar(250),
data_hora timestamp,
ativo boolean,
FOREIGN KEY(id) REFERENCES estabelecimento (id),
FOREIGN KEY(cod_fisico) REFERENCES fisico (cod_fisico)
);

ALTER TABLE juridico ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE fisico ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
