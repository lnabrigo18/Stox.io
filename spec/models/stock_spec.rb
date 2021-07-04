require 'rails_helper'

RSpec.describe Stock, type: :model do
  let!(:stock) { described_class.new }

  context 'with validations' do
    it 'is not valid without ticker' do
      expect(stock).to validate_presence_of(:ticker)
    end

    it 'is not valid without company name' do
      expect(stock).to validate_presence_of(:company)
    end

    it 'is not valid without percent change' do
      expect(stock).to validate_presence_of(:change_percent)
    end

    it 'is not valid without price' do
      expect(stock).to validate_presence_of(:price)
    end
  end
end
