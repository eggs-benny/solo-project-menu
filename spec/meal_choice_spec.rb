require 'meal_choice'

RSpec.describe MealChoice do
  describe "#add_dish" do
    it "adds a dish to the menu" do
    meal_choice = MealChoice.new
    fake_item_1 = double :fake_item, dish_name: "Beef Tacos", price: 599
    meal_choice.add_dish(fake_item_1)
    expect(meal_choice.summary).to eq [fake_item_1]
    end
  end

  describe "#remove_dish" do
    it "removes a dish to the menu" do
    meal_choice = MealChoice.new
    fake_item_1 = double :fake_item_1, dish_name: "Beef Tacos", price: 599
    fake_item_2 = double :fake_item_2, dish_name: "Cerveza", price: 499
    meal_choice.add_dish(fake_item_1)
    meal_choice.add_dish(fake_item_2)
    meal_choice.remove_dish(fake_item_2)
    expect(meal_choice.summary).to eq [fake_item_1]
    end
  end

  describe "#final_price" do
    it "sums the prices" do
    meal_choice = MealChoice.new
    fake_item_1 = double :fake_item_1, dish_name: "Beef Tacos", price: 599
    fake_item_2 = double :fake_item_2, dish_name: "Cerveza", price: 499
    meal_choice.add_dish(fake_item_1)
    meal_choice.add_dish(fake_item_2)
    expect(meal_choice.final_sum).to eq 1098
    end
  end

  describe "#format" do
    it "formats the meals added into 'dish_name --- £price'" do
    meal_choice = MealChoice.new
    fake_item_1 = double :fake_item_1, dish_name: "Beef Tacos", price: 599
    fake_item_2 = double :fake_item_2, dish_name: "Cerveza", price: 499
    meal_choice.add_dish(fake_item_1)
    meal_choice.add_dish(fake_item_2)
    expect(meal_choice.format).to eq "Beef Tacos --- £5.99\nCerveza --- £4.99"
    end
  end

  describe "#itemise" do
    it "itemises the meal items and includes a final total summed from meal" do
    meal_choice = MealChoice.new
    fake_item_1 = double :fake_item_1, dish_name: "Beef Tacos", price: 599
    fake_item_2 = double :fake_item_2, dish_name: "Cerveza", price: 499
    meal_choice.add_dish(fake_item_1)
    meal_choice.add_dish(fake_item_2)
    expect(meal_choice.itemise).to eq "Finalised order:\nBeef Tacos --- £5.99\nCerveza --- £4.99\nFinal Bill: £10.98"
    end
  end
end
