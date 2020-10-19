class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  belongs_to :user
  has_one :purchase
  has_one_attached :image

validates :name, :text, :price, :category, :status, :charge, :prefecture, :day, presence: true
validates :category_id, :status_id, :charge_id, :prefecture_id, :day_id, numericality: { other_than: 1 } 
end