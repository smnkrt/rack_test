require_relative 'lib/app'
require_relative 'lib/app/items/index'
require_relative 'lib/app/items/create'
require_relative 'lib/app/items/destroy'

app = App.new
app.def_route :get,    '/items', App::Items::Index
app.def_route :post,   '/items', App::Items::Create
# app.def_route :delete, '/items', App::Items::Destroy

app.configure do |c|
  # c.routes[:get]['/items']    = ->(req) { App::Items::Index.call(req) }
  # c.routes[:post]['/items']   = ->(req) { App::Items::Create.call(req) }
  c.routes[:delete]['/items'] = ->(req) { App::Items::Destroy.call(req) }
end

run app
