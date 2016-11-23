require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:pie) { Dessert.new("pie", 8, chef)}
  let(:chef) { double("chef", :titleize => "Chef Madrev") }
  let(:ingredients_to_add) {["butter", "apples", "sugar", "flour"]}

  describe "#initialize" do
    it "sets a type" do
      expect(pie.type).to eq("pie")
    end

    it "sets a quantity" do
      expect(pie.quantity).to eq(8)
    end

    it "starts ingredients as an empty array" do
      expect(pie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("pie", "lots", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      pie.add_ingredient("butter")
    end

    it "adds an ingredient to the ingredients array" do
      expect(pie.ingredients).to include("butter")
    end
  end

  describe "#mix!" do
    before(:each) do
      ingredients_to_add.each {|ingredient| pie.add_ingredient(ingredient)}
      pie.mix!
    end

    it "shuffles the ingredient array" do
      expect(pie.ingredients).not_to eq(ingredients_to_add)
      expect(pie.ingredients.sort).to eq(ingredients_to_add.sort)
    end
  end

  describe "#eat" do
    before(:each) do
      pie.eat(2)
    end

    it "subtracts an amount from the quantity" do
      expect(pie.quantity).to eq(6)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ pie.eat(9) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      #allow(chef).to receive(:titleize).and_return("Chef Madrev")
      expect(pie.serve).to include("Chef Madrev")
    end
  end

  describe "#make_more" do

    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(pie)
        pie.make_more
    end
  end
end
