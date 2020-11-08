class Customer < ApplicationRecord
  validates :fullname, :phonenumber, presence: true
  has_one_attached :image
end
