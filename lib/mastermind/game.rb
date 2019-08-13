require_relative 'code'

module Mastermind
  class Game
    attr_reader :secret
    def initialize(secret: Code.new)
      @secret = secret
    end

    def guess(attempt)
      secret.evaluate(attempt)
    end
  end
end
