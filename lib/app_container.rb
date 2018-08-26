require_relative 'config'
require 'dry-container'
require 'dry-auto_inject'

# nodoc
class AppContainer
  extend Dry::Container::Mixin
  register('config') { Config }
end
