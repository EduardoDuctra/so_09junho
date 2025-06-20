-- Criação da tabela usuario
CREATE TABLE usuario (
                         cod INTEGER PRIMARY KEY,
                         nome VARCHAR(255),
                         email VARCHAR(255),
                         senha VARCHAR(255),
                         ativo BOOLEAN
);

-- Criação da tabela tarefa
CREATE TABLE tarefa (
                        cod INTEGER PRIMARY KEY,
                        titulo VARCHAR(255),
                        descricao TEXT,
                        data DATE,
                        concluido BOOLEAN,
                        codUsuario INTEGER,
                        FOREIGN KEY (codUsuario) REFERENCES usuario(cod) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Para a tabela usuario
ALTER TABLE usuario
ALTER COLUMN cod
ADD GENERATED ALWAYS AS IDENTITY;

-- Para a tabela tarefa
ALTER TABLE tarefa
ALTER COLUMN cod
ADD GENERATED ALWAYS AS IDENTITY;


INSERT INTO usuario (nome, email, senha, ativo) VALUES
                                                    ('Alice', 'alice@example.com', 'senha123', TRUE),
                                                    ('Bruno', 'bruno@example.com', 'senha123', TRUE),
                                                    ('Carla', 'carla@example.com', 'senha123', FALSE),
                                                    ('Daniel', 'daniel@example.com', 'senha123', TRUE),
                                                    ('Eduarda', 'eduarda@example.com', 'senha123', TRUE);

-- Tarefas de Alice (usuário 1)
INSERT INTO tarefa (titulo, descricao, data, concluido, codUsuario) VALUES
                                                                        ('Tarefa A1', 'Descrição A1', '2025-05-01', FALSE, 1),
                                                                        ('Tarefa A2', 'Descrição A2', '2025-05-02', TRUE, 1),
                                                                        ('Tarefa A3', 'Descrição A3', '2025-05-03', FALSE, 1),
                                                                        ('Tarefa A4', 'Descrição A4', '2025-05-04', FALSE, 1),
                                                                        ('Tarefa A5', 'Descrição A5', '2025-05-05', TRUE, 1);

-- Tarefas de Bruno (usuário 2)
INSERT INTO tarefa (titulo, descricao, data, concluido, codUsuario) VALUES
                                                                        ('Tarefa B1', 'Descrição B1', '2025-05-01', TRUE, 2),
                                                                        ('Tarefa B2', 'Descrição B2', '2025-05-02', FALSE, 2);

-- Tarefas de Carla (usuário 3)
INSERT INTO tarefa (titulo, descricao, data, concluido, codUsuario) VALUES
                                                                        ('Tarefa C1', 'Descrição C1', '2025-05-01', FALSE, 3),
                                                                        ('Tarefa C2', 'Descrição C2', '2025-05-03', TRUE, 3),
                                                                        ('Tarefa C3', 'Descrição C3', '2025-05-04', FALSE, 3);

-- Tarefas de Daniel (usuário 4)
INSERT INTO tarefa (titulo, descricao, data, concluido, codUsuario) VALUES
                                                                        ('Tarefa D1', 'Descrição D1', '2025-05-01', TRUE, 4),
                                                                        ('Tarefa D2', 'Descrição D2', '2025-05-02', FALSE, 4),
                                                                        ('Tarefa D3', 'Descrição D3', '2025-05-03', TRUE, 4),
                                                                        ('Tarefa D4', 'Descrição D4', '2025-05-04', FALSE, 4),
                                                                        ('Tarefa D5', 'Descrição D5', '2025-05-05', TRUE, 4),
                                                                        ('Tarefa D6', 'Descrição D6', '2025-05-06', TRUE, 4),
                                                                        ('Tarefa D7', 'Descrição D7', '2025-05-07', FALSE, 4);

-- Tarefas de Eduarda (usuário 5)
INSERT INTO tarefa (titulo, descricao, data, concluido, codUsuario) VALUES
                                                                        ('Tarefa E1', 'Descrição E1', '2025-05-01', FALSE, 5),
                                                                        ('Tarefa E2', 'Descrição E2', '2025-05-02', TRUE, 5),
                                                                        ('Tarefa E3', 'Descrição E3', '2025-05-03', FALSE, 5),
                                                                        ('Tarefa E4', 'Descrição E4', '2025-05-04', TRUE, 5);


select * from usuario
select * from tarefa

CREATE TABLE categoria (
                           cod SERIAL PRIMARY KEY,
                           nome VARCHAR(100) NOT NULL
);

ALTER TABLE tarefa
    ADD COLUMN codCategoria INTEGER,
ADD FOREIGN KEY (codCategoria) REFERENCES categoria(cod) ON DELETE SET NULL ON UPDATE CASCADE;

INSERT INTO categoria (nome) VALUES
                                 ('Trabalho'),
                                 ('Pessoal'),
                                 ('Estudo');

UPDATE tarefa SET codCategoria = 1 WHERE cod = 1;  -- Tarefa A1 -> categoria "Trabalho"
UPDATE tarefa SET codCategoria = 2 WHERE cod = 2;  -- Tarefa A2 -> categoria "Pessoal"
UPDATE tarefa SET codCategoria = 3 WHERE cod = 3;  -- Tarefa A3 -> categoria "Estudo"
UPDATE tarefa SET codCategoria = 1 WHERE cod = 4;  -- Tarefa A4 -> categoria "Trabalho"
UPDATE tarefa SET codCategoria = 2 WHERE cod = 5;  -- Tarefa A5 -> categoria "Pessoal"

-- Atualizando tarefas de Bruno (usuário 2)
UPDATE tarefa SET codCategoria = 1 WHERE cod = 6;  -- Tarefa B1 -> categoria "Trabalho"
UPDATE tarefa SET codCategoria = 2 WHERE cod = 7;  -- Tarefa B2 -> categoria "Pessoal"

-- Atualizando tarefas de Carla (usuário 3)
UPDATE tarefa SET codCategoria = 1 WHERE cod = 8;  -- Tarefa C1 -> categoria "Trabalho"
UPDATE tarefa SET codCategoria = 2 WHERE cod = 9;  -- Tarefa C2 -> categoria "Pessoal"
UPDATE tarefa SET codCategoria = 3 WHERE cod = 10; -- Tarefa C3 -> categoria "Estudo"

-- Atualizando tarefas de Daniel (usuário 4)
UPDATE tarefa SET codCategoria = 1 WHERE cod = 11; -- Tarefa D1 -> categoria "Trabalho"
UPDATE tarefa SET codCategoria = 2 WHERE cod = 12; -- Tarefa D2 -> categoria "Pessoal"
UPDATE tarefa SET codCategoria = 3 WHERE cod = 13; -- Tarefa D3 -> categoria "Estudo"
UPDATE tarefa SET codCategoria = 1 WHERE cod = 14; -- Tarefa D4 -> categoria "Trabalho"
UPDATE tarefa SET codCategoria = 2 WHERE cod = 15; -- Tarefa D5 -> categoria "Pessoal"
UPDATE tarefa SET codCategoria = 3 WHERE cod = 16; -- Tarefa D6 -> categoria "Estudo"
UPDATE tarefa SET codCategoria = 1 WHERE cod = 17; -- Tarefa D7 -> categoria "Trabalho"

-- Atualizando tarefas de Eduarda (usuário 5)
UPDATE tarefa SET codCategoria = 1 WHERE cod = 18; -- Tarefa E1 -> categoria "Trabalho"
UPDATE tarefa SET codCategoria = 2 WHERE cod = 19; -- Tarefa E2 -> categoria "Pessoal"
UPDATE tarefa SET codCategoria = 3 WHERE cod = 20; -- Tarefa E3 -> categoria "Estudo"
UPDATE tarefa SET codCategoria = 1 WHERE cod = 21; -- Tarefa E4 -> categoria "Trabalho"


ALTER TABLE tarefa
DROP COLUMN data;

ALTER TABLE categoria RENAME COLUMN cod TO id;

select * from tarefa
select * from usuario
select * from categoria