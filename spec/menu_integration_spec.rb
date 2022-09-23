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
        menu_item = MenuItem.new("Fish Tacos", 4.99)
        menu_item_2 = MenuItem.new("Pulled Pork Burrito", 9.50)
        menu.add(menu_item)
        menu.add(menu_item_2)
        expect(menu.show_menu).to eq "Fish Tacos --- £4.99\nPulled Pork Burritos --- £9.50"
      end
    end
  end
end