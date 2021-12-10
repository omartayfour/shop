class Customer < ApplicationRecord
    validates :mobile , uniqueness: true
    validates :name, presence: true
    validates :address, presence: true
end
