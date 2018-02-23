require 'pry'

class Scrabble
  SCORE_SHEET = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }
  def initialize(str)
    str = '' if str.nil?
    @str = str.scan(/[a-zA-Z]/)
  end

  def score
    @str.each_with_object([0]) do |char, scores|
      SCORE_SHEET.each do |key, value|
        scores << key if value.include?(char.upcase)
      end
    end.reduce(:+)
  end

  def self.score(str)
    Scrabble.new(str).score
  end
end