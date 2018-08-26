require 'json'
require_relative 'db/initializer'
require_relative 'db/item'
require_relative 'config'
require_relative 'router'

# nodoc
class App
  def initialize
    DB::Initializer.new.call
  end

  def configure
    Config.configure { |c| yield(c) }
  end

  def def_route(method, path, resolver_class)
    configure do |c|
      c.routes[method][path] = ->(req) { resolver_class.call(req) }
    end
  end

  def call(env)
    status, body = process(env)
    [status, headers, [body.to_json]]
  end

  private

  def process(env)
    req = Rack::Request.new(env)
    Router.new(req, Config)
          .resolver_for
          .call(req)
  end

  def headers
    { 'Content-Type' => 'application/json' }
  end
end
