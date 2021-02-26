class OrderAddress
  include ActiveModel::Model
  attr_accessor :item, :user, :city, :order, :postcode, :region_id, :city, :street, :building, :phone
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :order
    validates :postcode
    validates :region_id, numericality: { other_than: 1 }
    validates :city
    validates :street
    validates :phone
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, region: region, city: city, street: street, building: building, phone: phone, order_id: order_id)
  end
end