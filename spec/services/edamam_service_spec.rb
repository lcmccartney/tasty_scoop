require 'rails_helper'

describe EdamamService do
  context "get_by_food_name" do
    it "returns a list of food details" do
      VCR.use_cassette("food_details") do
        result = EdamamService.new.data("1 large apple")

        expect(result["calories"]).to eq(115)
        expect(result["totalWeight"]).to eq(223.0)
        expect(result["dietLabels"]).to eq(["LOW_FAT", "LOW_SODIUM"])

      end
    end
  end
end
