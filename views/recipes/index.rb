require 'tty-table'

module Views
    module Recipes
        def self.index(recipes)
            return puts "No recipes!" if recipes.empty?

            headers = %w[Id Title Difficulty]
            rows = table_rows_for recipes
            table = TTY::Table.new headers, rows
            puts table.render(:ascii)
        end

        def self.table_rows_for(recipes)
            recipes.map do |recipe|
                [recipe.id, recipe.name, recipe.difficulty]
            end
        end
    end
end