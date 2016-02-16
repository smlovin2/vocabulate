require 'rails_helper'

RSpec.describe "words/show.html.erb", type: :view do
  it "shows @word" do
    assign(:word, "dog")
    assign(:definition, [{"partOfSpeech" => "noun", "text" => "A fun animal"}])
    assign(:pronunciation, [{"raw" => "(dôg, dŏg)"}])
    assign(:synonyms, ["wretch", "fellow", "firedog", "andiron", "guy", "dude", "chap", "bloke", "qualifier", "man"])
    render

    expect(rendered).to include("dog")
  end

  it "shows @definition" do
    assign(:word, "dog")
    assign(:definition, [{"partOfSpeech" => "noun", "text" => "A fun animal"}])
    assign(:pronunciation, [{"raw" => "(dôg, dŏg)"}])
    assign(:synonyms, ["wretch", "fellow", "firedog", "andiron", "guy", "dude", "chap", "bloke", "qualifier", "man"])
    render

    expect(rendered).to include("A fun animal")
  end

  it "shows @pronunciation" do
    assign(:word, "dog")
    assign(:definition, [{"partOfSpeech" => "noun", "text" => "A fun animal"}])
    assign(:pronunciation, [{"raw" => "(dôg, dŏg)"}])
    assign(:synonyms, ["wretch", "fellow", "firedog", "andiron", "guy", "dude", "chap", "bloke", "qualifier", "man"])
    render

    expect(rendered).to include("(dôg, dŏg)")
  end

  it "shows @synonym" do
    assign(:word, "dog")
    assign(:definition, [{"partOfSpeech" => "noun", "text" => "A fun animal"}])
    assign(:pronunciation, [{"raw" => "(dôg, dŏg)"}])
    assign(:synonyms, ["wretch", "fellow", "firedog", "andiron", "guy", "dude", "chap", "bloke", "qualifier", "man"])
    render

    expect(rendered).to include("wretch")
  end
end
