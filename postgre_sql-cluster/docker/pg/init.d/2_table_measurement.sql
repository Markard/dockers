CREATE TABLE measurement
(
    city_id   INT  NOT NULL,
    logdate   DATE NOT NULL,
    peaktemp  INT,
    unitsales INT
) PARTITION BY RANGE (logdate);

CREATE TABLE measurement_y2006m02 PARTITION OF measurement
    FOR VALUES FROM ('2006-02-01') TO ('2006-03-01');

CREATE TABLE measurement_y2006m03 PARTITION OF measurement
    FOR VALUES FROM ('2006-03-01') TO ('2006-04-01');

INSERT INTO measurement
VALUES ('1', '2006-02-1', RANDOM(1, 1000), RANDOM(1, 1000));