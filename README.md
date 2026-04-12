# Team Project — Spotify Database

## The dataset
We're using the **TidyTuesday "30000 Spotify Songs"** dataset from kaggle (closest to our schema). 

We trimmed it down to **`spotify_top500.csv`** — the top 500 most popular unique tracks. That gives us:
- 500 tracks
- 256 unique artists
- 430 unique albums
- 6 genres (edm, latin, pop, r&b, rap, rock)

Trimmed down to 500 for AI Backfill purposes; got to keep reasonably lean.

## Files in this folder
- `spotify_top500.csv` — the cleaned working dataset. **Use this one.**
- `spotify_songs_raw.csv` — the full 32K-row TidyTuesday dump, kept for reference.
- `tables.sql` — CREATE TABLE statements 

## Schema changes we made

We started with 5 tables (Albums, Artists, Tracks, Genres, Collection). After looking at the data, we made these adjustments:

1. **Moved `genre_id` from Albums to Tracks.** Genre is per-track in the data, not per-album.
2. **Dropped unavailable fields from Albums:** `record_label`, `duration`. Kept `release_year` because the new dataset has it.
3. **Dropped `track_number` from Tracks.** Not in the data.
4. **Added `popularity` and audio features to Tracks** (danceability, energy, tempo, etc.). These are the richest columns in the dataset.
5. **Kept Artists and Collection** even though the CSV doesn't cover them fully. Those we fill in ourselves.

## What we have vs. what we need

| Table | From CSV | Needs manual work |
|---|---|---|
| Tracks | Everything | Nothing |
| Albums | ID, title, release date, artist link | Nothing |
| Genres | Name | Descriptions (optional) |
| Artists | Name only | Country, founded year, is_group |
| Collection | Nothing | All of it |

## Plan for the missing data

**Artists (256 rows):** For each artist, we look up and fill in:
- Country of origin
- Year founded / career start
- Whether it's a group or solo artist

Sources: Find some api, send claude code with web search after it, ... (whatever)

**Collection (hand-entered, ~20 rows):** 
Each of us picks a few albums from our real collection and fills in format, date acquired, price, and rating. These don't have to exist in the Albums table — they can reference any album we add.

**Genre descriptions (optional, 6 rows):** 
One short sentence per genre. C+V from google or make something up

---

## Backfill Checklist

After running `tables.sql` and `import.sql`, these are the columns left to fill in by hand:

| Table       | Rows | Columns to backfill                                 | Required? |
| ----------- | ---- | --------------------------------------------------- | --------- |
| Genres      | 6    | `description`                                       | Optional  |
| Artists     | 256  | `country_of_origin`, `founded`, `is_group`          | Required  |
| Albums      | 430  | —                                                   | Done      |
| Tracks      | 500  | —                                                   | Done      |
| Collection  | ~20  | `album_id`, `format`, `date_acquired`, `purchase_price`, `personal_rating` | Required  |

**What each column needs:**

- **Genres → `description`**
  - One short sentence describing the genre.
  - Example: `"A style of electronic music built around synthesized beats and heavy drops."`

- **Artists → `country_of_origin`**
  - Country where the artist is from. Full name, not abbreviation.
  - Example: `"United States"`, `"United Kingdom"`, `"Canada"`

- **Artists → `founded`**
  - Year the artist started making music (career start for solo, formation year for groups).
  - Example: `2006` (Taylor Swift), `1962` (The Rolling Stones)

- **Artists → `is_group`**
  - `0` for solo artists, `1` for groups/bands/duos.

- **Collection → all columns**
  - Pick real albums from your personal collection. They must reference an `album_id` that already exists in the Albums table.
  - `format`: `"vinyl"`, `"CD"`, `"cassette"`, `"digital"`
  - `date_acquired`: ISO date, e.g. `"2024-11-03"`
  - `purchase_price`: USD, e.g. `24.99`
  - `personal_rating`: integer 1–5

