require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test

  def test_acept_money
    cash = CashRegister.new(100)
    transaction = Transaction.new(20)
    transaction.amount_paid = 10
    before_accept = cash.total_money
    cash.accept_money(transaction)
    after_accept = cash.total_money
    assert_equal  before_accept + 10, after_accept
  end

  def test_change
    cash = CashRegister.new(100)
    transaction = Transaction.new(20)
    
    transaction.amount_paid = 40
    
    assert_equal 20, cash.change(transaction)
  end

  def test_give_receipt
    cash = CashRegister.new(100)
    transaction = Transaction.new(20)

    phrase = "You've paid $20.\n"

    assert_output(phrase) do
      cash.give_receipt(transaction)
    end
  end
end