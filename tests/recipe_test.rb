require "./recipe"

def test(description)
    puts description
    puts yield
end

test("Recipe.new 'Toast'") do
    recipe = Recipe.new "Toast"
    "valid? #{recipe.valid?}"
end

test("recipe.difficulty = 666") do
    recipe = Recipe.new "Toast" 
    recipe.difficulty = 666
    "valid? #{recipe.valid?}"
end

test "recipe.name = ''" do
    recipe = Recipe.new "Toast" 
    recipe.name = ''
    "valid? #{recipe.valid?}"
end