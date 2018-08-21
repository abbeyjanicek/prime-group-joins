-- 1. Get all customers and their addresses.
SELECT * FROM "customers" JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";

-- 2. Get all orders and their line items.
SELECT "orders"."id", "line_items"."quantity", "products"."description" FROM "orders" JOIN "line_items" ON "orders"."id" = "line_items"."order_id"
JOIN "products" ON "products"."id" = "line_items"."product_id";

-- 3. Which warehouses have cheetos?
SELECT "warehouse"."warehouse" FROM "warehouse" JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id" 
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" WHERE "products"."description" ILIKE 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT "warehouse"."warehouse" FROM "warehouse" JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id" 
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" WHERE "products"."description" ILIKE 'diet pepsi';

-- 5. Get the number of orders for each customer. 
    --NOTE: It is SELECT "customers"."first_name", "customers"."last_name", COUNT(*) FROM "orders" JOIN "addresses" ON "orders"."address_id" = "addresses"."id" 
JOIN "customers" ON "customers"."id" = "addresses"."customer_id" GROUP BY "customers"."id";OK if those without orders are not included in results.


-- 6. How many customers do we have?
SELECT COUNT(*) FROM "customers";

-- 7. How many products do we carry?
SELECT COUNT(*) FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product"."on_hand") FROM "warehouse_product" JOIN "products" ON "warehouse_product"."product_id" = "products"."id" WHERE "products"."description" ILIKE 'diet pepsi';

-- 9. (Stretch) How much was the total cost for each order?


-- 10. (Stretch) How much has each customer spent in total?

-- 11. (Stretch) How much has each customer spent in total? 
    --Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).