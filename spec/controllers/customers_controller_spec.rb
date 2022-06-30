require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it 'responds sucessfully' do
    get :index
    # puts response.inspect
    expect(response).to be_success
  end
end
