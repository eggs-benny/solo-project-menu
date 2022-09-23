class Menu
  def initialize
    @menu = []
    # @menu_str =  ""
    # @io = io
  end

  def add(menu_item)
    @menu << menu_item # menu_item is an instance of MenuItem
    # MenuItem gets added to menu
    # Returns nothing
  end

  def menu_arr
    @menu
  end

  def format_menu
    # turns string of the form "dish_name": £"price"
  end

  def header
    return "Welcome to Benchita's Tacquiera"
    return "------------"
    return "***MENU***"
    return " "
  end

  def show_menu
    @menu.join("\n")
    @menu.each { |dish|
      "#{dish.dish_name} --- £#{dish.price}"
    }
    @menu.join("\n")
    # menu_str = ""
    # @menu.each { |dish|
      # menu_str << "#{dish.dish_name} --- £#{dish.price}"
    # }
    # menu_str
    # Returns a formatted list inc header menu items (and prices)
  end
end