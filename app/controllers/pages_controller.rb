class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @hedgies = Hedgie.first(10)
    if params[:address]
      @hedgies = @hedgies.near(params[:address], 10)
      redirect_to(hedgies_path)
    end
  end
end
