require "application_system_test_case"

class SearchTest < ApplicationSystemTestCase
  setup do
    sign_in users(:one)
  end

  test "search contact" do
    visit contacts_url
    fill_in "letter", with: "G"
    find_field("letter").native.send_keys(:return)
    assert_text "bill@microsoft.com"
  end

end
