class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]
  before_action :set_contact_index


  def index
    #TODO: 
    # 1 authorize @contact, :index?
    # 2 move to single rest action and serach 
    if params[:letter]
      @contacts = current_user
        .contacts.includes(:phones)
        .by_letter(params[:letter])
        .page(params[:page]).per(9)
    else
      @contacts = current_user.contacts.includes(:phones)
                              .page(params[:page]).per(9)
    end
  end


  def show
  end


  def new
    @contact = current_user.contacts.new
  end

 
  def edit
  end

 
  def create
    @contact = current_user.contacts.new(contact_params)

    if @contact.save
      flash[:notice] = "Contact was successfully created."
      redirect_to @contact
    else
      flash.now[:alert] = "Contact has not been updated."
      render "new"
    end
  end


  def update
    byebug
    if @contact.update(contact_params)
      flash[:notice] = "Contact was successfully updated."
      redirect_to @contact
    else 
      flash.now[:alert] = "Contact has not been updated."
      render "edit"
    end
  end


  def destroy
    @contact.destroy
    flash[:notice] = "Contact has been deleted."
    redirect_to contacts_path
  end

  def import
    Contact.import_csv(params[:file])
    redirect_to root_url, notice: "Contacts imported."
  rescue
    flash[:alert] = "Unable to import contacts."
    redirect_to contacts_path
  end

  private
    def set_contact
      @contact = current_user.contacts.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The contact you were looking for could not be found."
      redirect_to contacts_path
    end

    def set_contact_index
      @contacts_index ||= current_user.contacts.alphabetical
      @contacts_count ||= current_user.contacts.count
    end
 
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :company,
            :job_title, :birthdate, :chat, :website, :notes, :group_id, :avatar_image,
            phones_attributes: [:_destroy, :id, :number, :type],
            addresses_attributes: [:_destroy, :id, :zip_code, :street, :city, :state])
    end
end
