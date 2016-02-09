require 'rails_helper'

RSpec.describe "words/show.html.erb", type: :view do
  it "shows @word" do
    assign(:word, "dog")
    render

    expect(rendered).to include("dog")
  end

  it "shows @definition" do
    assign(:word, "dog")
    assign(:definition, "A fun animal")
    render

    expect(rendered).to include("A fun animal")
  end
end
