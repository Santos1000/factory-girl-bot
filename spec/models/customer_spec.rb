require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name' do
    customer = create(:user) # or create(:customer)
    expect(customer.full_name).to start_with("Sr.")
  end

  it '#full_name - sobrescrevendo atributo' do
    customer = create(:customer_vip)
    expect(customer.vip).to be_truthy
  end

  # whem create customer add + 1 in list of customers
  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }
end
