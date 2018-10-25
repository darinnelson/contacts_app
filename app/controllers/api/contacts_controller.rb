class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all.order(:id)
    render "index.json.jbuilder"
  end

  def create
    @contact = Contact.new(
      first_name: params["first_name"],
      middle_name: params["middle_name"],
      last_name: params["last_name"],
      email: params["email"]
    )
    @contact.save
    render "show.json.jbuilder"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.json.jbuilder" 
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.id = params[:id] || @contact.id
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.save
    render "show.json.jbuilder" 
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: {message: "Contact successfully deleted"}
  end
end
