class Translation
  AMINO_ACIDS = {
    'Methionine' => %w(AUG),
    'Phenylalanine' => %w(UUU UUC),
    'Leucine' => %w(UUA UUG),
    'Serine' => %w(UCU UCC UCA UCG),
    'Tyrosine' => %w(UAU UAC),
    'Cysteine' => %w(UGU UGC),
    'Tryptophan' => %w(UGG),
    'STOP' => %w(UAA UAG UGA)
  }
  def self.of_codon(codon)
    AMINO_ACIDS.each do |aa, codons|
      return aa if codons.include?(codon)
    end
    nil
  end

  def self.of_rna(strand)
    result = []
    until strand.empty?
      raise InvalidCodonError, 'Invalid codon!' if of_codon(strand.slice(0, 3)).nil?
      break if of_codon(strand.slice(0, 3)) == 'STOP'
      result << of_codon(strand.slice!(0, 3))
    end
    result
  end
end

class InvalidCodonError < StandardError
end