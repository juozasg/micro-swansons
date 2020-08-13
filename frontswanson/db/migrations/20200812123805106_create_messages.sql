-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TABLE messages(
    id INT PRIMARY KEY, 
    protocol VARCHAR(32), 
    sender VARCHAR(255) NOT NULL, 
    body BLOB, 
    sent_at DATETIME,
    received_at DATETIME);

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE IF EXISTS messages;
