require "sinatra"
require "sinatra/reloader"
require "./lib/database.rb"
require "./lib/task.rb"

class TaskSite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    @title = "Home"
    query = TaskList::Task.new("tasklist")
    @all_tasks = query.all_tasks
    erb :home
  end

  get "/add_task" do
    @title = "Add Task"
    erb :addtask
  end

  post "/add_task" do
    @title = "Add Task"
    @task = params[:task]

    #@new_task = TaskList::Task.validate_input(@name)


    redirect to("/")
  end

end
