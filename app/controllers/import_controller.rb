class ImportController < ApplicationController

  def show 
  end 

  def index 
  end 

  def csv 
    byebug
    Contact.from_csv(params[:file])
    redirect_to root_url, notice: "Contacts imported."
  rescue
    flash[:alert] = "Unable to import contacts."
    redirect_to import_index_path
  end
end
