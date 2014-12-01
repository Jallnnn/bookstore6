# connection
# hostname: 127.0.0.1
# username: root
# password: mysql
# database: bookstore


# check author
SELECT * FROM author WHERE fname = {fname} && lname = {lname};

# register author
INSERT INTO author (fname, lname) VALUES ({fname}, {lname});

# check shelf
SELECT * FROM shelf WHERE shelf_id = {shelf_id};

# register shelf
INSERT INTO shelf (shelf_id) VALUES ({shelf_id});

# check ISBN
SELECT isbn FROM book WHERE isbn={isbn};

# register isbn
INSERT INTO book (isbn, title, authorId, shelf_id) VALUES ({isbn}, {title}, {idAuthor}, {idShelf});

# register delivery
INSERT INTO delivery (fprice, qty, isbn) VALUES ({fprice}, {qty}, {isbn});

# register saleprice
INSERT INTO history_price (salePrice, isbn) VALUES ({salePrice}, {isbn});


# register soldbooks
INSERT INTO sale (isbn, qty) VALUES ({isbn}, {qty});

# uppdatePrice
INSERT INTO history_price (isbn, salePrice ) VALUES ({isbn}, {salePrice});


# show everything
SELECT title, shelf_id, fname, lname, publisher_price FROM registery_book WHERE isbn={isbn};

