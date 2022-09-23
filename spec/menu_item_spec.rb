require 'menu_item'

RSpec.describe MenuItem do
  describe "#dish_name" do
    it "returns name as string" do
  menu_item = MenuItem.new("Fish Tacos", 4.99)
  expect(menu_item.dish_name).to eq "Fish Tacos"
    end
  end

  describe "#price" do
    it "returns price as float" do
  menu_item = MenuItem.new("Fish Tacos", 4.99)
  expect(menu_item.price).to eq 4.99
    end
  end
end