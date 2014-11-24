# connection
# hostname: 127.0.0.1
# username: root
# password: mysql
# database: bookstore

# register books
INSERT INTO book (ISBN, publisherPrice, quantity, shelf) VALUES ({ISBN}, {publisherPrice}, {quantity}, {shelf});

# register sold books
INSERT INTO sale (isbn, amount) VALUES ({isbn}, {amount});