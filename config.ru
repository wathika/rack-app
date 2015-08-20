class Greeter
  def call(env)
    [200, {}, ["Hello world"]]

  end

end
run Greeter.new
