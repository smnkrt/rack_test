require 'pry'
require_relative '../resolver'

class App
  module Items
    # nodoc
    class Index < ::App::Resolver
      def call(_req)
        [201, items]
      end

      private

      def items
        DB::Item.all.map(&:attributes)
      end
    end
  end
end
