# Universe Database Lab

## Overview
This project is a PostgreSQL database lab designed to model a **universe** consisting of galaxies, stars, planets, moons, and comets. The database is named `universe` and includes sample data to illustrate the hierarchical relationships between celestial objects.

The lab fulfills the following requirements:
- Database: `universe`
- Tables: `galaxy`, `star`, `planet`, `moon`, `comet`
- Primary keys with auto-increment
- Foreign key relationships:
  - `star.galaxy_id` → `galaxy.galaxy_id`
  - `planet.star_id` → `star.star_id`
  - `moon.planet_id` → `planet.planet_id`
- Various data types used: `INT`, `NUMERIC`, `VARCHAR`, `TEXT`, `BOOLEAN`
- Constraints: `UNIQUE`, `NOT NULL`  

---

## Database Schema

### Galaxy
| Column       | Type      | Constraints                   |
|--------------|-----------|-------------------------------|
| galaxy_id    | SERIAL    | PRIMARY KEY                   |
| name         | VARCHAR   | UNIQUE, NOT NULL              |
| num_stars    | INT       | NOT NULL                      |
| mass         | NUMERIC   |                               |
| type         | VARCHAR   |                               |
| is_visible   | BOOLEAN   |                               |
| is_active    | BOOLEAN   |                               |
| description  | TEXT      |                               |

### Star
| Column       | Type      | Constraints                   |
|--------------|-----------|-------------------------------|
| star_id      | SERIAL    | PRIMARY KEY                   |
| name         | VARCHAR   | UNIQUE, NOT NULL              |
| galaxy_id    | INT       | FOREIGN KEY → galaxy(galaxy_id), NOT NULL |
| luminosity   | NUMERIC   | NOT NULL                      |
| temperature  | INT       |                               |
| is_supernova | BOOLEAN   |                               |
| is_visible   | BOOLEAN   |                               |
| spectral_type| VARCHAR   |                               |

### Planet
| Column       | Type      | Constraints                   |
|--------------|-----------|-------------------------------|
| planet_id    | SERIAL    | PRIMARY KEY                   |
| name         | VARCHAR   | UNIQUE, NOT NULL              |
| star_id      | INT       | FOREIGN KEY → star(star_id), NOT NULL |
| mass         | NUMERIC   | NOT NULL                      |
| radius       | INT       |                               |
| has_rings    | BOOLEAN   |                               |
| is_habitable | BOOLEAN   |                               |
| atmosphere   | TEXT      |                               |

### Moon
| Column       | Type      | Constraints                   |
|--------------|-----------|-------------------------------|
| moon_id      | SERIAL    | PRIMARY KEY                   |
| name         | VARCHAR   | UNIQUE, NOT NULL              |
| planet_id    | INT       | FOREIGN KEY → planet(planet_id), NOT NULL |
| diameter     | INT       | NOT NULL                      |
| mass         | NUMERIC   |                               |
| has_atmosphere | BOOLEAN |                               |
| is_colored   | BOOLEAN   |                               |
| composition  | TEXT      |                               |

### Comet
| Column       | Type      | Constraints                   |
|--------------|-----------|-------------------------------|
| comet_id     | SERIAL    | PRIMARY KEY                   |
| name         | VARCHAR   | UNIQUE, NOT NULL              |
| orbit_period | INT       | NOT NULL                      |
| mass         | NUMERIC   |                               |
| is_visible   | BOOLEAN   |                               |
| has_tail     | BOOLEAN   |                               |
| origin       | TEXT      |                               |

---

## Sample Data
- Galaxy: 6 rows
- Star: 6 rows
- Planet: 12 rows
- Moon: 20 rows
- Comet: 3 rows

> All foreign keys are correctly linked to show the hierarchy: Galaxy → Star → Planet → Moon.

---

## Usage

1. **Create the database**
```sql
CREATE DATABASE universe;
\c universe
psql -U your_username -d universe -f universe.sql
SELECT * FROM galaxy;
SELECT * FROM star;
SELECT * FROM planet;
SELECT * FROM moon;
SELECT * FROM comet;
