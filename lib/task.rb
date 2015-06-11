require 'sqlite3'

module TaskList
  class Task < Database

    def self.validate_input(name)
      raise ArgumentError.new "You must enter a task name" if name == ""
    end

  end
end
