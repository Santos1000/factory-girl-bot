require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  describe ' Json ' do
    it 'JSON: schema' do
      get '/customers/1.json'
      expect(response).to match_json_schema('customer') # look at spec/support/api/schemas/location.json
    end

    it 'SHOW: JSON simple rspec' do
      get '/customers/1.json'
      response_body = JSON.parse(response.body)
      expect(response_body.fetch('id')).to eq(1)
      espect(response_body.fetch('name')).to be_kind_of(String)
      espect(response_body.fetch('email')).to be_kind_of(String)
    end
  end

  describe 'GET /customers' do
    it 'works! 200 ok' do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it 'INDEX: JSON 200 ' do
      get '/customers.json'
      expect(response.body).to include_json([
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String)
      ])
    end

    it 'SHOW: JSON ' do
      get '/customers/1.json'
      expect(response.body).to include_json(
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String)
      )
    end
  end

  describe 'POST /customers' do
    it 'CREATE: JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { 'ACCEPT' => 'application/json' }
      customers_params = attributes_for(:customer)

      post '/customers', params: { customer: customers_params }, headers: headers
      expect(response.body).to include_json(
        id: /\d/,
        name: customers_params[:name],
        email: customers_params.fetch(:email)
      )
    end
  end

  it 'UPDATE: JSON' do
    member = create(:member)
    login_as(member, scope: :member)

    headers = { 'ACCEPT' => 'application/json'}

    customers = Customer.first
    customers.name += ' - ATUALIZADO'

    patch "/customers/#{customers.id}.json", params: { customer: customers.attributes}, headers: headers

    expect(response.body).to include_json(
      id: /\d/,
      name: customers.name,
      email: customers.email
    )
  end

  it 'DESTROY: JSON' do
    member = create(:member)
    login_as(member, scope: :member)

    headers = { 'ACCEPT' => 'application/json'}

    customers = Customer.first

    expect{ delete "/customers/#{customers.id}.json", headers: headers }.to change(Customer, :count).by(-1)
    expect(response).to have_http_status(204)
  end
end
