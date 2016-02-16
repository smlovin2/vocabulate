require 'rails_helper'

RSpec.describe WordsController, type: :controller do

  describe "words#show" do
    it "returns http success" do
      get :show, word: "food", definition: [{"text" => "A domesticated carnivorous mammal (Canis familiaris) related to the foxes and wolves and raised in a wide variety of breeds."}]
      expect(response).to have_http_status(:success)
    end

    it "assigns :word to @word" do
      get :show, word: "food", definition: [{"text" => "A domesticated carnivorous mammal (Canis familiaris) related to the foxes and wolves and raised in a wide variety of breeds."}]
      expect(assigns(:word)).to eq("food")
    end

    it "assigns a definition for :word to @definition" do
      get :show, word: "dog", definition: [{"text" => "A domesticated carnivorous mammal (Canis familiaris) related to the foxes and wolves and raised in a wide variety of breeds."}]
      expect(assigns(:definition)[0]["text"]).to eq("A domesticated carnivorous mammal (Canis familiaris) related to the foxes and wolves and raised in a wide variety of breeds.")
    end

    it "assigns a pronunciation for :word to @pronunciation" do
      get :show, word: "sincere", definition: [{"text" => "Not feigned or affected; genuine:  sincere indignation. "}]
      expect(assigns(:pronunciation)[0]["raw"]).to eq("(sĭn-sîrˈ)")
    end

    it "assigns synonyms for :word to @synonyms" do
      get :show, word: "sincere", definition: [{"text" => "Not feigned or affected; genuine:  sincere indignation. "}]
      expect(assigns(:synonyms)).to eq(["upright", "unvarnished", "real", "frank", "inartificial", "true", "unfeigned", "unaffected", "honest", "hearty"])
    end
  end

  describe "words#index" do
    it "should successfully return success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns defintions for all the words" do
      get :index, search: "dog"
      expect(assigns(:definitions)["dog"][0]["text"]).to eq("A domesticated carnivorous mammal (Canis familiaris) related to the foxes and wolves and raised in a wide variety of breeds.")
    end

    it "assigns a value to @words after search" do
      get :index, search: "dog"
      expect(assigns(:words)).to_not eq(nil)
    end

  end

  describe "words#save" do
    it "should require users to be logged in" do
      put :save, word: {word: "Food", definition: "Something you eat."}
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully save the word for the user" do
      user = FactoryGirl.create(:user)
      sign_in user

      put :save, word: "Food", definition: "Something you eat."
      expect(response).to redirect_to root_path

      word = Word.last
      expect(word.word).to eq("Food")
      expect(word.definition).to eq("Something you eat.")
      expect(word.users.include?(user)).to eq(true)
    end
  end

end
