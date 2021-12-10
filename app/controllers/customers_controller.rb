class CustomersController < ApplicationController
  require 'roo'

  def index
    @customers = Customer.all
  end

  def upload
    @file = params[:file].path

    @xlsx = Roo::Excelx.new(@file)
    @xlsx.each_row_streaming(offset: 1) do |r|
      @user = Customer.new(name: r[0], mobile: r[1], address: r[2])
      if @user.save
        puts "#{@user} saved successfully!"
      else
        puts "#{@user.name} has some sort of error!"
      end
    end
    redirect_to root_path
  end

  def upload_choices
  end

end
