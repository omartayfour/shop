class Customer < ApplicationRecord
  validates :mobile, uniqueness: true, presence: true, format: { with: /(010|011|012|015)(\d{8})/ }
  validates :name, presence: true
  validates :address, presence: true
  # localhost:3000/api/v1/customers API controller to send JSON data
  # update edit delete
end
