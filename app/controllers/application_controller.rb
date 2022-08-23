class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :telephone_number, :address])
  end

  def after_sign_out_path_for(resource)
    
     case resource
    when :admin
      admin_path
    when :customer
      root_path
    end
  end
  
  # def after_sign_out_path_for(resource_or_scope)
    # if resource_or_scope == :admin
      # new_admin_session_path
    # else
      # root_path
    # end
  # end  
end
