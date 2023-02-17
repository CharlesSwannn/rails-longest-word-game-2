class GamesController < ApplicationController
  def new
    aplhabet = [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "x", "y", "w", "z" ]
    @letters = aplhabet.sample(10)
  end

  def score
    require "json"
    require "open-uri"
    url = "https://wagon-dictionary.herokuapp.com/"

    serialized_dictionary = URI.open(url).read

    beatles = JSON.parse(serialized_dictionary)
    raise
    @answer = params[:answer]
  end
end
