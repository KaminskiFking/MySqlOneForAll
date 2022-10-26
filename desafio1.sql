DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plano(
      planos_id INT PRIMARY KEY AUTO_INCREMENT,
      planos VARCHAR(45),
      price DECIMAL(5 , 2 )
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
      duração_segundos INT NOT NULL,
      cancoes VARCHAR(45) NOT NULL,
      albuns_id INT NOT NULL,
      FOREIGN KEY (albuns_id) REFERENCES album (albuns_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.reproducoes(
      cancoes_id  INT NOT NULL,
      usuario_id INT NOT NULL,
      data_de_reproducoes DATETIME,
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

	INSERT INTO SpotifyClone.plano (planos, price)
  VALUES
    ('Gratuito', 0),
    ('universitário', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);
    
    
    INSERT INTO SpotifyClone.artista (artistas)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Nina Simone'),
    ('Blind Guardian'),
    ('Baco Exu do Blues');
    
    INSERT INTO SpotifyClone.album (albuns_id, albuns, artistas_id)
  VALUES
    (1, 'Renaissance', 1),
    (2, 'Jazz', 2),
    (3, 'Hot Space', 2),
    (4, 'Falso Brilhante', 3),
    (5, 'Vento de Maio', 3),
    (6,  'QVVJFA?', 4),
    (7, 'Somewhere Far Beyond', 5),
    (8, 'I Put A Spell On You', 6);

    INSERT INTO SpotifyClone.cancoes (cancoes, albuns_id, duração_segundos)
  VALUES
    ('BREAK MY SOUL', 1, 279),
    ("VIRGO'S GRAVES", 1, 369),
    ('ALIEN SUPERSTAR', 1, 116),
    ("Don’t Stop Me Now", 2, 203),
    ("Under Pressure", 3, 152),
    ("Como Nossos Pais", 4, 105),
    ("O Medo de Amar é o Medo de Ser Livre", 5, 207),
    ("Samba em Paris", 6, 267),
    ("The Bard’s Song", 7, 244),
    ("Feeling Good", 8, 100);

     INSERT INTO SpotifyClone.user (nome_usuario, planos_id)
  VALUES
	('Barbara Liskov', 1),
    ('Robert Cecil Martin', 1),
    ('Ada Lovelace', 4),
    ('Martin Fowler', 4),
    ('Sandi Metz', 4),
    ('Paulo Freire', 2),
    ('Bell Hooks', 2),
    ('Christopher Alexander', 3),
    ('Judith Butler', 3),
    ('Jorge Amado', 3);

    INSERT INTO SpotifyClone.reproducoes (usuario_id ,cancoes_id, data_de_reproducoes)
  VALUES
	(1,8,'2022-02-28 10:45:55'),
    (1,2,'2020-05-02 05:30:35'),
    (1,10,'2020-03-06 11:22:33'),
    (2,10,'2022-08-05 08:05:17'),
    (2,7,'2020-01-02 07:40:33'),
    (3,10,'2020-11-13 16:55:13'),
    (3,2,'2020-12-05 18:38:30'),
    (4,8,'2021-08-15 17:10:10'),
    (5,8,'2022-01-09 01:44:33'),
    (5,5,'2020-08-06 15:23:43'),
    (6,7,'2017-01-24 00:31:17'),
    (6,1,'2017-10-12 12:35:20'),
    (7,4,'2011-12-15 22:30:49'),
    (8,4,'2012-03-17 14:56:41'),
    (9,9,'2022-02-24 21:14:22'),
    (10,3,'2015-12-13 08:30:22');

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