require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create(chefname: "Le Thanh Viet", email: "vietleuit@gmail.com")
    @recipe = @chef.recipes.build(name: "traditional food vietnam", description: "amazing traditional food")
    @recipe.save
    @recipe2 = Recipe.create(name: "vegetable of asian", description: "some description for vegetable", chef: @chef)
  end

  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end

  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end
end
