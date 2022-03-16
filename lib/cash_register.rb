require 'pry'

class CashRegister
  attr_reader :discount, :items
  attr_writer :total

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(name, price, quantity = 1)
    self.total += price * quantity
    @last_item = price * quantity

    quantity.times { @items.push name }
  end

  def items
    @items
  end

  def apply_discount
    msg = ''

    if self.discount > 0
      self.total *= (1 - self.discount / 100.0)
      msg = "After the discount, the total comes to $#{self.total.to_i}."
    else
      msg = 'There is no discount to apply.'
    end

    msg
  end

  def void_last_transaction
    self.total -= @last_item
  end
end
