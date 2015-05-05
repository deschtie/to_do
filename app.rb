require("sinatra")
#require("sinatra/reloader")
#also_reload("lib/**/*.rb")
require("./lib/task")

set :bind, '0.0.0.0'
set :port, '3000'
#needed for nitrous.io to work

get("/") do
  @tasks = Task.all()
  erb(:index)
end

post("/tasks") do
  description = params.fetch("description")
  task = Task.new(description)
  task.save()
  erb(:success)
end