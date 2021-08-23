require "test_helper"

class ContactTest < ActiveSupport::TestCase
  test "invalid if contact name missing" do
    contact = Contact.new
    contact.valid?
    assert_not contact.errors.empty?
  end

  test "valid when it has all the required fields" do 
    contact = Contact.new(first_name: "Marko", email: "test@mail.com")
    assert_empty contact.errors
  end
end
