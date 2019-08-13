module Mastermind
  RSpec.describe Code do

    it 'is initialized with pegs of valid colors' do
      code = Code.new

      actual = code.send(:pegs).all? { |peg| Mastermind::COLORS.include?(peg) }

      expect(actual).to be_truthy
    end
  end
end
