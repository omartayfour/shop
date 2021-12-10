class Customer < ApplicationRecord
    validates :mobile , uniqueness: true
end
