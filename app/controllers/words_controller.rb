class WordsController < ApplicationController
  def show
    @word = word_param
    @definition = "Something you can eat."
  end

  def save
    Word.create(word: word_param, definition: definition_param)
  end

  private

  def word_param
    params.require(:word)
  end

  def definition_param
    params.require(:definition)
  end
end
