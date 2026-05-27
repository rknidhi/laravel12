-- Allow root to connect from any host inside Docker network
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'Gautam@123#';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
