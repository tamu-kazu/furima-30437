class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to :user
  has_one :purchase
  has_one_attached :image

validates :name, :text, :price, :genre, presence: true
validates :genre_id, numericality: { other_than: 1 } 
end