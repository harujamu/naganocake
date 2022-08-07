class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
  end

  def unsubscribe
    @customer = current_customer
  end
  
  def update_unsubscribe
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to root_path
    end
  end
  
  private
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end


end
