class GamesController < ApplicationController
  def new
    aplhabet = [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "x", "y", "w", "z" ]
    @letters = aplhabet.sample(10)
  end

  def score
    require "json"
    require "open-uri"
    url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"

    serialized_dictionary = URI.open(url).read

    @test = JSON.parse(serialized_dictionary)
    @letters = params[:letters].split(" ")
    @answer = params[:answer]

    if (@letters & @answer.split("")).sort == @answer.split("").sort
      @valid_answer = true
    else
      @valid_answer = false
    end
  end
end
