-- Criação do Banco de Dados
CREATE DATABASE mercadinho_mp;

-- Usar o banco
USE mercadinho_mp;

-- ===============================
-- Tabela de Produtos
-- ===============================
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    imagem VARCHAR(255)
);

-- ===============================
-- Tabela de Clientes
-- ===============================
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

-- ===============================
-- Tabela de Reservas
-- ===============================
CREATE TABLE reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_reserva DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Pendente',
    
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- ===============================
-- Tabela de Itens da Reserva
-- ===============================
CREATE TABLE itens_reserva (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT,
    id_produto INT,
    quantidade INT NOT NULL,

    FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- ===============================
-- Inserindo alguns produtos
-- ===============================
INSERT INTO produtos (nome, descricao, preco, estoque) VALUES
('Arroz 5kg','Arroz branco tipo 1',25.90,50),
('Feijão 1kg','Feijão carioca',8.50,80),
('Macarrão','Macarrão espaguete',4.50,100),
('Açúcar 1kg','Açúcar refinado',5.20,60),
('Óleo de soja','Óleo 900ml',7.90,40);