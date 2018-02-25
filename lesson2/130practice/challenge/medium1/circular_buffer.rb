class CircularBuffer
  def initialize(size)
    @size = size
    @buffer = []
  end

  def read
    buffer.empty? ? raise(BufferEmptyException) : buffer.shift
  end

  def write(ele)
    raise BufferFullException if buffer.size == size
    return unless ele
    buffer.push(ele)
  end

  def write!(ele)
    return unless ele
    buffer.shift if buffer.size == size
    buffer.push(ele)
    # if buffer.size == size
    #   buffer.shift
    #   buffer.push(ele)
    # else
    #   buffer.push(ele)
    # end
  end

  def clear
    buffer.clear
  end

  private

  attr_accessor :size, :buffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end