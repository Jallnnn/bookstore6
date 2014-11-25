# connection
# hostname: 127.0.0.1
# username: root
# password: mysql
# database: bookstore

# get author
SELECT * FROM authors WHERE fname = {fname} AND lname = {lname};

# register author
INSERT INTO authors (fname, lname) VALUES ({fname}, {lname});

# register soldbooks
INSERT INTO sale (isbn, qty) VALUES ({isbn}, {qty});