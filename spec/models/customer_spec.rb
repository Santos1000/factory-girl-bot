require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'Create aCustomer' do
    subject.name = 'barbara'
    subject.email = 'barbara@gmail.com'
    subject.save

    expect(subject.full_name).to eq('Sr. barbara')
  end
end
