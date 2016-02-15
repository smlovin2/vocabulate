module WordsHelper
  def show_definition_if_there_is_one(definitions)
    if definitions.empty?
      "<There is currently no definition for this word>"
    else
      definitions[0]["text"]
    end
  end
end
