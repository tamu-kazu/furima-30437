class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name, :text, :price, :category, :status, :charge, :prefecture, :day, :image, presence: true
  validates :category_id, :status_id, :charge_id, :prefecture_id, :day_id, numericality: { other_than: 1 }

  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
