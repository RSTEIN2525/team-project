
CREATE TABLE Genres (
    genre_id      SERIAL PRIMARY KEY, 
    name          TEXT NOT NULL UNIQUE, -- i.e.  (edm, latin, pop, r&b, rap, rock)
    description   TEXT -- single sentence to capture genre attributes
);

CREATE TABLE Artists (
    artist_id          SERIAL PRIMARY KEY,
    name               TEXT NOT NULL, -- i.e. Taylor Swift
    country_of_origin  TEXT, -- i.e. United States of America
    founded            INTEGER, -- i.e. 2002
    is_group           INTEGER   -- {0 : solo, 1 : group}
);


CREATE TABLE Albums (
    album_id       TEXT PRIMARY KEY,
    title          TEXT NOT NULL, -- i.e. good kid, m.A.A.d. city
    artist_id      INTEGER NOT NULL, -- ref to artists table
    release_date   TEXT,  -- ISO date string 
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);


-- Tracks: the main table
CREATE TABLE Tracks (
    track_id          TEXT PRIMARY KEY,       -- i.e. 2XU0oxnq2qxCpomAAuJY8K (Spotify track ID)
    album_id          TEXT NOT NULL,          -- ref to albums table
    genre_id          INTEGER,                -- ref to genres table
    title             TEXT NOT NULL,          -- i.e. "Dance Monkey"
    popularity        INTEGER,                -- 0-100, higher = more popular. i.e. 100
    duration_ms       INTEGER,                -- length in ms. i.e. 209438 (~3:29)
    danceability      REAL,                   -- 0.0-1.0, higher = more danceable. i.e. 0.824
    energy            REAL,                   -- 0.0-1.0, higher = more intense/loud. i.e. 0.588
    key               INTEGER,                -- 0-11 pitch class, -1 if unknown. i.e. 6 (F#)
    loudness          REAL,                   -- dB, typically -60 to 0. i.e. -6.4
    mode              INTEGER,                -- {0 : minor, 1 : major}. i.e. 0
    speechiness       REAL,                   -- 0.0-1.0, >0.66 = mostly spoken word. i.e. 0.0924
    acousticness      REAL,                   -- 0.0-1.0, higher = more acoustic. i.e. 0.692
    instrumentalness  REAL,                   -- 0.0-1.0, higher = no vocals. i.e. 0.000104
    liveness          REAL,                   -- 0.0-1.0, >0.8 = likely live recording. i.e. 0.149
    valence           REAL,                   -- 0.0-1.0, higher = more positive/happy. i.e. 0.513
    tempo             REAL,                   -- BPM. i.e. 98.027
    FOREIGN KEY (album_id) REFERENCES Albums(album_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);


-- personal album collection. User / Hand-entered.
CREATE TABLE Collection (
    item_id          SERIAL PRIMARY KEY,
    album_id         TEXT NOT NULL,            -- ref to albums table
    format           TEXT,                     -- i.e. vinyl, CD, cassette, digital
    date_acquired    TEXT,                     -- ISO date. i.e. 2024-11-03
    purchase_price   REAL,                     -- USD. i.e. 24.99
    personal_rating  INTEGER,                  -- {1..5}. i.e. 4
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);
