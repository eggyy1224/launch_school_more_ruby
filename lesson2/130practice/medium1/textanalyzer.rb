class TextAnalyzer
  def process
    file = File.open('./sample.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n\n").size} lines"}
analyzer.process { |text| puts "#{text.split(" ").size} words" }