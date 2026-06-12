CREATE DATABASE IF NOT EXISTS dados_suicidio_db;
USE dados_suicidio_db;

CREATE TABLE tb_estado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uf CHAR(2) NOT NULL UNIQUE
);


CREATE TABLE tb_estado_civil (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);


CREATE TABLE tb_escolaridade (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nivel VARCHAR(100) NOT NULL
);

CREATE TABLE tb_causa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(10) NOT NULL,
    descricao TEXT
);


CREATE TABLE tb_fato_suicidio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ano INT NOT NULL,
    idade INT,
    sexo ENUM('Masculino','Feminino','Ignorado'),

    estado_id INT,
    estado_civil_id INT,
    escolaridade_id INT,
    causa_id INT,

    FOREIGN KEY (estado_id) REFERENCES tb_estado(id),
    FOREIGN KEY (estado_civil_id) REFERENCES tb_estado_civil(id),
    FOREIGN KEY (escolaridade_id) REFERENCES tb_escolaridade(id),
    FOREIGN KEY (causa_id) REFERENCES tb_causa(id)
);