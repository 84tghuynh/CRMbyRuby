class Customer < ApplicationRecord
  validates :fullname, :phonenumber, presence: true
end
