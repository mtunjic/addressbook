require "test_helper"

class ImportControllerTest < ActionDispatch::IntegrationTest

  setup do
    @file = fixture_file_upload('contact.csv')
    sign_in users(:one)
    # @contact1 = contacts(:one)
    # @contact2 = contacts(:two)
    # @group = groups(:one)
  end

  test "should get index" do
    get import_index_url
    assert_response :success
  end

  test 'should import contacts from csv' do

    assert_difference('Contact.count', 2) do
      post csv_import_index_url, params: { file: @file } 
    end

    assert_redirected_to contacts_url
  end
end
