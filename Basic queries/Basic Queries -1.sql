
USE practice;

CREATE TABLE user(
 id BIGINT UNSIGNED AUTO_INCREMENT ,
 name VARCHAR(255),
 email VARCHAR(255) NOT NULL UNIQUE,
 phone_number VARCHAR(20),
 password VARCHAR(255) NOT NULL,

 PRIMARY KEY (id)
);

ALTER TABLE user ADD COLUMN created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE user ADD COLUMN updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE user MODIFY phone_number VARCHAR(15);

DESCRIBE user;

SELECT * FROM user;



INSERT INTO user(name,email,phone_number,password)
 VALUES
  ('RAM','ram@gmail.com','9846589566','password'),
  ('RUBY','ruby@gmail.com','9847589566','password'),
  ('KANAN','kannan@gmail.com','9806589566','passward'),
  ('KEDHAR','kedhar@gmail.com','9846589666','password');

SELECT * FROM user 
WHERE phone_number ='9806589566';

DROP TABLE user;