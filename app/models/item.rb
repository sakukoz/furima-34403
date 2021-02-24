class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_days
  belongs_to :delivery_fee
  belongs_to :region


  validates :item_name, :description,:category_id,:condition_id, :delivery_fee_id, :region_id, :delivery_days_id, :price, :user, presence: true
  validates :genre_id, numericality: { other_than: 1 } 

end
