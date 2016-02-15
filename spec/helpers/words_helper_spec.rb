require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the WordsHelper. For example:
#
# describe WordsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe WordsHelper, type: :helper do
  describe "#show_definition_if_there_is_one" do
    it "should output a definition for the word if there is one" do
      expect(helper.show_definition_if_there_is_one([{"text" => "I have a definition"}])).to eq("I have a definition")
    end

    it "should return generic message if there is no definition" do
      expect(helper.show_definition_if_there_is_one([])).to eq("<There is currently no definition for this word>")
    end
  end
end
