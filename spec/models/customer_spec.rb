require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name' do
    customer = create(:user) # or create(:customer)
    customer1 = create(:user)
    puts customer.email
    puts customer1.email
    expect(customer.full_name).to start_with("Sr.")
  end

  it '#full_name - sobrescrevendo atributo' do
    customer = create(:customer_vip)
    expect(customer.vip).to be_truthy
  end

  it 'Using the attributes_for' do
    attrs = attributes_for(:customer) # util to create hash
    custom = Customer.create(attrs)
    expect(custom.full_name).to start_with("Sr.")
    puts attrs
  end

  # whem create customer add + 1 in list of customers
  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }

  it 'transitório' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Client male Vip' do
    custom = create(:customer_male_vip)
    expect(custom.gender).to eq('M')
    expect(custom.vip).to eq(true)
  end

  it 'Client male Default' do
    custom = create(:customer_male_default)
    expect(custom.gender).to eq('M')
    expect(custom.vip).to eq(false)
  end

  it 'Client female Vip' do
    custom = create(:customer_female_vip)
    expect(custom.gender).to eq('F')
    expect(custom.vip).to eq(true)
  end

  it 'Client female Default' do
    custom = create(:customer_female_default)
    expect(custom.gender).to eq('F')
    expect(custom.vip).to eq(false)
  end

  it 'Travel_to date' do
    travel_to Time.zone.local(2008, 10, 10, 10, 04, 44) do
      @customer = create(:customer_female_vip)
    end
    puts @customer.created_at
    puts Time.now
    expect(@customer.created_at).to be < Time.new
  end
end
