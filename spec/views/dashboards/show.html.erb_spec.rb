require 'rails_helper'

RSpec.describe "dashboards/show.html.erb", type: :view do
  it "displays the user's words" do
    user = FactoryGirl.create(:user)
    sign_in user

    user.word_lists << FactoryGirl.create(:word_list)
    user.word_lists.first.words << FactoryGirl.create(:word, word: "dog")
    user.word_lists.first.words.first.definitions << FactoryGirl.create(:definition, text: "A domesticated carnivorous mammal (Canis familiaris) related to the foxes and wolves and raised in a wide variety of breeds.")
    render
    expect(rendered).to include("dog")
    expect(rendered).to include("A domesticated carnivorous mammal (Canis familiaris) related to the foxes and wolves and raised in a wide variety of breeds.")
  end
end
