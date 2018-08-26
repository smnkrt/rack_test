require_relative '../resolver'

class App
  module Items
    # nodoc
    class Create < ::App::Resolver
      def call(req)
        return [422, errors(req)] unless errors(req).empty?
        data = DB::Item.create(name: req.params['name'])
        [201, { id: data.id, name: data.name }]
      end

      private

      def errors(req)
        @errors ||= schema.call(req.params).messages
      end

      def schema
        Dry::Validation.Schema { required('name').filled(:str?) }
      end
    end
  end
end
