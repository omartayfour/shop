class CustomersController < ApplicationController
  require 'roo'
  def index
    @customers = Customer.all
  end

  def upload
    @xlsx = Roo::Excelx.new(Rails.root.join('app', 'views', 'customers' , 'spreadsheet.xlsx'))
    @xlsx.each_row_streaming(offset: 1) do |r|
      @user = Customer.new(name: r[0], mobile: r[1], address: r[2])
      if @user.save
        puts "#{@user} saved successfully!"
      end
    end
  end

  def upload_choices
    
  end



  private


end
