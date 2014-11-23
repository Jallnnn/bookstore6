# connection
# hostname: 127.0.0.1
# username: root
# password: mysql
# database: bookstore

# register books
INSERT INTO book (ISBN, publisherPrice, date, quantity, shelf) VALUES ({ISBN}, {publisherPrice}, {date}, {quantity}, {shelf});

# register sold books
INSERT INTO book (isbn, amount, date) VALUES ({isbn}, {amount}, {date});