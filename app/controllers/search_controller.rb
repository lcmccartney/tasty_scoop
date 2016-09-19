class SearchController < ApplicationController
  def index
    @food = Food.new(params[:search])
  end
end
