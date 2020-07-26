require 'rails_helper'

RSpec.describe "Items", type: :request do
    
    
    describe "GET /items" do
        
        
        
        it "returns success status" do
            get items_path
            expect(response).to have_http_status(302)
        end  
        
      
        
    end
    
    describe "POST /items" do
        context "when it has valid paramters" do
            it "creates the item with correct attributes" do
                item_attributes = FactoryBot.attributes_for(:item)
                Item.new(item_attributes).save
                post items_path, params: { item: item_attributes}
                
                expect(Item.last).to have_attributes(item_attributes)
            end        
        end
        
        context "when it has no valid parameters" do
            it "does note create item"  do
                expect{
                    post items_path, params: {items: {name: '', price: '', business_id:''}}
                }.to_not change(Item, :count)   
            end
        end      
    end
end
