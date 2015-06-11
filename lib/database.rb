require 'sqlite3'

module TaskList
  class Database
    attr_reader :database_name

    def initialize(database_name)
      @database_name = "db/#{ database_name }"
    end

    def your_custom_query_here(*args)
      # santitize/validate your arguments

      # prepare your statement

      # call `query!` to interact with the database

      # determine what should be returned
    end


    private

    # this exists as a placeholder for the method within the parent class, the actual call
    # will be on the method within the child class Task
    def create_schema
    ""
    end

    def query!(statement, *params)
      db = SQLite3::Database.new database_name
      db.execute(create_schema)
      db.execute statement, params
    rescue SQLite3::Exception => error
      # use this block to recover from an error
      # consider giving the user a special message back
      # inspect the `error` object for information about the error
    ensure
      db.close if db
    end
  end
end

# TaskList::Database.new(tasklist)
