class Dasheets::DSL::Cheatsheet
  attr_reader :categories
  def initialize(&block)
    @categories = []
    instance_eval(&block)
  end

  def category(&block)
    @categories << Dasheets::DSL::Category.new(&block)
  end

  def title(t = nil)
    @title = t if t
    @title
  end
  def short_name(s = nil)
    @short_name = s if s
    @short_name
  end
  def introduction(i = nil)
    @introduction = Minidown.parse(i).to_html if i
    @introduction
  end
  def notes(n = nil)
    @notes = Minidown.parse(n).to_html if n
    @notes
  end
end
