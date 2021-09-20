module Views
    module Recipes
        def self.new(recipe)
            puts "New Recipe!"
            print "Name: "
            recipe.name = gets.chomp.strip
            print "Difficulity: "
            recipe.difficulty = gets.chomp.strip
        end
    end
end