class Customer < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  has_many :orders

  def full_name
    "Sr. #{name}"
  end
end
