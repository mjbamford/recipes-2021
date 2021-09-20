# RESTful endpoints
# 1. index
# 2. show id
# 3. new/create
# 4. edit/update id
# 5. destroy id

require "./models/recipe"
require "./views/recipes/index"
require "./views/recipes/new"
require "./views/recipes/show"

class RecipesController
    def index
        recipes = Recipe::RECIPES
        Views::Recipes.index(recipes)
    end

    def show(id)
        recipe = Recipe.find(id)
        Views::Recipes.show recipe
    end

    def new
        recipe = Recipe.new
        Views::Recipes.new recipe
        # recipe.save!
    end
end
