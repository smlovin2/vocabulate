require 'rails_helper'

RSpec.describe "words/index.html.erb", type: :view do
  it "shows all @words" do
    assign(:words, [{"wordstring" => "dog"}, {"wordstring" => "cat"}])
    render

    expect(rendered).to include("dog")
    expect(rendered).to include("cat")
  end
end
