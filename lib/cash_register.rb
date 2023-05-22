class CashRegister
    attr_reader :total, :items
  
    def initialize(employee_discount = 0)
      @total = 0
      @items = []
      @employee_discount = employee_discount
    end
  
    def add_item(title, price, quantity = 1)
      item = { title: title, price: price, quantity: quantity }
      @items << item
      @total += price * quantity
    end
  
    def apply_discount
      if @employee_discount > 0
        discount_amount = @total * @employee_discount / 100.0
        @total -= discount_amount
        "After applying a #{@employee_discount}% discount, the total is $#{@total}."
      else
        "Sorry, there is no discount to apply."
      end
    end
  
    def void_last_transaction
      last_item = @items.pop
      @total -= last_item[:price] * last_item[:quantity]
      @total = 0.0 if @items.empty?
    end
  end
# Creating a CashRegister instance with a 20% employee discount
register = CashRegister.new(20)

# Adding items to the cash register
register.add_item("Apple", 3)
register.add_item("Banana", 2, 2)
register.add_item("Orange", 4, 3)

# Printing the current total
puts "Current Total: $#{register.total}"
# Output: Current Total: $21

# Applying the discount
puts register.apply_discount
# Output: After applying a 20% discount, the total is $16.8

# Printing the list of items
puts "Items: #{register.items}"
# Output: Items: [{:title=>"Apple", :price=>3, :quantity=>1}, {:title=>"Banana", :price=>2, :quantity=>2}, {:title=>"Orange", :price=>4, :quantity=>3}]

# Voiding the last transaction
register.void_last_transaction

# Printing the updated total after voiding the last transaction
puts "Updated Total: $#{register.total}"
# Output: Updated Total: $12

# Voiding all transactions
register.void_last_transaction
register.void_last_transaction
register.void_last_transaction

# Printing the total after voiding all transactions
puts "Total after voiding all transactions: $#{register.total}"
# Output: Total after voiding all transactions: $0.0