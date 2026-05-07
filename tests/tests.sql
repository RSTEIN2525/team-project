-- Row counts (expect: 6 / 256 / 430 / 500)                                                                                              
  SELECT 'genres'  AS tbl, COUNT(*) FROM Genres                                                                                             
  UNION ALL SELECT 'artists', COUNT(*) FROM Artists                                                                                           
  UNION ALL SELECT 'albums',  COUNT(*) FROM Albums                                                                                            
  UNION ALL SELECT 'tracks',  COUNT(*) FROM Tracks;                                                                                           
                                                                                                                                              
  -- Artists backfill: zero rows expected                                                                                                  
  SELECT COUNT(*) AS artists_with_nulls                                                                                                       
  FROM Artists                                                                                                                                
  WHERE country_of_origin IS NULL                                                                                                             
     OR founded IS NULL                                                                                                                       
     OR is_group IS NULL;                                                          
                                                                                                                                              
  -- Show any artists still missing data (should be empty)                                                                                 
  SELECT * FROM Artists                                 
  WHERE country_of_origin IS NULL OR founded IS NULL OR is_group IS NULL;                                                                     
                                                                                                                                                                
                                                     
  -- founded year (1962-2021)                                                                                   
  SELECT MIN(founded) AS earliest, MAX(founded) AS latest FROM Artists;                                                                       
                                                                                                                                              
  -- Country distribution (US > UK > ...)                                                                                   
  SELECT country_of_origin, COUNT(*) AS n                                                                                                     
  FROM Artists                                                                                                                                
  GROUP BY country_of_origin                         
  ORDER BY n DESC                                                                                                                             
  LIMIT 10;                                                                                                                                                                  
                                                                                   
  -- Audio feature range sanity (0–1 scales)                                                                                               
  SELECT                                                
    MIN(danceability) AS dance_min, MAX(danceability) AS dance_max,                                                                           
    MIN(energy)       AS energy_min, MAX(energy)       AS energy_max,                                                                         
    MIN(valence)      AS valence_min, MAX(valence)     AS valence_max,                                                                        
    MIN(popularity)   AS pop_min,    MAX(popularity)   AS pop_max                                                                             
  FROM Tracks;                                                                                                                                
                                                                                                                                              
  -- Whole e2e                                                                             
  SELECT t.title, a.name AS artist, a.country_of_origin, a.founded, a.is_group,
         al.title AS album, g.name AS genre, t.popularity                                                                                     
  FROM Tracks t                                                                                                                               
  JOIN Albums  al ON al.album_id = t.album_id                                                                                                 
  JOIN Artists a  ON a.artist_id = al.artist_id                                                                                               
  JOIN Genres  g  ON g.genre_id  = t.genre_id                                      
  ORDER BY t.popularity DESC                                                                                                                  
  LIMIT 10;     
  
  -- Ryan Col. tests
  -- Make sure all 25 are there                                                                                                                
  SELECT COUNT(*) AS collection_rows FROM Collection;                                                                                         
                                                                               
  -- Format distribution | 17 digital / 5 vinyl / 3 CD                                                                           
  SELECT format, COUNT(*) AS n, ROUND(AVG(purchase_price)::numeric, 2) AS avg_price                                                           
  FROM Collection                                                                                                                             
  GROUP BY format                                           
  ORDER BY n DESC;                                                                                                                            
                                                                                                                                                                         
                                                                                                                              
  --Take alook                                                             
  SELECT c.format, c.date_acquired, c.purchase_price, c.personal_rating,                                                                      
         al.title AS album, ar.name AS artist, g.name AS genre                                                                                
  FROM Collection c                                                                                                                           
  JOIN Albums  al ON al.album_id = c.album_id
  JOIN Artists ar ON ar.artist_id = al.artist_id                                                                                              
  JOIN Tracks  t  ON t.album_id  = al.album_id              
  JOIN Genres  g  ON g.genre_id  = t.genre_id                                                                                                 
  GROUP BY c.item_id, c.format, c.date_acquired, c.purchase_price,
           c.personal_rating, al.title, ar.name, g.name                                                                                       
  ORDER BY c.date_acquired;                               