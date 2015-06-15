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
    erb :home
  end

  get "/add_task" do
    @title = "Add Task"
    erb :addtask
  end

  post "/" do
    @title = "Home"
    query = TaskList::Task.new("tasklist")
    query.add_task(params[:name], params[:description], params[:completed_date])
    @all_tasks = query.all_tasks
    @id = params[:task].to_i
    query.update_date(@id)
    erb :home
  end
    # binding.pry

end
