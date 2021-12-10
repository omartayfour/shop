class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def upload
    
  end



  private


end
