

-- create the sample_app database
drop database if exists sample_app;
create database sample_app;
use sample_app;

-- create the sample_app user for cf to connect through
-- drop user 'sa_cf_user'@'localhost';
create user 'sa_cf_user'@'localhost' identified by 'sa_cf_pw';
grant delete on sample_app.* to 'sa_cf_user'@'localhost';
grant insert on sample_app.* to 'sa_cf_user'@'localhost';
grant select on sample_app.* to 'sa_cf_user'@'localhost';
grant update on sample_app.* to 'sa_cf_user'@'localhost';

-- add tables and data
source ddl_tbl_state.sql;
source data_tbl_state.sql;

commit;
