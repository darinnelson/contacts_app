class Api::UsersController < ApplicationController

  def index
    @users = User.all.order(:id)
    render "index.json.jbuilder"
  end

  def create
    @user = User.new(
      name: params["name"],
      email: params["email"],
      password: params["password"],
      password_confirmation: params["password_confirmation"]
    )

    if @user.save
      render json: {message: "User successfully create"}, status: :created
    else
      render json: {errors: user.errors.full_message}, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params["name"] || @user.name
    @user.email = params["email"] || @user.email
    @user.password = params["password"] || @user.password
    @user.password_confirmation = params["password_confirmation"] || @user.password_confirmation

    if @user.save
      render json: {message: "  user successfully updated"}, status: :updated
    else
      render json: {errors: @User.errors.full_message}, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json: {message: "User successfully delete"}
  end
end
