SELECT u.nome_usuario AS usuario, IF(YEAR(MAX(r.data_de_reproducoes)) >= 2021, 'Usuário ativo', 'Usuário inativo') 
AS status_usuario FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.reproducoes AS r ON u.usuario_id = r.usuario_id
GROUP BY nome_usuario ORDER BY nome_usuario ASC;