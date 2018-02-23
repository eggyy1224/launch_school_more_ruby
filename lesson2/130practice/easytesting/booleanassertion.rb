require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class TestTest < MiniTest::Test
  def test_odd
    assert value.odd?, 'value is not odd'
  end 
end
