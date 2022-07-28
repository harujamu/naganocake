class Item < ApplicationRecord
  validates :genre_id, presence:true
  validates :name, presence:true
  validates :introduction, presence:true
  validates :price, presence:true
  validates :is_active, inclusion: { in: [true, false] }
  
  has_one_attached:image
  belongs_to :genre
end
