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
    @definition = Wordnik.word.get_definitions(@word)
    @pronunciation = Wordnik.word.get_text_pronunciations(@word)
    @synonyms = Wordnik.word.get_related_words(@word).find {|info| info['relationshipType'] == 'synonym'}

    if @synonyms.nil?
      @synonyms = []
    else
      @synonyms = @synonyms['words']
    end
  end

  def save
    @word = current_user.current_list.words.create(word: word_param, pronunciation: pronunciation_param)
    create_definitions(Wordnik.word.get_definitions(word_param))
    create_synonyms(Wordnik.word.get_related_words(word_param).find {|info| info['relationshipType'] == 'synonym'})

    redirect_to root_path
  end

  private

  def word_param
    params.require(:word)
  end

  def definition_param
    params.require(:definition)
  end

  def pronunciation_param
    params.require(:pronunciation)
  end

  def get_definitions
    defintions = {}
    @words.each do |word|
      defintions[word["wordstring"]] =  Wordnik.word.get_definitions(word["wordstring"])
    end
    defintions
  end

  def create_definitions(definitions)
    definitions.each do |definition|
      @word.definitions.create(text: definition['text'])
    end
  end

  def create_synonyms(synonyms)
    synonyms['words'].each do |synonym|
      @word.synonyms.create(synonym: synonym)
    end
  end
end
