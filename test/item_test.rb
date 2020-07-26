require './test/test_helper'
class ItemTest  < Test::Unit::TestCase
    
    fixtures :items
    def test_should_be_invalid
        item = Item.create
        assert !item.valid?, "Item shouldn't be created"
    end




    
    def test_should_require_name
        item = create(:name => nil)
        assert item.errors.invalid?(:name), ":name should be required"
        assert_invalid item, "Item shouldn't be created"
    end
    
    def test_should_require_price
        item = create(:price => nil)
        assert item.errors.invalid?(:price), ":price should be required"
        assert_invalid item, "price shouldn't be created"
    end
    

    private
    def create(options={})
        Item.create({
            :name => "Beer",
            :price => 10
        }.merge(options))
    end
    
  
end