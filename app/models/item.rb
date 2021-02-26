class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_days
  belongs_to :delivery_fee
  belongs_to :region

  with_options presence: true do
    validates :item_name
    validates :image
    validates :description
    validates :category_id
    validates :delivery_fee_id
    validates :condition_id
    validates :region_id
    validates :delivery_days_id
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :user
  end
  validates :category_id, :condition_id, :delivery_days_id, :delivery_fee_id, :region_id, numericality: { other_than: 1 }
  validates :item_name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
