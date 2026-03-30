-- inserts

INSERT INTO tbl_modalidade (id_modalidade, modalidade) VALUES
(1, 'Futebol'),
(2, 'Voleibol'),
(3, 'Basquete'),
(4, 'Handebol');

INSERT INTO tbl_times (nome, tbl_modalidade_id_modalidade) VALUES
('1A Futebol', 1),
('2B Futebol', 1),
('1A Volei', 2),
('2C Basquete', 3),
('3A Handebol', 4);

INSERT INTO tbl_jogadores (nome) VALUES
('João Silva'),
('Pedro Santos'),
('Lucas Oliveira'),
('Marcos Souza'),
('Ana Costa'),
('Beatriz Lima'),
('Carlos Pereira');

INSERT INTO tbl_jogadores_has_tbl_times (tbl_jogadores_id_jogadores, tbl_times_idl_times) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 2),
(1, 2), -- jogador em mais de um time
(3, 1);

INSERT INTO boletim (frequencia, mencao, ocorrencia, tbl_jogadores_id_jogadores) VALUES
(95, 9, 'Excelente desempenho', 1),
(88, 8, 'Muito bom', 2),
(75, 7, 'Regular', 3),
(60, 6, 'Precisa melhorar', 4),
(98, 10, 'Destaque geral', 5),
(85, 8, 'Bom rendimento', 6),
(70, 7, 'Participativo', 7);

-- select comfirmação

SELECT 
    j.nome AS jogador,
    t.nome AS time,
    m.modalidade,
    b.frequencia,
    b.mencao
FROM tbl_jogadores j
JOIN tbl_jogadores_has_tbl_times jt 
    ON j.id_jogadores = jt.tbl_jogadores_id_jogadores
JOIN tbl_times t 
    ON t.idl_times = jt.tbl_times_idl_times
JOIN tbl_modalidade m 
    ON m.id_modalidade = t.tbl_modalidade_id_modalidade
LEFT JOIN boletim b 
    ON b.tbl_jogadores_id_jogadores = j.id_jogadores;