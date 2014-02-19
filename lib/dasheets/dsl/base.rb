require 'minidown'
require 'sanitize'

module Dasheets
  module DSL
    class Base
      def initialize(&block)
        instance_eval(&block)
      end
      private

      def parse_markdown(str)
        Minidown.parse(i).to_html
      end

      def self.define_attrs(*names)
        names.each do |name|
          define_method(name) do |val = nil|
            instance_variable_set("@#{name}", val) if val
            instance_variable_get("@#{name}")
          end
        end
      end
      def self.define_list_attrs(*names)
        names.each do |name|
          define_method(name) do |val = nil|
            if val
              array = instance_variable_get("@#{name}")
              if !array
                instance_variable_set("@#{name}", [val])
              else
                instance_variable_set("@#{name}", array << val)
              end
            end
            instance_variable_get("@#{name}")
          end
        end
      end
      def self.define_markdown_attrs(*names)
        names.each do |name|
          define_method(name) do |val = nil|
            if val
              val = Minidown.parse(val).to_html
              instance_variable_set("@#{name}", val)
            end
            instance_variable_get("@#{name}")
          end
          define_method("tags_stripped_#{name}") do
            Sanitize.clean(send(name))
          end
        end
      end
    end
  end
end
