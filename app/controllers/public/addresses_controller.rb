class Public:: AddressesController < ApplicationController
  
  def index
   
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
  end

  def update
  end
  
  def destroy
    @address = Address.find(params[:id])
  end
  
  private
  
  def address_params
    params.require(:address).permit(:name,:postal_code,:address)
  end
  
end
