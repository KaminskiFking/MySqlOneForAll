SELECT MIN(p.price) AS faturamento_minimo, MAX(p.price) AS faturamento_maximo, ROUND(AVG(p.price), 2) AS faturamento_medio, ROUND(SUM(p.price), 2)  AS faturamento_total FROM SpotifyClone.plano AS p INNER JOIN SpotifyClone.user AS u ON u.planos_id = p.planos_id;