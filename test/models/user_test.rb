require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "shoud normalize email" do
    user = users(:one)
    user.email = "FOO@mail.com"

    user.send(:downcase_email)
   
    expected = "foo@mail.com"
    actual = user.email
    assert_equal(expected, actual)
  end
end
