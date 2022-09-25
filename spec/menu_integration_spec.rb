require 'menu'
require 'menu_item'
require 'meal_choice'
require 'sms_builder'

RSpec.describe "Integration" do
  context "When adding menu items" do
    it "Returns an array of menu items" do
      menu = Menu.new
      menu_item_1 = MenuItem.new("Fish Tacos", 4.99)
      menu_item_2 = MenuItem.new("Pulled Pork Burrito", 9.50)
      menu.add(menu_item_1)
      menu.add(menu_item_2)
      expect(menu.menu_arr).to eq [menu_item_1, menu_item_2]
    end
  end

  describe "#show_menu" do
    context "when given a menu item" do
      it "it returns it as a string" do
        menu = Menu.new
        menu_item = MenuItem.new("Fish Tacos", 499)
        menu_item_2 = MenuItem.new("Pulled Pork Burrito", 950)
        menu.add(menu_item)
        menu.add(menu_item_2)
        expect(menu.format_menu).to eq "Fish Tacos --- £4.99\nPulled Pork Burrito --- £9.50"
      end
    end
  end

  describe "Add item to meal choice" do
    context "User selects new meal item" do
      it "adds item to meal array" do
      meal_choice = MealChoice.new
      menu_item_1 = MenuItem.new("Fish Tacos", 4.99)
      menu_item_2 = MenuItem.new("Pulled Pork Burrito", 9.50)
      menu_item_3 = MenuItem.new("Margs", 11.00)
      meal_choice.add_dish(menu_item_1)
      meal_choice.add_dish(menu_item_2)
      expect(meal_choice.summary).to eq [menu_item_1, menu_item_2]
      end
    end
  end

  describe "Remove item to meal choice" do
    context "User removes one of their meal items" do
      it "removes item to meal array" do
      meal_choice = MealChoice.new
      menu_item_1 = MenuItem.new("Fish Tacos", 4.99)
      menu_item_2 = MenuItem.new("Pulled Pork Burrito", 9.50)
      menu_item_3 = MenuItem.new("Margs", 11.00)
      meal_choice.add_dish(menu_item_1)
      meal_choice.add_dish(menu_item_2)
      meal_choice.remove_dish(menu_item_1)
      expect(meal_choice.summary).to eq [menu_item_2]
      end
    end
  end

  describe "Finalise order" do
    context "User finalises their order" do
      it "returns a summary statement of the order" do
      meal_choice = MealChoice.new
      menu_item_1 = MenuItem.new("Fish Tacos", 499)
      menu_item_2 = MenuItem.new("Pulled Pork Burrito", 950)
      menu_item_3 = MenuItem.new("Margs", 1100)
      meal_choice.add_dish(menu_item_1)
      meal_choice.add_dish(menu_item_2)
      meal_choice.add_dish(menu_item_3)
      meal_choice.add_dish(menu_item_3)
      expect(meal_choice.itemise).to eq "Finalised order:\nFish Tacos --- £4.99\nPulled Pork Burrito --- £9.50\nMargs --- £11.00\nMargs --- £11.00\nFinal Bill: £36.49"
      end
    end
  end
end