require "greeter"

use Rack::Reloader, 0
# automatically reloads any required files, everytime we make a request
# (we dont habve to start and reload the rack app everytime we change the greeter class)
# by default its 10sec, changed to 0
#use Rack::Static


run Rack::Cascade.new([Rack::File.new("public"), Greeter])  #passing it an array of multiple rack applications
#instead of instanciating the greeter here instead you just pass in the class as
# a rack application
