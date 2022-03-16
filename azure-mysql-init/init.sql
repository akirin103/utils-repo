CREATE SCHEMA IF NOT EXISTS test_schema DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS test_table;
CREATE TABLE IF NOT EXISTS test_schema.sessions (
  `token` varchar(255) NOT NULL,
  `user_no` varchar(10) DEFAULT NULL,
  `expiration_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT 'session table';

INSERT INTO test_schema.sessions VALUES ("test-token", "1", NULL);
