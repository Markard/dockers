CREATE TABLE "t_user"
(
    id         BIGINT                         NOT NULL,
    full_name  VARCHAR(255)                   NOT NULL,
    email      VARCHAR(255)                   NOT NULL,
    created_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    updated_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO "t_user" (id, full_name, email, created_at, updated_at)
SELECT num,
       'person' || num,
       'person' || num || '@' ||
       (CASE (RANDOM() * 2)::INTEGER
            WHEN 0 THEN 'gmail'
            WHEN 1 THEN 'hotmail'
            WHEN 2 THEN 'yahoo'
           END) || '.com',
       CURRENT_TIMESTAMP,
       CURRENT_TIMESTAMP
FROM GENERATE_SERIES(0, 100000) AS num;


ALTER TABLE t_user
    OWNER TO "cdc_group";

ALTER TABLE "t_user"
    REPLICA IDENTITY FULL;

CREATE PUBLICATION "cdc_t_user" FOR TABLE "t_user";

