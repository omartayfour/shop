module Api
  module V1
    class CustomersController < ApplicationController

      def index
        customers = Customer.paginate(page: params[:page], per_page: 2)

        render json: customers, meta: pagination_dict(customers)
      end

      def show
        @customer = Customer.find(params[:id])

        render json: { status: 'SUCCESS', message: 'Loaded customer', data: @customer }, status: :ok
      end

      private

      def customer_params
        params.require(:customer).permit(:name, :mobile, :address)
      end

      def pagination_dict(collection)
        {
          current_page: collection.current_page,
          next_page: collection.next_page,
          previous_page: collection.previous_page, # use collection.previous_page when using will_paginate
          total_pages: collection.total_pages,
          total_entries: collection.total_entries
        }
      end
    end
  end
end
