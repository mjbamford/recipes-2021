require 'minitest/autorun'
require './models/recipe'

# describe "Initial run" do
#     it "should work" do
#         expect(1).must_equal 1
#     end

#     it "should skip" do
#         skip "no test here"
#     end

#     it "should fail" do
#         expect(1).wont_equal 2
#     end
# end

describe "Recipe" do
    def valid_attrs
        { name: "Cake", difficulty: 1 }
    end

    describe "when first created" do
        it "is invalid" do
            recipe = Recipe.new
            expect(recipe.valid?).must_equal false
        end
    end

    describe "with valid difficulty" do
        it "is valid" do
            recipe = Recipe.new name: "Cake", difficulty: 1 
            expect(recipe.valid?).must_equal true
        end
    end

    describe "#id" do
        it "should be nil when first created" do
            recipe = Recipe.new
            expect(recipe.id).must_be_nil
            recipe.save
            expect(recipe.id).wont_be_nil
        end

        it "should not changed for a persisted recipe" do
            recipe = Recipe.new
            recipe.save
            expected_id = recipe.id
            expect(expected_id).wont_be_nil
            recipe.save
            expect(recipe.id).must_equal expected_id
        end
    end

    describe "#difficulty" do
        it "should be invalid" do
            recipe = Recipe.new
            recipe.difficulty = 666
            expect(recipe.valid?).must_equal false
        end

        it "should have an error message" do
            recipe = Recipe.new
            recipe.difficulty = 666
            expect(recipe.errors).wont_be_empty
        end

        it "should be updateable" do
            recipe = Recipe.new difficulty: 1
            expect(recipe.difficulty).must_equal 1
            recipe.difficulty = 4
            expect(recipe.difficulty).must_equal 4
        end
    end

    describe "#name" do
        it "should be invalid" do
            recipe = Recipe.new
            recipe.name = nil
            expect(recipe.valid?).must_equal false
        end
    end

    it "should be invalid when any invalid attribute" do
        recipe = Recipe.new
        recipe.difficulty = 666
        recipe.name = "Cake"
        expect(recipe.valid?).must_equal false
    end
end