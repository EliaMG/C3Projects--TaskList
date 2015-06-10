require "sinatra"
require "sinatra/reloader"
require "./lib/database.rb"

class TaskSite < Sinatra::Base
  register Sinatra::Reloader

end
