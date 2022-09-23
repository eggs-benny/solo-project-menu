class MealChoice
  def initialize(meal)
    # meal is array
  end

 ## def request_choice
    # ask user to add a dish
    # option to remove dish
 ## end

  def add_dish(dish)
    # push dish into array
      ## ask user to confirm 
  end

  def remove_dish(dish)
    # delete dish from array
      ## ask user to confirm 
  end

  def meal_summary
    # returns array of meal so far
  end

  def format_meal
   # from meal_summary
   # Returns a listed string in the form "dish_name": £"price"
  end

  def add_header
    # puts string 
  end

  def final_price
    # sums price of all selected items
  end

  def itemise
   # => confirm pushes here
   # return a (formatted?) string of meals and prices
   # also return final price
   ## ask user to confirm selection
   ## thank user
  end

  def confirm
    # true if confirmed
  end
end