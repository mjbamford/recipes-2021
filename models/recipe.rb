class Recipe
    attr_reader :id, :name, :difficulty

    RECIPES = [] # self == Recipe
    # What about duplicate ids

    def self.find(id)
        RECIPES.detect { |r| r.id == id.to_i }
    end

    def initialize(name, difficulty = 1)
        @id = RECIPES.length + 1
        @valid = true
        @name = name
        self.difficulty = difficulty
        RECIPES << self
    end

    def difficulty=(difficulty)
        @difficulty = difficulty
        @valid = (1..5) === @difficulty
    end
    
    def name=(name)
        @name = name
        @valid = !(@name.nil? || @name.empty?)
    end

    def valid?
        @valid
    end

    def [](index)
        puts "Instance method: #{index}"
    end

    def self.[](index)
        puts "Class method: #{index}"
    end
end