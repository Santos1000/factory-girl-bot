require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Belongs_to' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Possui 3 pedidos - Create_list' do
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end

  it 'Has_many' do
    customer = create(:customer, :with_orders)
    # print customer.orders.inspect
    # puts customer.inspect
    expect(customer.orders.count).to eq(3)
  end
end
