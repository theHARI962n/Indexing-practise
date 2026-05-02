CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    age INT
);

INSERT INTO users (name, email, age)
SELECT 
    'User' || i,
    'user' || i || '@mail.com',
    (random() * 50 + 20)::int
FROM generate_series(1, 100000) i;

select * from users limit 10;

EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'user50000@mail.com';

CREATE INDEX idx_users_email ON users(email);

SELECT * FROM pg_indexes WHERE tablename = 'users';
