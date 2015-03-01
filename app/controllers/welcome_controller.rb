class WelcomeController < ApplicationController
  def index
    @places = Place.limit(20).where('youtube is not null')
  end
end
