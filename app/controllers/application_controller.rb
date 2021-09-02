class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_contact_index

  def set_contact_index
    if current_user
      @contacts_index ||= current_user.contacts.alphabetical
      @contacts_count ||= current_user.contacts.count
    end 
  end
end
