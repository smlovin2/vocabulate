require 'rails_helper'

RSpec.describe "dashboards/show.html.erb", type: :view do
  it "displays the user's words" do
    user = FactoryGirl.create(:user)
    sign_in user

    user.words << FactoryGirl.create(:word, word: "food", definition: "Something you eat.")
    render
    expect(rendered).to include("food")
    expect(rendered).to include("Something you eat.")
  end
end
