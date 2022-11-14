require 'open-uri'

class GamesController < ApplicationController
  VOWELS = %(A E I O U Y)

  def new
    @letters = ('A..Z').sample(10).to_a
    @letters.shuffle!
  end

  def score
    @letters = params[:letters].split
    @word = (params[:word] ||'').upcase
    @included = @included (@word, @letters)
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <=
      letters.count(letter) }

  end
  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

end
