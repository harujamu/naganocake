# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
     super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected

    #処理１
  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
    # 処理１終了
    return if !@customer
    # 処理２
    if @customer.valid_password?(params[:customer][:password]) && @customeris_deleted == true
      # 処理３
      
      redirect_to new_customer_registration_path and return
     
      
    end
  end

end

