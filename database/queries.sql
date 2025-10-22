-- 1. Consultar todas as seleções
SELECT * FROM selecoes;

-- 2. Seleções com títulos
SELECT * FROM selecoes WHERE titulos > 0;

-- 3. Seleções ordenadas por títulos
SELECT nome, titulos FROM selecoes ORDER BY titulos DESC;

-- 4. Jogadores com suas seleções (JOIN)
SELECT 
    j.nome AS jogador,
    j.posicao,
    j.numero_camisa,
    s.nome AS selecao
FROM jogadores j
INNER JOIN selecoes s ON j.selecao_id = s.id;

-- 5. Total de jogadores por seleção
SELECT 
    s.nome AS selecao,
    COUNT(j.id) AS total_jogadores
FROM selecoes s
LEFT JOIN jogadores j ON s.id = j.selecao_id
GROUP BY s.id, s.nome;
