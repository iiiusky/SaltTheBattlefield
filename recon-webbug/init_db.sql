CREATE DATABASE webbug;
USE webbug;
CREATE TABLE requests (id TEXT, type TEXT, ip_address TEXT, user_agent TEXT, time INTEGER);
GRANT USAGE ON *.* TO webbuguser@localhost IDENTIFIED BY 'LastPizzaToeHorseMarvelous';
GRANT ALL PRIVILEGES ON webbug.* TO webbuguser@localhost;
