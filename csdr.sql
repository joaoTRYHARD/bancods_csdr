CREATE DATABASE IF NOT EXISTS csdr CHARACTER SET utf8mb4;
USE csdr;

CREATE TABLE IF NOT EXISTS usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  senha_hash VARCHAR(100) NOT NULL,
  perfil ENUM('usuario','admin') NOT NULL DEFAULT 'usuario',
  criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS consentimentos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  versao_termo VARCHAR(10) NOT NULL,
  aceito_em DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS aplicativos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  espaco DECIMAL(6,2) NOT NULL,
  ram DECIMAL(5,2) NOT NULL,
  cpu INT NOT NULL,
  INDEX (nome)
);

CREATE TABLE IF NOT EXISTS diagnosticos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  aplicativo_id INT NOT NULL,
  compativel BOOLEAN NOT NULL,
  feito_em DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
  FOREIGN KEY (aplicativo_id) REFERENCES aplicativos(id) ON DELETE CASCADE
);

INSERT INTO aplicativos (nome, espaco, ram, cpu) VALUES
  ('Jogo Pesado 3D', 12, 6, 8),
  ('Rede Social Leve', 0.2, 2, 4),
  ('Editor de Vídeo', 3, 4, 6),
  ('App de Mensagens', 0.1, 1, 2);
  
  SHOW COLUMNS FROM aplicativos;
