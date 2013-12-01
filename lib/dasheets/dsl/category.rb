module Dasheets
  module DSL
    class Category < Base
      attr_reader :entries
      define_attrs :id

      def initialize(&block)
        @entries = []
        super(&block)
      end
      def entry(&block)
        @entries << Dasheets::DSL::Entry.new(&block)
      end
    end
  end
end
