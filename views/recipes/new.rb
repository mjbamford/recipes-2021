require_relative "./_form"

module Views
    module Recipes
        def self.new(recipe)
            puts "New Recipe!"
            _form recipe
        end
    end
end