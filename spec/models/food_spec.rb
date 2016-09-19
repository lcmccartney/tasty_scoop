require 'rails_helper'

describe Food do
  context "food details" do
    it "returns all details" do
      VCR.use_cassette("food model") do
        food = Food.new("1 large apple")

        expect(food.calories).to eq(115)
        expect(food.total_weight).to eq(223.0)
      end
    end
  end
end
