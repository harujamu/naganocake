class CartItem < ApplicationRecord
  validates:item_id,presence:true
  validates:customer_id,presence:true
  validates:amount,presence:true
  
  belongs_to :item
  belongs_to :customer
end
