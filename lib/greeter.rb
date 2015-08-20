require "erb"

class Greeter
  def call(env)
    #[200, {"Content-Type" => "text/plain"}, ["Hello rack"]]
    #Rack::Response.new("Hello")
    @request = Rack::Request.new(env)
    case @request.path #to access the url path that the user typed in  to access this page
    when "/" then Rack::Response.new(render("index.html.erb"))
    when "/change" #setting a cookie and redirecting back to the root homepage
       Rack::Response.new do |response|
         response.set_cookie("greet", @request.params["name"])
         response.redirect("/")
       end
    else Rack::Response.new("Not Found", 404)
    end
  end
def render(template)
  path = File.expand_path("../views/#{template}", __FILE__)
  ERB.new(File.read(path)).result(binding)
end

def greet_name  #setting it to the value of the cookie
  @request.cookies["greet"] || "world"

end

end
