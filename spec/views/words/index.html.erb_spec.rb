require 'rails_helper'

RSpec.describe "words/index.html.erb", type: :view do
  it "shows all @words" do
    assign(:words, [{"wordstring" => "dog"}, {"wordstring" => "cat"}])
    assign(:definitions, {"dog" => [{"text" => "A domesticated carnivorous mammal (Canis familiaris) related to the foxes and wolves and raised in a wide variety of breeds."}], "cat" => [{"text" => "A domesticated carnivorous mammal (Canis familiaris) related to the foxes and wolves and raised in a wide variety of breeds."}]})
    render

    expect(rendered).to include("dog")
    expect(rendered).to include("cat")
  end
end
