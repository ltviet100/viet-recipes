require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create(chefname: "vietlt", email: "vietleuit@gmail.com",
            password: "password", password_confirmation: "password")
  end

 test "reject an invalid edit" do
  get edit_chef_path(@chef)
  assert_template 'chefs/edit'
  patch chef_path(@chef), params: { chef: { chefname: " ",
                            email: "vietlt@example.com" } }
  assert_template 'chefs/edit'
  assert_select 'h2.panel-title'
  assert_select 'div.panel-body'
end

test "accept valid signup" do
  get edit_chef_path(@chef)
  assert_template 'chefs/edit'
  patch chef_path(@chef), params: { chef: { chefname: "vietlt1",
                              email: "vietlt1@example.com" } }
  assert_redirected_to @chef
  assert_not flash.empty?
  @chef.reload
  assert_match "vietlt1", @chef.chefname
  assert_match "vietlt1@example.com", @chef.email
end
end
