module Mastermind
  RSpec.describe Code do

    it 'is initialized with pegs of valid colors' do
      code = Code.new pegs: %i[orange pink sky]

      actual = code.pegs.all? { |peg| Mastermind::COLORS.include?(peg) }

      expect(actual).to be_truthy
    end
  end
end
