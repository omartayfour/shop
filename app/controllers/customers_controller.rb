# frozen_string_literal: false

# class CustomersController
class CustomersController < ApplicationController
  def index
    @customers = Customer.paginate(page: params[:page], per_page: 5)
  end

  def upload
    @file = params[:file].path
    UploadJob.perform_now(@file)
    redirect_to root_path
  end
end
