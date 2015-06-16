require "sinatra"
require "sinatra/reloader"
require "./lib/database.rb"
require "./lib/task.rb"


class TaskSite < Sinatra::Base
  register Sinatra::Reloader

  # Instantiates an instance of the tasklist table in the Task class
  # Creates variables the contain arrays which are lists of all current entries in the table
  get "/" do
    @title = "Home"
    query = TaskList::Task.new("tasklist")
    @all_tasks = query.all_tasks

    @to_do = query.get_todo(@all_tasks)

    @completed_tasks = query.get_completed(@all_tasks)

    erb :home
  end

  get "/add_task" do
    @title = "Add Task"
    erb :addtask
  end

  # Adds the tasks to the database according to the values that were inserted by the user
  # Redirects to the home page
  post "/add_task" do
    query = TaskList::Task.new("tasklist")

    query.add_task(params[:name], params[:description], params[:completed_date])

    redirect "/"
  end

  # Creates variables which show the array of the current table of tasks
  # Updates the instance of the Task class when the radio button is checked in the HTML
  post "/" do
    @title = "Home"

    query = TaskList::Task.new("tasklist")

    @all_tasks = query.all_tasks

    @completed_tasks = query.get_completed(@all_tasks)
    @to_do = query.get_todo(@all_tasks)

    @id = params[:task].to_i
    query.update_date(@id)

    # Redundancy because the submit button needed to refresh to render an # updated Completed Tasks List to the page
    erb :home
    redirect "/"
  end


end
