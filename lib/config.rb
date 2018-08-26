# nodoc
class Config
  require 'dry-configurable'
  extend Dry::Configurable

  setting :routes, { get: {}, post: {}, delete: {} }.freeze, reader: true
  setting :not_found_resolver, ->(_r) { [404, '{}'] }, reader: true
end
