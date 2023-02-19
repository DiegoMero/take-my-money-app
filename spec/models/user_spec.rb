require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(name: 'David', email: 'test@example.com', password: 'password')
  end

  it 'name should be present' do
    @user.name = 'David'
    expect(@user).to be_valid
  end

  describe 'associations' do
    it 'has many groups' do
      association = described_class.reflect_on_association(:groups)
      expect(association.macro).to eq :has_many
    end

    it 'has many investments' do
      association = described_class.reflect_on_association(:investments)
      expect(association.macro).to eq :has_many
    end
  end
end
