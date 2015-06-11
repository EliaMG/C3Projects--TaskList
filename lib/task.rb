require 'sqlite3'

module TaskList
  class Task < Database

    # def self.validate_input(name)
    #   raise ArgumentError.new "You must enter a task name" if name == ""
    # end


    def all_tasks
    statement = "select * from tasklist;"
    query!(statement)
    end

    def add_task
      statement = "insert into tasklist (name, description, completed_date) VALUES ('hello' 'hi' 'aug 5');"
      query!(statement)
    end

  private

    def create_schema
      "create table if not exists tasklist (id integer primary key, name text not null, description text, completed_date text);"
    end

  end
end
