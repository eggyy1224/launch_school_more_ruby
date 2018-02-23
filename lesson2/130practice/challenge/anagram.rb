class Anagram
  def initialize(phrase)
    @phrase = phrase.downcase
  end

  def match(candidates)
    candidates.select do |candidate|
      anagram?(candidate)
    end
  end
  
  private

  def anagram?(candidate)
    candidate = candidate.downcase
    return false unless @phrase.length == candidate.length
    return false if @phrase == candidate
    candidate.chars.sort == @phrase.chars.sort
  end
end