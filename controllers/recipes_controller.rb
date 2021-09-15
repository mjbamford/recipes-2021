# RESTful endpoints
# 1. index
# 2. show id
# 3. new/create
# 4. edit/update id
# 5. destroy id

require "./models/recipe"

class RecipesController
    def index
        puts Recipe::RECIPES.inspect
    end

    def show(id)
        recipe = Recipe.find(id)
        puts recipe.inspect
    end

    def new(params)
        Recipe.new *params
    end
end