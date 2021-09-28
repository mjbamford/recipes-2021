module Views
    module Recipes
        def self._form(recipe)
            begin
                print "Name"
                print "(#{recipe.name})" unless recipe.name.empty?
                print ": "
                name = gets.chomp.strip
                recipe.name = name unless name.empty?

                print "Difficulity"
                print "(#{recipe.difficulty})" unless recipe.difficulty.nil?
                print ": "
                difficulty = gets.chomp.strip
                recipe.difficulty = difficulty unless difficulty.empty?
            end until recipe.valid?
        end
    end
end