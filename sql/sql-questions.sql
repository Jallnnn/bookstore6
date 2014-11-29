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
SELECT * FROM shelf WHERE shelfNr = {shelfNr};

# register shelf
INSERT INTO shelf (shelfNr) VALUES ({shelfNr});

# check ISBN
SELECT isbn FROM book WHERE isbn={isbn};

# register isbn
INSERT INTO book (isbn, title, authorId, shelf_id) VALUES ({isbn}, {title}, {idAuthor}, {idShelf});

# register delivery
INSERT INTO delivery (fprice, quantity, isbn) VALUES ({fprice}, {quantity}, {isbn});

# calculate saleprice
INSERT INTO history_price (salePrice, isbn) SELECT {salePrice}*1.8, isbn FROM delivery WHERE isbn = {isbn};


# register soldbooks
INSERT INTO sale (isbn, qty) VALUES ({isbn}, {qty});

# uppdatePrice
INSERT INTO history_price (isbn, salePrice ) VALUES ({isbn}, {salePrice});
