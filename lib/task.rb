require 'sqlite3'

module TaskList
  class Task < Database

     # def validate_input(name)
     #   raise ArgumentError.new "You must enter a task name" if name.to_s == ""
     # end


    def all_tasks
    statement = "select * from tasklist;"
    query!(statement)
    end

    def add_task(name, description, completed_date)
      # validate_input(name)
      query!("insert into tasklist (name, description, completed_date) VALUES (?, ?, ?);", name.to_s, description.to_s, completed_date.to_s)
    end

  private

    def create_schema
      "create table if not exists tasklist (id integer primary key, name text not null, description text, completed_date text);"
    end

  end
end
