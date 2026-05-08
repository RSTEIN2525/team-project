
-- (Before-ReRun) Wipe existing rows from the following tables and deps + reset counters to 1
TRUNCATE TABLE Collection, Tracks, Albums, Artists, Genres RESTART IDENTITY CASCADE;

-- Temporary "Staging" table; matches the csv format identically for programatic copy to our schema
DROP TABLE IF EXISTS staging;
CREATE TEMP TABLE staging (
    track_id                  TEXT,
    track_name                TEXT,
    track_artist              TEXT,
    track_popularity          INTEGER,
    track_album_id            TEXT,
    track_album_name          TEXT,
    track_album_release_date  TEXT,
    playlist_name             TEXT,
    playlist_id               TEXT,
    playlist_genre            TEXT,
    playlist_subgenre         TEXT,
    danceability              REAL,
    energy                    REAL,
    key                       INTEGER,
    loudness                  REAL,
    mode                      INTEGER,
    speechiness               REAL,
    acousticness              REAL,
    instrumentalness          REAL,
    liveness                  REAL,
    valence                   REAL,
    tempo                     REAL,
    duration_ms               INTEGER
);

-- Bulk Load (Read all 500 rows and pop into table)
COPY staging FROM '/Users/siyua/INST123/team-project/data/spotify_top_500.csv' WITH (FORMAT csv, HEADER true);


-- Genres: one row per distinct playlist_genre. SERIAL assigns IDs.
INSERT INTO Genres (name)
SELECT DISTINCT playlist_genre
FROM staging
ORDER BY playlist_genre;

-- Descriptions for each genre.
UPDATE Genres SET description = 'High-energy electronic dance music driven by synths, programmed beats, and drops built for clubs and festivals.' WHERE name = 'edm';
UPDATE Genres SET description = 'Spanish-language music spanning reggaeton, Latin pop, and tropical rhythms with strong dance-oriented grooves.' WHERE name = 'latin';
UPDATE Genres SET description = 'Mainstream popular music defined by catchy hooks, polished production, and broad commercial appeal.' WHERE name = 'pop';
UPDATE Genres SET description = 'Rhythm and blues — vocal-forward, soulful music built around smooth grooves and melodic phrasing.' WHERE name = 'r&b';
UPDATE Genres SET description = 'Hip-hop characterized by rhythmic, spoken-word vocals layered over heavy beats and sampled or programmed instrumentals.' WHERE name = 'rap';
UPDATE Genres SET description = 'Guitar-driven music with prominent drums and strong vocals, ranging from classic rock anthems to modern alternative.' WHERE name = 'rock';


-- Artists: one row per distinct track_artist. country / founded / is_group filled below.
INSERT INTO Artists (name)
SELECT DISTINCT track_artist
FROM staging
ORDER BY track_artist;


-- Backfill country_of_origin / founded / is_group from hand-curated artist_data.csv.
DROP TABLE IF EXISTS artist_staging;
CREATE TEMP TABLE artist_staging (
    name               TEXT,
    country_of_origin  TEXT,
    founded            INTEGER,
    is_group           INTEGER
);

COPY artist_staging FROM '/Users/siyua/INST123/team-project/data/artist_data.csv' WITH (FORMAT csv, HEADER true);

UPDATE Artists a
SET country_of_origin = s.country_of_origin,
    founded           = s.founded,
    is_group          = s.is_group
FROM artist_staging s
WHERE a.name = s.name;

DROP TABLE artist_staging;


-- Albums: one row per distinct track_album_id, joined to Artists by name.
INSERT INTO Albums (album_id, title, artist_id, release_date)
SELECT DISTINCT ON (s.track_album_id) -- An album can have multiple track (therefore distinct)
    s.track_album_id,
    s.track_album_name, 
    a.artist_id,
    s.track_album_release_date
FROM staging s
JOIN Artists a ON a.name = s.track_artist; -- for every row in staging, find the matching row in the Artists table by name.


-- Tracks: all 500 rows. Genre comes from playlist_genre via join.
INSERT INTO Tracks (
    track_id, album_id, genre_id, title, popularity, duration_ms,
    danceability, energy, key, loudness, mode, speechiness,
    acousticness, instrumentalness, liveness, valence, tempo
)
SELECT
    s.track_id,
    s.track_album_id,
    g.genre_id,
    s.track_name,
    s.track_popularity,
    s.duration_ms,
    s.danceability,
    s.energy,
    s.key,
    s.loudness,
    s.mode,
    s.speechiness,
    s.acousticness,
    s.instrumentalness,
    s.liveness,
    s.valence,
    s.tempo
FROM staging s
JOIN Genres g ON g.name = s.playlist_genre;


DROP TABLE staging; -- done w/ it