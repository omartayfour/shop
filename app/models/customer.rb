class Customer < ApplicationRecord
  validates :mobile, uniqueness: true, presence: true, format: { with: /(010|011|012|015)(\d{8})/ }
  validates :name, presence: true
  validates :address, presence: true
end