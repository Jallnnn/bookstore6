1)Select * FROM book NATURAL JOIN author
1-1)CREATE VIEW book_and_author AS (Select * FROM book NATURAL JOIN author)

2)select *,
(select `salePrice` from `history_price`where (`history_price`.`isbn` = `book_and_author`.`isbn`) order by `change_date` limit 1) AS `price` 
 from `book_and_author`
2-1)CREATE VIEW current_price AS (2)
 
3)select *,(`price` * 1.06) AS `price_inc_vat` from `current_price`
3-1)CREATE VIEW current_price_with_vat AS(3)
 
4)select *,
  (select sum(`qty`) from `delivery` where (`delivery`.`isbn` = `book_and_author`.`isbn`)) AS `delivered_qty`,
  (select sum(`qty`) from `sale` where (`sale`.`isbn` = `book_and_author`.`isbn`)) AS `sold_qty` 
  from `book_and_author`
4-1)CREATE VIEW books_deliverd_and_sold AS(4)
 
5)select * ,(`delivered_qty` - `sold_qty`) AS `in_stock` from `books_deliverd_and_sold`
5_1)CREATE VIEW in_stock AS (5)
 