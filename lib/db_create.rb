require "sqlite3"

db = SQLite3::Database.new "db/tasklist.db"

db.execute "create table tasklist(id INTEGER PRIMARY KEY, name TEXT NOT NULL, description TEXT, completed_date TEXT);"

db.close if db
