-- Set root password
SET PASSWORD FOR 'root'@localhost = PASSWORD('{MYSQL_ROOT_PASSWORD}');

-- Create non-root mysql user
CREATE USER IF NOT EXISTS '{MYSQL_USER}'@localhost IDENTIFIED BY '{MYSQL_PASSWORD}';

-- Delete anonymous users
DELETE FROM mysql.user WHERE User='';

-- Delete remote root
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

-- Drop test database
DROP DATABASE IF EXISTS test;

-- Create custom named database
CREATE DATABASE IF NOT EXISTS {MYSQL_DB};

-- Create user on behalf which to access from remote host
CREATE USER IF NOT EXISTS '{MYSQL_USER}'@'{MYSQL_REMOTE_HOST}' IDENTIFIED BY '{MYSQL_REMOTE_PASSWORD}';

-- Grant all privileges for mysql user at wordpress domain to custom named database;
GRANT ALL PRIVILEGES ON {MYSQL_DB}.* TO '{MYSQL_USER}'@'{MYSQL_REMOTE_HOST}';

-- Remove privileges on test database...
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';

-- Reload privilege tables
FLUSH PRIVILEGES;
