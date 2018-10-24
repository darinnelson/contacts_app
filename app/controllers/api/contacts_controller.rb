class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render "index.json.jbuilder"
  end

  def create
    @contact = Contact.new(
      first_name: params["first_name"],
      last_name: params["last_name"],
      email: params["email"]
    )
    render "show.json.jbuilder"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.json.jbuilder" 
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.id = params[:id] || @contact.id
    @contact.first_name = params[:id] || @contact.first_name
    @contact.last_name = params[:id] || @contact.last_name

    if @contact.save
      render "show.json.jbuilder" 
    else 
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def delete
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: {message: "Contact successfully deleted"}
  end
end
