require 'rails_helper'

RSpec.describe Investment, type: :model do
  before do
    @user = User.create(name: 'David', email: 'test@example.com', password: 'password')
    @group = Group.create(name: 'Facebook', icon: 'Icon', author: @user)
    @investment = Investment.new(name: 'Transaction #50', amount: 10, author: @user)
    @investment.groups << @group
    @investment.save
  end

  it 'name should be present' do
    @investment.name = 'Transaction #50'
    expect(@investment).to be_valid
  end

  it 'icon should be present' do
    @investment.amount = 10
    expect(@investment).to be_valid
  end

  describe 'associations' do
    it 'has and belongs to many' do
      association = described_class.reflect_on_association(:groups)
      expect(association.macro).to eq :has_and_belongs_to_many
    end

    it 'belongs to' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq :belongs_to
    end
  end
end
