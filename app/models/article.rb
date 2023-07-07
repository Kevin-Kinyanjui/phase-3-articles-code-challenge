require_relative './author.rb'
require_relative './magazine.rb'

class Article
    attr_reader :title, :author, :magazine
    @@all = []

    def initialize(title, author, magazine)
        @title = title
        @author = author
        @magazine = magazine
        @@all << self
    end

    def self.all
        @@all
    end

end

# auth1 = Author.new('Kevin')
# mag1 = Magazine.new('HarperCollins', 'Books')
# art1 = Article.new("SuperCars", auth1, mag1)

# pp art1.title
# pp Article.all
# pp art1.author
# pp art1.magazine

