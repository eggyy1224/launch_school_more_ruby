class PigLatin
  def self.translate(phrase)
    phrase.split.map do |word|
      translate_word(word)
    end.join(' ')
  end

  def self.translate_word(word)
    if is_vowel?(word)
      word + 'ay'
    else
      consonant, remain = parse_consonant(word)
      remain + consonant + 'ay'
    end
  end

  def self.is_vowel?(word)
    word =~ /\A[aeiou]|[xy][^aeiou]/
  end

  def self.parse_consonant(word)
    split_consonant = /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/.match(word)
    [split_consonant[1], split_consonant[2]]
  end
end