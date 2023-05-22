class CashRegister
    def initialize
      @items = []
      @transactions = []
    end
  
    def add_item(name, quantity, price)
      item = { name: name, quantity: quantity, price: price }
      @items << item
    end
  
    def calculate_discount(discount_percentage)
      total = calculate_total
      discount_amount = total * (discount_percentage / 100.0)
      total - discount_amount
    end
  
    def void_last_transaction
      last_transaction = @transactions.pop
      last_transaction[:quantity].times { @items.pop }
    end
  
    def print_receipt
      puts "==== Receipt ===="
      @items.each do |item|
        puts "#{item[:name]} (x#{item[:quantity]}) - $#{item[:price] * item[:quantity]}"
      end
      puts "Total: $#{calculate_total}"
      puts "==============="
    end
  
    private
  
    def calculate_total
      @items.reduce(0) { |total, item| total + (item[:price] * item[:quantity]) }
    end
  end
  
  # Example usage:
  
  register = CashRegister.new
  register.add_item("Apple", 3, 1.50)
  register.add_item("Banana", 2, 0.75)
  register.print_receipt
  
  discounted_total = register.calculate_discount(10) # Apply 10% discount
  puts "Discounted Total: $#{discounted_total}"
  
  register.void_last_transaction
  register.print_receipt