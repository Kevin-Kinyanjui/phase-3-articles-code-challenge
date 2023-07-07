require_relative './article.rb'
require_relative './magazine.rb'

class Author
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def articles
    Article.all.select do |article|
      article.author == self
    end
  end

  def magazines
    mag_inst = articles.map do |article|
      article.magazine
    end
    mag_inst.uniq
  end

  def add_article(title, magazine)
    Article.new(title, self, magazine)
  end

  def topic_areas
    magazines.map do |magazine|
      magazine.category
    end.uniq
  end

end

# kevin = Author.new('Kevin')
# pp kevin.name
