require 'rails_helper'

RSpec.describe WordsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show, word: "food"
      expect(response).to have_http_status(:success)
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
      expect(word.user).to eq(user)
    end
  end

end
