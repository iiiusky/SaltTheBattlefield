DROP masscan if exists;
create database masscan;
CREATE USER 'masscan'@'localhost' IDENTIFIED BY 'WorldDoggoFishTulupDanger';
GRANT ALL PRIVILEGES ON masscan.* TO 'masscan'@'localhost';
