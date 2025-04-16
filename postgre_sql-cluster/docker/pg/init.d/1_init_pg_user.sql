CREATE USER "pg_user" WITH PASSWORD 'pg_pass';
GRANT ALL PRIVILEGES ON DATABASE "db_name" TO "pg_user";

CREATE ROLE "cluster_group";
GRANT "cluster_group" TO "user";
GRANT "cluster_group" TO "pg_user";