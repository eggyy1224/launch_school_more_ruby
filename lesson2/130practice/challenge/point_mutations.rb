class DNA
  def initialize(sequence)
    @sequence = sequence.chars
  end

  def hamming_distance(test_sequence)
    test_sequence = test_sequence.chars
    count(@sequence, test_sequence) 
  end

  private

  def count(sequence, test_sequence)
    counter = 0
    sequence.each_with_index do |base, index|
      break if test_sequence[index].nil?#sequence比較長的狀況,直接跳出迴圈
      counter += 1 unless base == test_sequence[index]#當test_sequence比較長時不會繼續跑回圈
    end
    counter
  end
end