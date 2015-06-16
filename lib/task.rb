require 'sqlite3'

module TaskList
  class Task < Database

    def all_tasks
      statement = "select * from tasklist;"
      query!(statement)
    end

    def get_todo(list)
      to_do = []
      list.each do |task|
        if task[3] == ""
          to_do.push(task)
        end
      end
     to_do
    end

    def get_completed(list)
      completed_tasks = []
      list.each do  |task|
        if task[3] != ""
          completed_tasks.push(task)
        end
      end
      completed_tasks
    end

    def add_task(name, description, completed_date)
      query!("insert into tasklist (name, description, completed_date) VALUES (?, ?, ?);", name.to_s, description.to_s, completed_date.to_s)
    end

    def update_date(id)
      # time = Time.now.strftime("%d/%m/%Y")
      query!("update tasklist SET completed_date='#{Time.now.strftime("%d/%m/%Y")}' where id =#{id};")
    end

  private

    def create_schema
      "create table if not exists tasklist (id integer primary key, name text not null, description text, completed_date text);"
    end

  end
end
