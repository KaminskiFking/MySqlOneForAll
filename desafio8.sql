SELECT a.artistas AS artista, b.albuns AS album FROM SpotifyClone.artista AS a INNER JOIN SpotifyClone.album AS b ON b.artistas_id = 3 WHERE a.artistas = "Elis Regina" ORDER BY album;
