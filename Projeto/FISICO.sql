

CREATE TABLE cidade (
nome varchar(50),
cod_cidade varchar(30) PRIMARY KEY,
cod_estado varchar(30)
);

CREATE TABLE estado (
sigla_uf varchar(10),
nome varchar(50),
cod_estado varchar(30) PRIMARY KEY
);

CREATE TABLE juridico (
razao_social varchar(50),
cnpj varchar(80) PRIMARY KEY,
cod_usuario varchar(50)
);

CREATE TABLE usuario (
senha varchar(20),
email varchar(50),
nome varchar(80),
cod_usuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT
);

CREATE TABLE fisico (
descricao varchar(250),
especificacao varchar(250),
cpf varchar(50) PRIMARY KEY NOT NULL,
cod_usuario INT,
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

CREATE TABLE estabelecimento (
cod_estabelecimento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cep varchar(50),
bairro varchar(25),
rua varchar(80),
nome varchar(80),
complemento varchar(20),
posicao_geografica float,
cnpj varchar(80),
cod_cidade varchar(30),
FOREIGN KEY(cnpj) REFERENCES juridico (cnpj),
FOREIGN KEY(cod_cidade) REFERENCES cidade (cod_cidade)
);

CREATE TABLE avaliacao (
data_hora timestamp,
cod_avaliacao varchar(30) ,
cpf varchar(50),
nota int,
cod_estabelecimento INT,
FOREIGN KEY(cod_estabelecimento) REFERENCES estabelecimento (cod_estabelecimento),
FOREIGN KEY(cpf) REFERENCES fisico (cpf)
);

CREATE TABLE comentario (
id varchar(30),
cpf varchar(50),
comentario varchar(250),
data_hora timestamp,
cod_estabelecimento INT,
ativo boolean,
FOREIGN KEY(cod_estabelecimento) REFERENCES estabelecimento (cod_estabelecimento),
FOREIGN KEY(cpf) REFERENCES fisico (cpf)
);

ALTER TABLE cidade ADD FOREIGN KEY(cod_estado) REFERENCES estado (cod_estado);
