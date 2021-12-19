# frozen_string_literal: false

# Class UploadJob
class UploadJob < ApplicationJob
  require 'roo'
  queue_as :default

  def perform(file)
    @xlsx = Roo::Excelx.new(file)
    @xlsx.each_row_streaming(offset: 1) do |r|
      @user = Customer.new(name: r[0], mobile: "0#{r[1]}", address: r[2])
      if @user.save
        puts "#{@user} saved successfully!"
      else
        puts "#{@user.name} has some sort of error!"
      end
    end
  end
end
