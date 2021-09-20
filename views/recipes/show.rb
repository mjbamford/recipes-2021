require 'tty-table'

module Views
    module Recipes
        def self.show(recipe)
            # What happens if recipe.nil? Need a guard?

            headers = %w[Atrribute Value]
            attrs = attribute_rows_for recipe
            table = TTY::Table.new headers, attrs
            puts table.render :ascii
        end

        def self.attribute_rows_for(recipe)
            rows = []
            rows << ['Id', recipe.id]
            rows << ['Name', recipe.name]
            rows << ['Difficulty', recipe.difficulty]
        end
    end
end