class Public:: AddressesController < ApplicationController
  
  def index
    addresses = Address.all
    @ones_addresses = @customer.addresses
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
  end

  def update
  end
  
  def destroy
  end
  
  private
  
  def address_params
    params.require(:address).permit(:name,:postal_code,:address)
  end
  
end
