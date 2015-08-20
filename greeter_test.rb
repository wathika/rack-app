require "rubygems"
require "rack"
require "minitest/autorun"
require File.expand_path("../lib/greeter", __FILE__)

describe Greeter do
  before do
    @request = Rack::MockRequest.new(Greeter)
  end

  it "returns a 404 response for unknown requests" do
    @request.get("/unknown").status.must_equal 404
  end

  it "/ displays Hello world by default" do
    @request.get("/").body.must_include "Hello world!"
  end

  it "/ displays the name passed into the cookie" do
    @request.get("/", "HTTP_cookie" => "greet=Ruby").body.must_include "Hello Ruby!"
  end

  it "/chages set cookie and redirecst to root" do
    responce = @request.post("/change", params: {"name" => "Ruby"})
    responce.status.must_equal 302
    response["location"].must_equal "/"
    responce["set-Cookie"].must_include "greet=Ruby"
  end
end
