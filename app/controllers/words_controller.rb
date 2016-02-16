class WordsController < ApplicationController
  before_action :authenticate_user!, only: [:save]

  def index
    if params[:search]
      @words = Wordnik.words.search_words(query: params[:search], case_sensitive: false)
      @definitions = get_definitions
    end
  end

  def show
    @word = word_param
    @definition = definition_param
    @pronunciation = Wordnik.word.get_text_pronunciations(@word)
    @synonyms = Wordnik.word.get_related_words(@word).find {|info| info['relationshipType'] == 'synonym'}

    if @synonyms.nil?
      @synonyms = []
    else
      @synonyms = @synonyms['words']
    end
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

  def get_definitions
    defintions = {}
    @words.each do |word|
      defintions[word["wordstring"]] =  Wordnik.word.get_definitions(word["wordstring"])
    end
    defintions
  end
end
