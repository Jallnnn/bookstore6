# connection
# hostname: 127.0.0.1
# username: root
# password: mysql
# database: bookstore

# get authors
SELECT * FROM authors;

# register author
INSERT INTO authors (fname, lname) VALUES ({fname}, {lname});

# get shelves
SELECT * FROM shelf;

#register shelf
INSERT INTO shelf (shelf) VALUES ({shelf});

# register soldbooks
INSERT INTO sale (isbn, qty) VALUES ({isbn}, {qty});



#check ISBN
SELECT isbn FROM book WHERE isbn={isbn}

# uppdatePrice
INSERT INTO history_price (isbn,salePrice ) VALUES ({isbn}, {salePrice});

