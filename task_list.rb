require "sinatra"
require "sinatra/reloader"
require "./lib/database.rb"

class TaskSite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    @title = "Home"
    erb :home
  end

  get "/add_task" do
    @title = "Add Task"
    erb :addtask
  end

end
