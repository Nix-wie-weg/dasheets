module Dasheets
  module DSL
    class Entry < Base
      define_list_attrs :command
      define_markdown_attrs :name, :notes
    end
  end
end
