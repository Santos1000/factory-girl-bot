require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'as a Guest' do
    context '#index' do
      it 'responds a 200 response' do
        get :index
        # puts response.inspect
        expect(response).to have_http_status(200)
      end

      it 'responds a 302 response, not authorized' do
        customer = create(:customer)
        get :show, params: { id: customer.id }
        # puts response.inspect
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'as Logged Member' do
    it 'with valid attributes' do
      customer_params = attributes_for(:customer)
      p customer_params
    end

    it '#show' do
      member = create(:member)
      customer = create(:customer)

      sign_in member

      get :show, params: { id: customer.id }
      expect(response).to have_http_status(200)
    end
    # it 'Render a Show template' do
    #   member = create(:member)
    #   customer = create(:customer)

    #   sign_in member

    #   get :show, params: { id: customer.id }
    #   expect(response).to render_template(:show)
    # end
  end
end
