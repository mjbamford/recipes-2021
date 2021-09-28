require_relative "./_form"

module Views
    module Recipes
        def self.edit(recipe)
            puts "Edit Recipe #{recipe.name}!"
            _form recipe
        end
    end
end
