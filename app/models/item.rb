class Item < ApplicationRecord
  validates_presence_of :name, :price

  has_many :machines

  # def self.average_price
  #    average(SELECT price FROM items.where machine_id: id)
  # end
end
