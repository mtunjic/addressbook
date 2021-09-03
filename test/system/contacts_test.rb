require "application_system_test_case"

class ContactsTest < ApplicationSystemTestCase
  setup do
    sign_in users(:one)
    @contact = contacts(:one)
    @contact2 = contacts(:two)
  end

  test "visiting the index" do
    visit contacts_url
    assert_selector "h5", text: "Contacts"
  end

  test "creating a Contact" do
    visit contacts_url
    click_on "New Contact"

    fill_in "Chat", with: @contact.chat
    fill_in "Company", with: @contact.company
    fill_in "Email", with: @contact.email
    fill_in "First name", with: @contact.first_name
    fill_in "Job title", with: @contact.job_title
    fill_in "Last name", with: @contact.last_name
    fill_in "Notes", with: @contact.notes
    fill_in "Website", with: @contact.website
    click_on "Create Contact"

    assert_text "Contact was successfully created"
    click_on "Cancel"
  end

  test "updating a Contact" do
    visit contact_url(@contact)
    click_on "Edit", match: :first

    fill_in "Chat", with: @contact.chat
    fill_in "Company", with: @contact.company
    fill_in "Email", with: @contact.email
    fill_in "First name", with: @contact.first_name
    select   "Family", from: 'contact_group_id'
    fill_in "Job title", with: @contact.job_title
    fill_in "Last name", with: @contact.last_name
    fill_in "Notes", with: @contact.notes
    fill_in "Website", with: @contact.website
    click_on "Update Contact"

    assert_text "Contact was successfully updated"
    click_on "Cancel"
  end

  test "destroying a Contact" do
    visit contact_url(@contact)
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Contact has been deleted."
  end
end
