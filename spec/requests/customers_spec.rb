require 'rails_helper'

# Check requests and test them!

RSpec.describe "Customers", type: :request do
  describe "GET /index" do
    it 'renders index template' do
      get '/'
      expect(response).to render_template(:index)
    end
  end
end
