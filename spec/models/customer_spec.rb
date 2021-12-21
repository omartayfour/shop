require 'rails_helper'
# Match regex

# Has to be string
RSpec.describe Customer, type: :model do
  it 'needs valid phone number' do
    customer = Customer.new(name: 'Omar Tayfour', mobile: '123456', address: 'Tester')
    customer.save
    expect(customer.errors.messages[:mobile]).to eq ['is invalid']
  end

  # it 'needs valid phone number' do
  #   customer = Customer.new(name: 'Omar Tayfour', mobile: '123456', address: 'Tester')
  #   expect(customer).to_not be_valid
  # end

  it 'all valid' do
    customer = Customer.new(name: 'Omar Tayfour', mobile: '01021641302', address: 'Tester')
    customer.save
    expect(customer).to be_valid
  end

  it 'valid phone number format' do
    customer = Customer.new(name: 'Omar Tayfour', mobile: '01521641302', address: 'Tester')
    customer.save
    expect(customer.mobile).to match(/(010|011|012|015)(\d{8})/)
  end

  it 'invalid phone number format' do
    customer = Customer.new(name: 'Omar Tayfour', mobile: '01721641302', address: 'Tester')
    customer.save
    expect(customer.mobile).to_not match(/(010|011|012|015)(\d{8})/)
  end

  it 'needs unique phone number' do
    customer = Customer.new(name: 'Omar Tayfour', mobile: '01021641304', address: 'Tester')
    customer.save
    customer = Customer.new(name: 'Omar Tayfour 2', mobile: '01021641304', address: 'Tester 2')
    customer.save
    expect(customer.errors.messages[:mobile]).to eq ['has already been taken']
  end

  it 'raises error if missing fields' do
    customer = Customer.new(name: 'Omar Tayfour', mobile: '123456', address: '')
    customer.save
    expect(customer.errors.messages[:address]).to eq ["can't be blank"]
  end

  it 'expects strings' do 
    customer = Customer.new(name: 'Omar Tayfour', mobile: '01021641305', address: 'string')
    customer.save
    expect(customer.name).to be_a(String)
    expect(customer.mobile).to be_a(String)
    expect(customer.address).to be_a(String)
  end
end
