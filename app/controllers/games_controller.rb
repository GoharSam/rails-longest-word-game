class GamesController < ApplicationController

  def new
    @letters = ('A..Z').sample(10).to_a
  end

  def score(time,?)
  end
end
