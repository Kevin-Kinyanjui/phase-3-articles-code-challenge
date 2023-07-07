require_relative './author.rb'
require_relative './article.rb'

class Magazine
  attr_accessor :name, :category
  @@all = []

  def initialize(name, category)
    @name = name
    @category = category
    @@all << self
  end

  def self.all
    @@all
  end

  def contributors
    Article.all.map do |article|
      article.author if article.magazine == self
    end.compact.uniq
  end  
  
  def self.find_by_name(name)
    @@all.find { |magazine| magazine.name == name }
  end  

  def article_titles
    Article.all.select { |article| article.magazine == self }.map(&:title)
  end

  def contributing_authors
    contribs = Hash.new(0)
    Article.all.map do |article|
      if (article.magazine == self)
        contribs[article.author] += 1
      end
    end
    contribs.select { |author, value| value > 1 }.keys
  end

end

# mag1 = Magazine.new('HarperCollins', 'Books')

# pp mag1.name
# mag1.name = "Harper"
# pp mag1.name

# pp mag1.category
# mag1.category = "Bok"
# pp mag1.category
