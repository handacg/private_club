require 'test_helper'

class UserTest < ActiveSupport::TestCase
 def setup
    @user = User.new(first_name: "first_name", last_name:"last_name", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

test "first_name should not be too long" do
    @user.first_name = "a" * 51
    assert_not @user.valid?
  end

test "last_name should not be too long" do
    @user.last_name = "a" * 51
    assert_not @user.valid?
  end

 test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end