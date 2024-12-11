CREATE TABLE rockwell_user (
   user_id varchar(10) PRIMARY KEY,
   name varchar(100)
);
CREATE TABLE session_table (
   session_id varchar(10) PRIMARY KEY,
   user_id varchar(10) NOT NULL,
   session_start TIME NOT NULL,
   FOREIGN KEY (user_id) REFERENCES rockwell_user (user_id)
);
CREATE TABLE engagements (
   session_id varchar(10) PRIMARY KEY,
   post_id bigint NOT NULL,
   shared varchar(1000),
   liked varchar(1000),
   clicked varchar(1000)
);