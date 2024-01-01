CREATE KEYSPACE IF NOT EXISTS store WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};

CREATE TABLE IF NOT EXISTS store.shopping_cart (
  userid text PRIMARY KEY,
  item_count int,
  last_update timestamp
);

INSERT INTO store.shopping_cart(userid, item_count, last_update) VALUES ('1234', 2323, toTimeStamp(now()));
