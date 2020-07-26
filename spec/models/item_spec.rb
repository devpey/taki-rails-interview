require 'rails_helper'

RSpec.describe Item, type: :model do
  context "item is valid" do

    it "test ffaker in app" do
      name = FFaker::Name.first_name
      price = FFaker::Random.rand()
      item = Item.new(name: name, price: price)

      expect(item).to be_valid  
    end
    
    it "name null is validate?" do
     expect(Item.create(name: nil, price: 10)).to_not be_valid  

    end

    it "price null is validate?" do
      expect(Item.create(name: 'Beer', price: nil)).to_not be_valid  
    end


    it "negative price is validate?" do
      expect(Item.create(name: 'Beer', price: -10)).to_not be_valid  
    end

  end
  
end
