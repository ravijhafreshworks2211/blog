require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "shoud be nvalid if email is not unique" do
    user = User.new(email:"abc@gmail.com",password:"password")
    user2 = User.new(email:"abc@gmail.com",password:"password")
    assert user.save
    assert !user2.save
  end

  
end
