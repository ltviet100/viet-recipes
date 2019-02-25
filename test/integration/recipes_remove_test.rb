require 'test_helper'

class RecipesRemoveTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create(chefname: "Le Thanh Viet", email: "vietleuit@gmail.com",
            password: "password", password_confirmation: "password")
    @recipe = @chef.recipes.build(name: "traditional food vietnam", description: "amazing traditional food")
    @recipe.save
  end

  test "successfully delete a recipe" do
    get recipe_path(@recipe)
    assert_template 'recipes/show'
    assert_select "a[href=?]", recipe_path(@recipe), text: "Remove"
    assert_difference 'Recipe.count', -1 do
      delete recipe_path(@recipe)
    end
    assert_redirected_to recipes_path
    assert_not flash.empty?
  end
end
