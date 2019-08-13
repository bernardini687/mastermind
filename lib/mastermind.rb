require_relative 'mastermind/code'

module Mastermind
  class Code
    def initialize(pegs: random_pegs)
      @pegs = pegs
    end

    private

    attr_reader :pegs

    def random_pegs
      Mastermind::COLORS.sample(5)
    end
  end
end
