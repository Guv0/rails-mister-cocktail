class DosesController < ApplicationController
  before_action :find_cocktail, only: [:index, :show, :create, :new]
  before_action :find_dose, only: [:destroy]



  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
     if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @dose = Dose.new
  end

  def update
  end

  def destroy
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:cocktail_id, :description, :ingredient_id)
  end
end
