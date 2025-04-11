CREATE TABLE db_name.t_user
(
    `id`         UInt64,
    `full_name`  String,
    `email`      String,
    `created_at` DateTime64,
    `updated_at` DateTime64
) ENGINE = ReplacingMergeTree(`updated_at`)
      ORDER BY `id`;