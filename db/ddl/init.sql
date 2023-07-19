CREATE TABLE IF NOT EXISTS products 
(
    product_id Int32,
    product_name String,
    price Float32
)
ENGINE = MergeTree()
ORDER BY product_id;