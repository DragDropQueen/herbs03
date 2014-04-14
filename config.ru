require_relative 'herb_app'
require 'sequel'
DB = Sequel.connect('postgres://gschool_user:password@localhost/herb_development')

run HerbApp