DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plano(
      planos_id INT PRIMARY KEY AUTO_INCREMENT,
      planos VARCHAR(45)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.user(
      usuario_id INT PRIMARY KEY AUTO_INCREMENT,
      nome_usuario VARCHAR(45),
      planos_id INT NOT NULL,
      FOREIGN KEY (planos_id) REFERENCES plano (planos_id)
  ) engine = InnoDB;

   CREATE TABLE SpotifyClone.artista(
      artistas_id INT PRIMARY KEY AUTO_INCREMENT,
      artistas VARCHAR(45) NOT NULL
  ) engine = InnoDB;

	 CREATE TABLE SpotifyClone.album(
      albuns_id INT PRIMARY KEY AUTO_INCREMENT,
      albuns VARCHAR(45) NOT NULL,
      artistas_id INT NOT NULL,
      FOREIGN KEY (artistas_id) REFERENCES artista (artistas_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.cancoes(
      cancoes_id INT PRIMARY KEY AUTO_INCREMENT,
      cancoes VARCHAR(45) NOT NULL,
      albuns_id INT NOT NULL,
      FOREIGN KEY (albuns_id) REFERENCES album (albuns_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.reproducoes(
      data_de_reproducoes TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
      cancoes_id  INT NOT NULL,
      usuario_id INT NOT NULL,
      FOREIGN KEY (usuario_id) REFERENCES user (usuario_id),
      FOREIGN KEY (cancoes_id) REFERENCES cancoes (cancoes_id),
      PRIMARY KEY (cancoes_id, usuario_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguidores(
      usuario_id INT NOT NULL,
      artistas_id INT NOT NULL,
      FOREIGN KEY (usuario_id) REFERENCES user (usuario_id),
      FOREIGN KEY (artistas_id) REFERENCES artista (artistas_id),
      PRIMARY KEY (artistas_id, usuario_id)
  ) engine = InnoDB;

	INSERT INTO SpotifyClone.plano (planos)
  VALUES
    ('Gratuito'),
    ('universitário'),
    ('pessoal'),
    ('familiar');
    
    
    INSERT INTO SpotifyClone.artista (artistas)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Nina Simone'),
    ('Blind Guardian'),
    ('Baco Exu do Blues');
    
    INSERT INTO SpotifyClone.album (albuns, artistas_id)
  VALUES
    ('Renaissance', 1),
    ('Jazz', 2),
    ('Hot Space', 3),
    ('Falso Brilhante', 4),
    ('Vento de Maio', 5),
    ('Somewhere Far Beyond', 6),
    ('Somewhere', 1),
    ('Far', 1);

    INSERT INTO SpotifyClone.cancoes (cancoes, albuns_id)
  VALUES
    ('Dont Stop Me Now', 1),
    ('Como nossos pais', 1),
    ('Felicidade demais', 1),
    ('Samba em paris', 1),
    ('Feeling good', 1),
    ('Bleach opening 1', 1),
    ('Bleach opening 2', 1),
    ('Bleach opening 13', 1),
    ('Bleach opening 21', 1),
    ('Naruto opening 1', 1);

     INSERT INTO SpotifyClone.user (nome_usuario, planos_id)
  VALUES
    ('Barbara Liskov', 1),
    ('Robert Cecil Martin', 2),
    ('Ada Lovelace', 3),
    ('Martin Fowler', 4),
    ('Sandi Metz', 1),
    ('Paulo Freire', 2),
    ('Bell Hooks', 3),
    ('Christopher Alexander', 4),
    ('Judith Butler', 1),
    ('Jorge Amado', 2);

    INSERT INTO SpotifyClone.reproducoes (cancoes_id, usuario_id)
  VALUES
    (3, 3),
    (4, 3),
    (5, 3),
    (6, 3),
    (7, 3),
    (8, 3),
    (9, 3),
    (10, 3),
    (10, 4),
    (1, 2),
    (3, 5),
    (1, 6),
    (2, 2),
    (10, 2),
    (5, 2),
    (2, 3);

    INSERT INTO SpotifyClone.seguidores (artistas_id, usuario_id)
  VALUES
    (3, 3),
    (5, 3),
    (2, 3),
    (1, 3),
	  (1, 2),
    (3, 2),
	  (2, 2),
    (4, 2),
    (4, 4),
    (5, 2),
    (6, 5),
    (6, 4),
	  (2, 4),
    (6, 3);