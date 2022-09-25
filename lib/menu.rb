class Menu
  def initialize
    @menu = []
    # @io = io
  end
  
  def add(menu_item)
    @menu << menu_item
    #  @menu.merge!(menu_item)
  end

  def menu_arr
  @menu
  end

  def format_menu
  formatted_menu = @menu.map do
    |dish| "#{dish.dish_name} --- £#{'%.2f' % (dish.price.to_f/100)}"
  end
  formatted_menu.join("\n")
end

  def header
    return "Welcome to Benchita's Tacquiera\n-----------\n***MENU***\n"
  end

  def show_menu

    return header + format_menu
  end
end



# {
  #   "Fish Tacos": 4.99,
  #   "Beef Tacos": 5.99,
  #   "Jackfruit Tacos": 4.49,
  #   "Pulled Pork Burrito": 9.50,
  #   "Guac & Chips": 6,
  #   "Margarita": 11.50,
  #   "Guac Side": 1,
  #   "Hot Sauce": 0.5
  # }

  # [
  #   ["Fish Tacos", 4.99],
  #   ["Beef Tacos", 5.99],
  #   ["Jackfruit Tacos", 4.49],
  #   ["Pulled Pork Burrito", 9.50],
  #   ["Guac & Chips", 6],
  #   ["Margarita", 11.50],
  #   ["Guac Side", 1],
  #   ["Hot Sauce", 0.5]
  # ]