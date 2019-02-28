require 'test_helper'

class ChefsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create(chefname: "vietlt", email: "vietleuit@gmail.com",
            password: "password", password_confirmation: "password")
  end
  test "should delete chef" do
    get chefs_path
    assert_template 'chefs/index'
    assert_difference 'Chef.count', -1 do
      delete chef_path(@chef)
    end
    assert_redirected_to chefs_path
    assert_not flash.empty?
  end
end
