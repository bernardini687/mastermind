require_relative 'colors'

module Mastermind
  class Code
    def initialize(pegs: random_pegs)
      @pegs = pegs
    end

    def evaluate(attempt)
      black_marks = attempt.map.with_index do |peg, position|
        next nil unless pegs.include?(peg)

        positions[peg].include?(position) ? :black : peg
      end

      # Count how many of given color are in the secret code.
      # Count how many are in the right position.
      # White marks only pegs not in the right position.
      white_marks = []
      (black_marks - [:black, nil]).each do |peg|
        peg_count = positions[peg].size
        peg_found = positions[peg].count { |i| black_marks[i] == :black }
        white_marks << :white if peg_found < peg_count
      end

      black_marks.select { |element| element == :black } + white_marks
    end

    private

    attr_reader :pegs

    def random_pegs
      Mastermind::COLORS.sample(5)
    end

    def positions
      @positions ||= begin
        positions = hash_builder
        pegs.each { |peg| positions[peg] }
        positions
      end
    end

    def hash_builder
      Hash.new do |hash, key|
        hash[key] = pegs.each_index.select { |i| pegs[i] == key }
      end
    end
  end
end
