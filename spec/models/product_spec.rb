require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.create(name: "flowers")
    @product = Product.create(name: "tree", price_cents: 50 , quantity: 2, category: @category )
  end

  it "should check if product is valid" do
    expect(@product).to be_valid
  end

  it "should check name is valid" do
    @product.name = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Name can't be blank")
  end

  it "should check price is valid" do
    @product.price_cents = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Price cents is not a number", "Price is not a number", "Price can't be blank")
  end

  it "should check name is valid" do
    @product.quantity = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Quantity can't be blank")
  end

  it "should check category is valid" do
    @product.category = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Category must exist", "Category can't be blank")
  end

end