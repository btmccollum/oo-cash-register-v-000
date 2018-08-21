require 'pry'

class CashRegister

attr_accessor :total, :items, :discount, :last_transaction

  def initialize(discount = 0) #optionally accepts a discount
    @discount = discount
    @total = 0
    @items = []
  end

  def apply_discount #applies a discount, if given, to the total
    if discount != 0
      @total = @total - (@total * (@discount.to_f / 100))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def add_item(title, price, quantity = 1)
    self.last_transaction = title, price, quantity #assigns the items being added in to an identifier
    quantity.times do
      @items << title
    end
    @total += quantity * price
  end

  def void_last_transaction #uses the last_transaction identifier to void the previous transaction
    last_transaction[2].times do
      @items.delete(last_transaction[0])
    end
    @total -= last_transaction[2] * last_transaction[1]
  end
end
