module Mastermind
  RSpec.describe Code do

    it 'is initialized with pegs of valid colors' do
      code = Code.new

      actual = code.send(:pegs).all? { |peg| Mastermind::COLORS.include?(peg) }

      expect(actual).to be_truthy
    end

    describe '#evaluate' do
      before { @code = Code.new pegs: %i[dark blue blue orange green] }

      it 'returns correct evaluations of a code breaking attempt #1' do

        expect(@code.evaluate %i[blue blue sky sky sky]).to eq %i[black white]
      end

      it 'returns correct evaluations of a code breaking attempt #2' do

        expect(@code.evaluate %i[blue blue orange sky sky]).to eq %i[black white white]
      end

      it 'returns correct evaluations of a code breaking attempt #4' do

        expect(@code.evaluate %i[blue blue blue orange sky]).to eq %i[black black black]
      end

      it 'returns correct evaluations of a code breaking attempt #5' do

        expect(@code.evaluate %i[blue blue orange orange orange]).to eq %i[black black white]
      end

      it 'returns correct evaluations of a code breaking attempt #6' do
        code = Code.new pegs: %i[blue pink pink green dark]

        expect(code.evaluate %i[pink orange pink green blue]).to eq %i[black black white white]
      end
    end
  end
end
