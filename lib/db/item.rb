class DB
  class Item < ActiveRecord::Base
    class NilItem
      def destroy; :none; end
    end
    private_constant :NilItem

    def self.fetch_by_id(id)
      find_by(id: id) || NilItem.new
    end
  end
end
