# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  before_action :sign_in_params, only: :create
  before_action :load_user, only: :create

  layout 'admin/login'

  # GET /admin/login
  def new
  end

  # POST /admin/login
  def create
    if @user.valid_password?(sign_in_params[:password])
      sign_in(@user)
      redirect_to admin_path
    else
      respond_incorrect_credentials
    end
  end

  # DELETE /admin/logout
  def destroy
    sign_out current_admin_user
    redirect_to new_admin_user_session_path
  end


  private
  def sign_in_params
    params.permit(:login, :password)
  end

  def load_user
    @user = User.find_for_database_authentication(login: sign_in_params[:login])
    if @user
      return @user
    else
      respond_incorrect_credentials
    end
  end

  def respond_incorrect_credentials 
    flash[:error] = 'Incorrect email or password'
    redirect_to new_admin_user_session_path
  end
end