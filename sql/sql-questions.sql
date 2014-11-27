# connection
# hostname: 127.0.0.1
# username: root
# password: mysql
# database: bookstore

# get all isbn
SELECT isbn FROM delivery;

# register isbn
INSERT INTO delivery (isbn) VALUES ({isbn});

# get authors
SELECT * FROM authors;

# register author
INSERT INTO authors (fname, lname) VALUES ({fname}, {lname});

# get shelves
SELECT * FROM shelf;

# register shelf
INSERT INTO shelf (shelf) VALUES ({shelf});

# get tittles
SELECT * FROM bookTittles;

# register tittle
INSERT INTO bookTittles (tittle) VALUES ({tittle});

# register soldbooks
INSERT INTO sale (isbn, qty) VALUES ({isbn}, {qty});


# register fprice
INSERT INTO book (isbn, f_price) VALUES ({isbn}, {f_price});

# calculate saleprice
INSERT INTO history_price (salePrice, isbn) SELECT f_price*1.8, isbn FROM book WHERE isbn = {isbn};



#check ISBN
SELECT isbn FROM book WHERE isbn={isbn}

# uppdatePrice
INSERT INTO history_price (isbn,salePrice ) VALUES ({isbn}, {salePrice});

