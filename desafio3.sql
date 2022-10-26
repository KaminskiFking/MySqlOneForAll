SELECT u.nome_usuario AS usuario, COUNT(r.cancoes_id) AS qt_de_musicas_ouvidas, ROUND(SUM(c.duração_segundos)/60,2) AS total_minutos FROM SpotifyClone.user AS u INNER JOIN SpotifyClone.reproducoes AS r ON u.usuario_id = r.usuario_id INNER JOIN SpotifyClone.cancoes AS c ON c.cancoes_id = r.cancoes_id
GROUP BY
  u.nome_usuario
ORDER BY
  u.nome_usuario;