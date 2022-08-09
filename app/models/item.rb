class Item < ApplicationRecord
  validates :genre_id, presence:true
  validates :name, presence:true
  validates :introduction, presence:true
  validates :price, presence:true
  validates :is_active, inclusion: { in: [true, false] }
  
  has_one_attached:image
  
  def get_image(width,height)
    image.variant(resize_to_limit:[width,height]).processed
  end
  
  def with_tax_price
    (price*1.1).round
  end
  
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details
end
