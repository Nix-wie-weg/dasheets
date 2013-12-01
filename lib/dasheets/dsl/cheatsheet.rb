module Dasheets
  module DSL
    class Cheatsheet < Base
      attr_reader :categories
      define_attrs :title, :short_name
      define_markdown_attrs :introduction, :notes

      def initialize(&block)
        @categories = []
        super(&block)
      end

      def category(&block)
        @categories << Dasheets::DSL::Category.new(&block)
      end
    end
  end
end
