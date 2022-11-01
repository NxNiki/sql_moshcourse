## securing the database:

# 
create user john identified by '12345'; # password

# user can connect from any computers in this domain.
create user john@127.0.0.1;
create user john@localhost;
create user john@codewithmosh.com; # user can connect from any computers in this domain.
create user john@'%.codewithmosh.com'; # user can connect from any computers in this domain and the subdomains.

