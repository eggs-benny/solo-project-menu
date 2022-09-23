require 'menu'

RSpec.describe Menu do
  describe "#menu_arr" do
    context "adding item to menu" do
      it "returns array with one item" do
        menu = Menu.new
        fake_menu_item = double(:fake_menu_item, dish_name: "Fish Tacos", price: 4.99)
        menu.add(fake_menu_item)
        expect(menu.menu_arr).to eq [fake_menu_item]
      end
    end

    context "adding multiple items to menu" do
      it "returns array with one item" do
        menu = Menu.new
        fake_menu_item = double(:fake_menu_item, dish_name: "Fish Tacos", price: 4.99)
        fake_menu_item_2 = double(:fake_menu_item_2, dish_name: "Pulled Pork Burrito", price: 9.50)
        menu.add(fake_menu_item)
        menu.add(fake_menu_item_2)
        expect(menu.menu_arr).to eq [fake_menu_item, fake_menu_item_2]
      end
    end
  end

    describe "#show_menu" do
      context "when given a menu item" do
        it "it returns it as a string" do
          menu = Menu.new
          fake_menu_item = double(:fake_menu_item, dish_name: "Fish Tacos", price: 4.99)
          menu.add(fake_menu_item)
          expect(menu.show_menu).to eq "Fish Tacos --- £4.99"
        end
      end
    end

    describe "#show_menu" do
      context "when given a menu item" do
        xit "it returns it as a string" do
          menu = Menu.new
          fake_menu_item = double(:fake_menu_item, dish_name: "Fish Tacos", price: 4.99)
          fake_menu_item_2 = double(:fake_menu_item_2, dish_name: "Pulled Pork Burrito", price: 9.50)
          menu.add(fake_menu_item)
          menu.add(fake_menu_item_2)
          expect(menu.show_menu).to eq "Fish Tacos --- £4.99\nPulled Pork Burritos --- £9.50"
        end
      end
    end


    # describe "#header" do
    #   context "when header is called" do
    #     it "puts the header string" do
    #       menu = Menu.new
    #       expect(menu.header).to receive(:puts).with("Welcome to Benchita's Tacquiera")
    #       expect(menu.header).to receive(:puts).with("------------")
    #       expect(menu.header).to receive(:puts).with("***MENU***")
    #       expect(menu.header).to receive(:puts).with(" ")

          
    #       menu.header
    #     end
    #   end
    # end

#   describe "#show" do
#     context "show single item from menu" do
#       it "displays menu" do
#       menu = Menu.new
#       fake_menu_item = double(:fake_menu_item, dish_name: "Fish Tacos", price: 4.99)
#       fake_menu_item_2 = double(:fake_menu_item, dish_name: "Pulled Pork Burrito", price: 9.50)
#       menu.add(menu_item_1)
#       menu.add(menu_item_2)
#       expect(menu.show).to eq  # =>
# ## Fish Tacos: £4.99
# ## Pulled Pork Burrito: £9.50
## Margs: £11.00
end