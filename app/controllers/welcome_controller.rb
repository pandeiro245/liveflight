class WelcomeController < ApplicationController
  def index
    @places = Place.limit(20).where("url != ''").where('url is not null').where('youtube is not null').order('id desc')
  end
end
