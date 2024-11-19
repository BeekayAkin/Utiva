-- Accross store locations
select
	distinct product_category,
	store_location,
	sum(product_price -product_cost) as profit
from
	product
INNER join
	sales
on
	product.product_id=sales.product_id
INNER join
	store_details
on
	sales.store_id =store_details.store_id
GROUP by
	product_category,
	store_location
order by
	profit DESC
limit 15;

--------------- Question 2
select
	store_name,
	sum(stock_on_hand * (product_price-product_cost)) as Left_over
from
	product
full join
	inventory
on
	product.product_id = inventory.product_id
full join
	store_details
on
	store_details.store_id = inventory.store_id
group by 
	store_name
order by
	left_over;

-------------------Question 3

select
	distinct store_location,
	product_name,
	stock_on_hand
from
	product
full join
	inventory
on
	product.product_id = inventory.product_id
full join
	store_details
on
	inventory.store_id=store_details.store_id
where
	stock_on_hand <=0
group by
	store_location,
	product_name,
	stock_on_hand;
