class Greeter
  def call(env)
    #[200, {"Content-Type" => "text/plain"}, ["Hello rack"]]
    Rack::Response.new("Hello")
  end

end
