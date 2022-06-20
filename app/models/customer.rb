class Customer < ApplicationRecord
  validates :name, presence: true
  def full_name
    "Sr. #{name}"
  end
end
