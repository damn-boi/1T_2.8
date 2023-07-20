WITH
all_shop_sales AS (
		SELECT shop_id, date, product_id, sales_cnt
		FROM shop_dns
		UNION DISTINCT SELECT shop_id, date, product_id, sales_cnt
			FROM shop_mvideo
		UNION DISTINCT SELECT shop_id, date, product_id, sales_cnt
			FROM shop_sitilink
),
shop_sales AS (
        SELECT shop_name, shop_id, 
        toMonth(date) AS month, product_id, 
        sum(sales_cnt) sales
        FROM all_shop_sales ss
        INNER JOIN shops USING (shop_id)
        GROUP BY shop_name, product_id, shop_id, month
),
plan_with_accurate_month AS (
		SELECT product_id, shop_id, plan_cnt, 
		toMonth(plan_date) as month, plan_date
		from plan)
SELECT
    ss.shop_name,
    pr.product_name,
    pl.plan_date,
	ss.sales AS sales_fact,
	pl.plan_cnt AS sales_plan,
	ss.sales / pl.plan_cnt AS sales_ratio,
	ss.sales * pr.price AS income_fact,
    pl.plan_cnt * pr.price AS income_plan,
    ss.sales * pr.price / (pl.plan_cnt * pr.price) AS income_ratio
FROM
	shop_sales AS ss
	JOIN plan_with_accurate_month AS pl ON ss.shop_id = pl.shop_id AND ss.product_id = pl.product_id
	AND ss.month = pl.month
	JOIN products AS pr ON ss.product_id = pr.product_id;