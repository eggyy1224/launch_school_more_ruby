require 'pry'

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  # def word_count
  #   result = Hash.new(0)
  #   @phrase.split(/[^a-zA-Z0-9']+/).each do |word|
  #     word.downcase!
  #     word.gsub!("'", '') if word[0] == "'" || word[-1] == "'"
  #     result[word] += 1
  #   end
  #   result
  # end

  def word_count
    @phrase.scan(/\b\w+'?\w+\b|\b\w+\b/).each_with_object(Hash.new(0)) do |word, result|
      word.downcase!
      result[word] += 1
    end
    
  end
end