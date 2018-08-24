class App
  attr_accessor :user
    def initialize
      @menu_options = [
      "Make a purchase",
      "View Store Inventory",
      "Return an item",
      "View my remaining balance",
      "Leave the store"
    ]
    

      @inventory = [
      {item: "apple", price: 1.50, quantity: 10},
      {item: "milk", price: 4.25, quantity: 15},
      {item: "oranje juice", price: 1.75, quantity: 10},
      {item: "soda", price: 0.99, quantity: 50},
      {item: "cereal", price: 2.50, quantity: 15},
      {item: "cake", price: 7.99, quantity: 4},
      {item: "doughnut", price: 0.50, quantity: 100},
      {item: "lettuce", price: 0.99, quantity: 10},
      {item: "soup", price: 1.50, quantity: 10},
     ] 
  
    @purchased_items = []
    
    greeting
    end

    class User
      attr_accessor :name, :wallet_balance
  
      def initialize(name, wallet_balance)
        @name = name
        @wallet_balance = wallet_balance
      end
      
      # def user_input
      # puts "What is your name?"
      # @user_name = gets.strip
      # puts "How much money do you have?"
      # @first_balance = gets.strip
      # end
      
      def my_balance
        puts "You have $#{@wallet_balance} available."
      end
    end
     
     

  # puts @inventory
  # puts @purchased_items
  # puts @menu_options



  def menu_option(number)
    case number
      when 1
        purchase
      when 2 
        print_inventory
        puts "What's next?"
        print_menu
      when 3 
        return_item
      when 4
        @user1.my_balance
        puts "What's next"
        print_menu
      when 5
        puts "Have a nice day"
        exit
      else
        puts "Please make a valid selection"
    end
  end


  def print_menu
    puts "Please make a selection"
    @menu_options.each_with_index { |single, index| 
      puts "#{index+1}) #{single}"
    }
    answer = gets.chomp.to_i
    menu_option(answer)
  end

  def greeting
    puts "Welcome to my store"
    puts "What is your name?"
    @user_name = gets.strip
    puts "How much money do you have?"
    @first_balance = gets.strip
    puts "Welcome #{@user_name} what would you like to do?"
    @user1 = User.new(@user_name, @first_balance)
    print_menu
  end

  def print_inventory
    @inventory.each_with_index do |item, index|
      puts "#{index+1}: #{item[:item]}, #{item[:price]}, #{item[:quantity]}"
    end
  end
  
  def purchase
    print_inventory
    puts "Which item do you want to purchase?"
    @buy_item = gets.strip.to_i
    puts "What quantity?"
    @purchase_quantity = gets.strip.to_i
    @purchase_price = @inventory[@buy_item-1][:price] * @purchase_quantity
    case
    when @purchase_price <= @user1.wallet_balance.to_f
      case
      when @purchase_quantity <= @inventory[@buy_item-1][:quantity]
        buy
      else
        puts "Not enough items in inventory"
      end
    else
      puts "Insuffcient funds to make purcahse."
    end
    puts "What now?"
    print_menu
  
  end

    def buy
      a = @user1.wallet_balance.to_f
      @user1.wallet_balance = a - @purchase_price
      b = @inventory[@buy_item-1][:quantity]
      @inventory[@buy_item-1][:quantity] = b - @purchase_quantity

      puts "Your new balance is #{@user1.wallet_balance}."

      puts "What now?"
      print_menu

    end

  # def add_inventory
  # end

  def return_item
    print_inventory
    puts "Which item do you want to return?"
    @return_item = gets.strip.to_i
    puts "What quantity?"
    @return_quantity = gets.strip.to_i
    @return_price = @inventory[@return_item-1][:price] * @return_quantity
    return_now
  
  end

    def return_now
      a = @user1.wallet_balance.to_f
      @user1.wallet_balance = a + @return_price
      b = @inventory[@return_item-1][:quantity]
      @inventory[@return_item-1][:quantity] = @return_quantity + b

      puts "Your new balance is #{@user1.wallet_balance}."

      puts "What now?"
      print_menu

  end

  # class Store

  # end

end

App.new
