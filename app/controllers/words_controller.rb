class WordsController < ApplicationController
  before_action :authenticate_user!, only: [:save]

  def index
    if params[:search]
      @words = Wordnik.words.search_words(query: params[:search])
    end
  end

  def show
    @word = word_param
    @definition = Wordnik.word.get_definitions(@word)[0]["text"]
  end

  def save
    @word = current_user.words.create(word: word_param, definition: definition_param)
    redirect_to root_path
  end

  private

  def word_param
    params.require(:word)
  end

  def definition_param
    params.require(:definition)
  end
end
