require "sinatra"
require "sinatra/reloader"
require "./lib/database.rb"
require "./lib/task.rb"
# require "pry"

class TaskSite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    @title = "Home"
    query = TaskList::Task.new("tasklist")
    @all_tasks = query.all_tasks

    @to_do = query.get_todo(@all_tasks)

    @completed_tasks = query.get_completed(@all_tasks)

    @id = params[:task].to_i
    query.update_date(@id)

    erb :home
  end

  get "/add_task" do
    @title = "Add Task"
    erb :addtask
  end

  post "/add_task" do
    query = TaskList::Task.new("tasklist")

    query.add_task(params[:name], params[:description], params[:completed_date])

    redirect "/"
  end

  post "/" do
    @title = "Home"

    query = TaskList::Task.new("tasklist")

    @all_tasks = query.all_tasks

    @completed_tasks = query.get_completed(@all_tasks)
    @to_do = query.get_todo(@all_tasks)

    @id = params[:task].to_i
    query.update_date(@id)

    erb :home
    redirect "/"
  end
    # binding.pry

end
