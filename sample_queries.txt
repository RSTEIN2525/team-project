-- QUERY 1
-- Tracks with unusually high/low energy for their genre: >= 2 stdevs away
WITH genre_stats AS (
    SELECT
        genre_id,
        AVG(energy) as avg_energy,
        STDDEV(energy) as stddev_energy
    FROM Tracks 
    GROUP BY genre_id
)
SELECT
    track.title,
    genre.name AS genre,
    track.energy,
    stat.avg_energy,
    ABS(track.energy - stat.avg_energy) / stat.stddev_energy AS z
FROM Tracks track
JOIN Genres genre ON track.genre_id = genre.genre_id
JOIN genre_stats stat ON track.genre_id = stat.genre_id
WHERE ABS(track.energy - stat.avg_energy) / stat.stddev_energy > 2
ORDER BY z DESC;


-- QUERY 2
-- Underrepresented genres in your collection 
WITH collect_stats AS (
    SELECT
        track.genre_id,
        COUNT(DISTINCT col.item_id) as owned_count
    FROM Tracks track
    JOIN Collection col ON track.album_id = col.album_id
    GROUP BY track.genre_id
),
global_stats AS (
    SELECT
        genre.genre_id,
        genre.name AS genre_name,
        AVG(track.popularity) as avg_global_popularity,
        COUNT(DISTINCT track.album_id) as global_album_count
    FROM Genres genre
    JOIN Tracks track ON genre.genre_id = track.genre_id
    GROUP BY genre.genre_id, genre.name
)
SELECT
    global_stat.genre_name,
    global_stat.global_album_count,
    COALESCE(collect_stat.owned_count, 0) as owned_album_count,
    ROUND(CAST(global_stat.avg_global_popularity AS NUMERIC), 2) as avg_popularity
FROM global_stats global_stat
LEFT JOIN collect_stats collect_stat ON global_stat.genre_id = collect_stat.genre_id
WHERE
    COALESCE(collect_stat.owned_count, 0) < (SELECT AVG(owned_count) FROM collect_stats)
ORDER BY global_stat.avg_global_popularity DESC;

-- QUERY 3
-- Most consistent popular artists
SELECT
    artist.name AS artist_name,
    COUNT(track.track_id) AS total_tracks,
    ROUND(AVG(track.popularity), 2) AS average_popularity,
    ROUND(STDDEV(track.popularity), 2) AS popularity_stddev 
FROM Artists artist
JOIN Albums album ON artist.artist_id = album.artist_id
JOIN Tracks track ON album.album_id = track.album_id
GROUP BY artist.artist_id, artist.name
HAVING
    COUNT(track.track_id) >= 10 -- if small num of tracks, then a small stddev doesn't mean much
    AND AVG(track.popularity) > 50 -- only popular artists
ORDER BY popularity_stddev ASC;

-- QUERY 4
-- Energy and dancability of your collection compared to global average
SELECT
    'Your Collection' as category,
    ROUND(AVG(track.energy)::numeric, 3) as avg_energy,
    ROUND(AVG(track.danceability)::numeric, 3) as avg_danceability,
    COUNT(DISTINCT col.item_id) as albums_analyzed
FROM Tracks track
JOIN Collection col ON track.album_id = col.album_id
UNION ALL
SELECT
    'Global Library' as category,
    ROUND(AVG(energy)::numeric, 3) as avg_energy,
    ROUND(AVG(danceability)::numeric, 3) as avg_danceability,
    COUNT(DISTINCT album_id) as albums_analyzed
FROM Tracks
WHERE popularity > 0;

-- QUERY 5
-- "Hidden Gem" Albums: Albums you rated 4-5 stars but are below global popularity average
SELECT 
    album.title AS album_title,
    artist.name AS artist_name,
    col.personal_rating,
    ROUND(AVG(track.popularity), 2) AS album_avg_popularity
FROM Collection col
JOIN Albums album ON album.album_id = col.album_id
JOIN Artists artist ON artist.artist_id = album.artist_id
JOIN Tracks track ON track.album_id = album.album_id
GROUP BY album.album_id, album.title, artist.name, col.personal_rating
HAVING 
    col.personal_rating >= 4 
    AND AVG(track.popularity) < (
        SELECT AVG(popularity) FROM Tracks
    )
ORDER BY col.personal_rating DESC, album_avg_popularity ASC;
