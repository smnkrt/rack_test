class App
  # nodoc
  class Resolver
    require 'dry-validation'
    
    def self.call(req)
      new.call(req)
    end
  end
end
