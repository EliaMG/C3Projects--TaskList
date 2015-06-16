require 'sqlite3'

module TaskList
  class Database
    attr_reader :database_name

    def initialize(database_name)
      @database_name = "db/#{ database_name }"
    end

    private

    # this exists as a placeholder for the method within the parent class, the actual call
    # will be on the method within the child class Task
    def create_schema
    ""
    end

    def query!(statement, *params)
      db = SQLite3::Database.new database_name
      #Create the schema for the database
      db.execute(create_schema)
      db.execute statement, params
    rescue SQLite3::Exception => error
      puts "Something has gone terribly wrong."
      puts error.inspect
    ensure
      db.close if db
    end
  end
end
