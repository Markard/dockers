CREATE USER "kc_user" WITH PASSWORD 'kc_pass' REPLICATION;
GRANT ALL PRIVILEGES ON DATABASE "db_name" TO "kc_user";

CREATE ROLE "cdc_group";
GRANT "cdc_group" TO "user";
GRANT "cdc_group" TO "kc_user";