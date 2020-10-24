class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :order_id, :user_id, :item_id, :token

 with_options presence: true do
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id
  validates :municipality
  validates :address
  validates :phone_number, format: { with: /\A\d{11}\z/ }
 end

 def save
  order = Order.create(item_id: item_id, user_id: user_id)
  Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
end

end