require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with Description, Price and Category' do
    product = create(:product)
    expect(product).to be_valid
  end

  context 'Validates' do
    # use 'should' or 'is_expected.to', they are the same in Shoulda Matchers
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:description) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:category) }
  end

  context 'Instance Methods' do
    it '#full_description' do
      product = create(:product)
      product.valid?
      expect(product.full_description).to eq("#{product.description} - #{product.price}")
    end
  end
end
