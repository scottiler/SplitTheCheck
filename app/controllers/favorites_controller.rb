class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :destroy]

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  # POST /favorites.json
  def addFavorite
    @favorite = Favorite.new
    @favorite.userID = current_user.id
    @restaurant = Restaurant.find(Integer(params[:id]))
    @favorite.restaurantID = @restaurant.id
    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @restaurant, notice: 'The restaurant has been added to your favorites.' }
        format.json { redirect_to restaurant, status: :created, location: @restaurant }
      else
        format.html { redirect_to @restaurant, notice: 'The restaurant has already been added to your favorites.' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to userHistory_url, notice: 'Favorite was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_params
      params.require(:favorite).permit(:userID, :restaurantID)
    end
end
