class OrderDetail < ApplicationRecord
  
  belongs_to :item
  belongs_to :order
  
  enum production_status: { cannot_start: 0, waiting_for_production: 1, production: 2, production_completed: 3 }
end
