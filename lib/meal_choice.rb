class MealChoice
  def initialize
    @meal = []
  end

 ## def request_choice
    # ask user to add a dish
    # option to remove dish
 ## end

  def add_dish(dish)
    @meal << dish
  end

  def remove_dish(dish)
    @meal.delete(dish)
  end

  def summary
    @meal
  end

  def format
    formatted_meal = @meal.map do
      |dish| "#{dish.dish_name} --- £#{'%.2f' % (dish.price.to_f/100)}"
    end
    formatted_meal.join("\n")
  end

  def sum_header
    return "Finalised order:\n"
  end

  def final_sum
    sum = 0
    @meal.each do |dish| 
    sum += dish.price
    end
  sum
  end

  def itemise
    p sum_header + format + "\nFinal Bill: £#{'%.2f' % (final_sum.to_f/100)}"
  end

  def confirm
    # true if confirmed
  end
end