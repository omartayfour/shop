# frozen_string_literal: false

# class CustomersController
class CustomersController < ApplicationController
  def index
    @customers = Customer.paginate(page: params[:page], per_page: 5)
  end

  def upload
    @file = params[:file].path
    UploadJob.perform_now(@file)
    flash[:notice] = "If any unique customers were found in the excel sheet provided, they've been added"
    redirect_to root_path
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      flash[:notice] = 'Successfully updated customer'
      redirect_to root_path
    else
      flash[:alert] = 'An error occured, please make sure of all fields!'
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    flash[:notice] = 'Successfully deleted customer'
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :mobile, :address)
  end
end
