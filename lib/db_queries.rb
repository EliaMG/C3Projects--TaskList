require "sqlite3"

db = SQLite3::Database.open "db/tasklist.db"

show_me = db.execute2 "select * from tasklist;"

puts show_me

db.close if db

