# connection
# hostname: 127.0.0.1
# username: root
# password: mysql
# database: bookstore

# get author
SELECT * FROM authors;

# register author
INSERT INTO authors (fname, lname) VALUES ({fname}, {lname});

# register soldbooks
INSERT INTO sale (isbn, qty) VALUES ({isbn}, {qty});



#check ISBN
SELECT isbn FROM book WHERE isbn={isbn}

# uppdatePrice
INSERT INTO history_price (isbn,salePrice ) VALUES ({isbn}, {salePrice});

