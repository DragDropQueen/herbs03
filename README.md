# README

# create databases

CD into project directory and run the following in the command line:
    $ psql -d postgres -U <user> -f scripts/create_database_herbs.sql

# create tables

    $ sequel -m migrations postgres://gschool_user:password@localhost/herb_development
    $ sequel -m migrations postgres://gschool_user:password@localhost/herb_test
