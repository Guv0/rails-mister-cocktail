class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :update]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
  end

  def new
    @cocktail = Cocktail.new
  end

  def update
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
