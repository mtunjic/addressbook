require "application_system_test_case"

class IndexTest < ApplicationSystemTestCase
  setup do
    sign_in users(:one)
  end

  test "visiting the index" do
    visit contacts_url
    assert_selector "h5", text: "Contacts"
  end

  test "selecting index by letter" do 
    visit contacts_url
    click_link "G"
    assert_text "bill@microsoft.com"
  end

  test "selecting index menu" do 
    visit contacts_url
    assert_selector ".left-menu a", text: "Bill Gates", count: 1
  end

end
