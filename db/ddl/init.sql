CREATE TABLE IF NOT EXISTS products 
(
    product_id Int32 NOT NULL,
    product_name String NOT NULL,
    price Float32 NOT NULL
)
ENGINE = MergeTree()
ORDER BY product_id;

CREATE TABLE IF NOT EXISTS shops
(
    shop_id Int32 NOT NULL,
    shop_name String NOT NULL
)
ENGINE = MergeTree()
ORDER BY shop_id;

CREATE TABLE IF NOT EXISTS plan
(
    product_id Int32 NOT NULL,
    shop_id Int32 NOT NULL,
    plan_cnt Int32 NOT NULL,
    plan_date Date NOT NULL
)
ENGINE = MergeTree()
ORDER BY (product_id, shop_id);

CREATE TABLE IF NOT EXISTS shop_dns
(
    shop_id Int32 NOT NULL,
    date Date NOT NULL,
    product_id Int32 NOT NULL,
    sales_cnt Int32 NOT NULL
)
ENGINE = MergeTree()
ORDER BY (shop_id, product_id);

CREATE TABLE IF NOT EXISTS shop_mvideo
(
    shop_id Int32 NOT NULL,
    date Date NOT NULL,
    product_id Int32 NOT NULL,
    sales_cnt Int32 NOT NULL
)
ENGINE = MergeTree()
ORDER BY (shop_id, product_id);

CREATE TABLE IF NOT EXISTS shop_sitilink
(
    shop_id Int32 NOT NULL,
    date Date NOT NULL,
    product_id Int32 NOT NULL,
    sales_cnt Int32 NOT NULL
)
ENGINE = MergeTree()
ORDER BY (shop_id, product_id);
