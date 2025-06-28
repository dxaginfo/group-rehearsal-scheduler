-- Users table
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(255) UNIQUE,
  password_hash VARCHAR(255),
  role VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Bands table
CREATE TABLE IF NOT EXISTS bands (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  owner_id INTEGER REFERENCES users(id)
);
-- Studios table
CREATE TABLE IF NOT EXISTS studios (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  location VARCHAR(255),
  manager_id INTEGER REFERENCES users(id)
);
-- Rehearsals table
CREATE TABLE IF NOT EXISTS rehearsals (
  id SERIAL PRIMARY KEY,
  band_id INTEGER REFERENCES bands(id),
  studio_id INTEGER REFERENCES studios(id),
  scheduled_time TIMESTAMP,
  status VARCHAR(20),
  created_by INTEGER REFERENCES users(id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Attendance table
CREATE TABLE IF NOT EXISTS attendance (
  id SERIAL PRIMARY KEY,
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  user_id INTEGER REFERENCES users(id),
  status VARCHAR(20),
  checked_in_at TIMESTAMP
);
-- Messages table
CREATE TABLE IF NOT EXISTS messages (
  id SERIAL PRIMARY KEY,
  band_id INTEGER REFERENCES bands(id),
  sender_id INTEGER REFERENCES users(id),
  content TEXT,
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Payments table
CREATE TABLE IF NOT EXISTS payments (
  id SERIAL PRIMARY KEY,
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  user_id INTEGER REFERENCES users(id),
  amount DECIMAL,
  status VARCHAR(20),
  processed_at TIMESTAMP
);
