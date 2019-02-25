require 'test_helper'
class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "Le Thanh Viet", email: "vietleuit@gmail.com")
  end

  test "chef should be valid" do
    assert @chef.valid?
  end

  test "chefname should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end

  test "chefname shouldn't be less than 30 characters" do
    @chef.chefname = "a" * 31
    assert_not @chef.valid?
  end

  test "email shouldn't be too long" do
    @chef.email = "a" * 245 + "@example.com"
    assert_not @chef.valid?
  end

  test "email should be accept correct format" do
    valid_emails = %w[user@example.com VIETLT@gmail.com V.first@yahoo.vn viet+lt@vn.org]
    valid_emails.each do |email|
      @chef.email = email
      assert @chef.valid?, "#{email.inspect} should be valid"
    end
  end

  test "should inject invalid email" do
    invalid_emails = %w[vietlt@example vietlt@example,com vietlt.name@gmail. joe@bar+foo.com]
    invalid_emails.each do |invalids|
      @chef.email = invalids
      assert_not @chef.valid?, "#{invalids.inspect} should be invalid"
    end
  end

  test "email should be unique and case insensitive" do
    other_chef = @chef.dup
    other_chef.email = @chef.email.upcase
    @chef.save
    assert_not other_chef.valid?
  end

  test "email should be lower case before hitting db" do
    mixed_email = "viEtLt@Gmail.coM"
    @chef.email = mixed_email
    @chef.save
    assert_equal mixed_email.downcase, @chef.reload.email
  end
end
