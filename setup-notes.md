## 1. Describe the Problem
1. As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

2. As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

3. As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

4. ***Use the twilio-ruby gem to implement this next one. You will need to use doubles too.***
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.
*** Fair warning: if you push your Twilio API Key to a public Github repository, anyone will be able to see and use it. What are the security implications of that? How will you keep that information out of your repository? ***


## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
Benchita's Taquiera

 ┌───────────────────────┐       ┌─────────────────────────────────┐
 │Menu                   │       │MealChoice                       │
 │- add(menu_item)       ◄───────┤- select_dish(item)              │
 │- show_menu            │selects│- remove_dish(optional)          │
 │ => [p dishes w/prices]│ from  │- finalise                       │
 │- formatter??                  │         [menu_items + prices]   │
 └─────────┬─────────────┘       │=>return final price             │
           │                     │--- should this have UI function?│
           │  owns a list of     └────────┬────────────────────────┘
           ▼                              │
┌─────────────────────────┐               ▼ pushes upon complete order
│MenuItem(dish_name, price│       ┌──────────────────┐
│- dish_name              │       │SMSBuilder        │
│- price                  │       │- get_time        │
│- format                 │       │- send_sms (number│
│ => "dish_name": £"price"│       │- sms_formatter   │
└─────────────────────────┘       └──────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Menu
  def initialize
    # menu is array
  end

  def add(menu_item) # menu_item is an instance of MenuItem
    # MenuItem gets added to menu
    # Returns nothing
  end

  def menu_arr
    # Return array of menu items
  end

  def format_menu
    # turns string of the form "dish_name": £"price"
  end

  def header
   # puts string with welcome message
  end

   def show_menu
    # Returns a formatted list inc header menu items (and prices)
    # **Could add a puts here?**
  end
end

class MenuItem
  def initialize(dish_name, price) # both are strings
  end

  def dish_name
  # return string
  end
  
  def price
  # return string
  end
end

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
#############WORRY ABOUT THIS LAST##################
class SMSBuilder
  def initializer(time, mob_num)
  end

  def time
   # return time
  end

  def mob_num
   # return mob_num
  end
  
  def get_time(time)
    # trawl from time API
  end

  def get_mobile_no(mob_num)
    # gets number
    # returns as string
  end

  def format_sms
    # combines time & mob_numb to "Thank you! Your order was placed and will be delivered before HH:MM"
    # MUST HIDE NUMBERS
  end

  def send_sms
    # takes sms and sends via twilio
    # MUST HIDE NUMBERS FROM TWILIO
  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Display menu
menu = Menu.new
menu_item_1 = MenuItem.new("Fish Tacos", 4.99)
menu_item_2 = MenuItem.new("Pulled Pork Burrito", 9.50)
menu.add(menu_item_1)
menu.add(menu_item_2)
menu.show # => [menu_item_1, menu_item_2]

# Meal Choice - add item
meal_choice = MealChoice.new
menu = Menu.new
menu_item_1 = MenuItem.new("Fish Tacos", 4.99)
menu_item_2 = MenuItem.new("Pulled Pork Burrito", 9.50)
menu_item_3 = MenuItem.new("Margs", 11.00)
menu.add(menu_item_1)
menu.add(menu_item_2)
meal_choice.add_dish(menu_item_1)
meal_choice.summary # => [["Fish Tacos", 4.99],["Pulled Pork Burrito", 9.50]]
# Add ask for confirmation...

# Meal Choice - remove item
meal_choice = MealChoice.new
menu = Menu.new
menu_item_1 = MenuItem.new("Fish Tacos", 4.99)
menu_item_2 = MenuItem.new("Pulled Pork Burrito", 9.50)
menu_item_3 = MenuItem.new("Margs", 11.00)
menu.add(menu_item_1)
menu.add(menu_item_2)
meal_choice.add_dish(menu_item_1)
meal_choice.add_dish(menu_item_2)
meal_choice.remove_dish(menu_item_1)
meal_choice.summary # => ["Pulled Pork Burrito", 9.50]
# Add ask for confirmation

# Meal Choice - finalise
meal_choice = MealChoice.new
menu_item_1 = MenuItem.new("Fish Tacos", 4.99)
menu_item_2 = MenuItem.new("Pulled Pork Burrito", 9.5)
menu_item_3 = MenuItem.new("Margs", 11)
menu.add(menu_item_1)
menu.add(menu_item_2)
meal_choice.add_dish(menu_item_1)
meal_choice.add_dish(menu_item_2)
meal_choice.format
meal_format.itemise # => 
## Your order so far:
## Fish Tacos: £4.99
## Pulled Pork Burrito: £9.50
## ---
## Total: £14.49

#TODO
# Puts & Gets integrations

# SMS Builder
##Add later##
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE
## MealChoice
## SMSBuilder

### Menu
# Add item to menu
menu = Menu.new
menu_item_1 = MenuItem.new(double :dish_name, :price)
menu.add(menu_item_1)
menu.menu_arr # => [Fish Tacos, 4.99]


# Show menu
menu = Menu.new
menu_item_1 = MenuItem.new(double :dish_name_1, :price_1)
menu_item_2 = MenuItem.new(double :dish_name_2, :price_2)
menu_item_3 = MenuItem.new(double :dish_name_3, :price_3)
menu.add(menu_item_1)
menu.add(menu_item_2)
menu.add(menu_item_3)
menu.format_menu
menu.show # =>
## Fish Tacos: £4.99
## Pulled Pork Burrito: £9.50
## Margs: £11.00


### MenuItem
# Returns a menu item
menu_item = MenuItem.new("Fish Tacos", 4.99)
menu_item.dish_name # => "Fish Tacos"

# Returns a price
menu_item = MenuItem.new("Fish Tacos", 4.99)
menu_item.price # => 4.99

### MealChoice
# add dish to meal
meal_choice = MealChoice.new
menu_item_1 = MenuItem.new(double :dish_name, :price)
meal_choice.add_dish(menu_item_1) 
meal_choice.summary # => [menu_item_1]

# remove dish
meal_choice = MealChoice.new
menu_item_1 = MenuItem.new(double :dish_name, :price)
menu_item_2 = MenuItem.new(double :dish_name, :price)
meal_choice.add_dish(menu_item_1)
meal_choice.add_dish(menu_item_2)
meal_choice.remove_dish(menu_item_1)
meal_choice.summary # => [menu_item_2]

# remove dish
meal_choice = MealChoice.new
menu_item_1 = MenuItem.new(double :dish_name, :price)
menu_item_2 = MenuItem.new(double :dish_name, :price)
meal_choice.add_dish(menu_item_1)
meal_choice.add_dish(menu_item_2)
meal_choice.remove_dish(menu_item_1)
meal_choice.summary # => [menu_item_2]

# format meal
meal_choice = MealChoice.new
menu_item_1 = MenuItem.new(double :dish_name, :price)
menu_item_2 = MenuItem.new(double :dish_name, :price)
meal_choice.add_dish(menu_item_1)
meal_choice.add_dish(menu_item_2)
meal_choice.format # => Returns 2x meals in a string in the form "dish_name": £"price"

# 

# final price
meal_choice = MealChoice.new
menu_item_1 = MenuItem.new(double :dish_name, :price)
menu_item_2 = MenuItem.new(double :dish_name, :price)
meal_choice.add_dish(menu_item_1)
meal_choice.add_dish(menu_item_2)
meal_choice.final_price # => adds the two prices and returns a string "£ final_price"

# itemise
meal_choice = MealChoice.new
menu_item_1 = MenuItem.new(double :dish_name, :price)
menu_item_2 = MenuItem.new(double :dish_name, :price)
meal_choice.add_dish(menu_item_1)
meal_choice.add_dish(menu_item_2)
meal_choice.itemise # => puts the final itemised dishes, prices & total

### SMSBuilder
#
# Add ask for confirmation



```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._



------

food_menu (dish_name; price)
itemiser (add dish - collect cost; return food & price plus final total)
--> select & return multiple dishes
--> upon order - return itemised receipt

--> texter "Thank you! Your order was placed and will be delivered before HH:MM"
--> Trawl time api
--> MUST HIDE NUMBERS
