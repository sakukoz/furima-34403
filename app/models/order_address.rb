class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :city, :postcode, :region_id, :city, :street, :building, :phone
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street
    validates :phone, numericality: { only_integer: true , },length: { is: 11 }
  end
    validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, region_id: region_id, city: city, street: street, building: building, phone: phone, order_id: order.id)
  end
end