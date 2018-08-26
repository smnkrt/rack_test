# nodoc
class DB
  require 'sqlite3'
  require 'active_record'

  # nodoc
  class Initializer
    # TODO: inject config here
    def call
      base_setup
      schema_setup
    end

    private

    def base_setup
      ActiveRecord::Base.logger = Logger.new(STDOUT)
      ActiveRecord::Base.establish_connection(adapter:  'sqlite3',
                                              database: 'db')
    end

    def schema_setup
      return if ActiveRecord::Schema.data_source_exists? :items
      ActiveRecord::Schema.define do
        create_table :items, force: true do |t|
          t.string :name
          t.timestamps
        end
      end
    end
  end
end
