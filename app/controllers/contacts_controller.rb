class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]
  
  def index
    #TODO: 
    # 1 authorize @contact, :index?
    @contacts = current_user.contacts.includes(:phones)
                            .page(params[:page]).per(9)
 
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

  def search
    @contacts = current_user.contacts.includes(:phones)
      .search(params[:query])
      .page(params[:page]).per(9)


      render turbo_stream: turbo_stream.replace(
        'contacts',
        partial: ' contacts ',
        locals: {
          contacts:  @contacts 
        }
      )  
    #render "index"
  end
  


  private
    def set_contact
      @contact = current_user.contacts.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The contact you were looking for could not be found."
      redirect_to contacts_path
    end
 
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :company,
            :job_title, :birthdate, :chat, :website, :notes, :group_id, :avatar_image,
            phones_attributes: [:_destroy, :id, :number, :type],
            addresses_attributes: [:_destroy, :id, :zip_code, :street, :city, :state])
    end
end
