require_relative '../resolver'

class App
  module Items
    # nodoc
    class Destroy < ::App::Resolver
      def call(req)
        return [422, errors(req)] unless errors(req).empty?
        result = DB::Item.fetch_by_id(req.params['id']).destroy
        [200, { removed: result }]
      end

      private

      def errors(req)
        @errors ||= schema.call(req.params).messages
      end

      def schema
        Dry::Validation.Schema { required('id').filled }
      end
    end
  end
end
