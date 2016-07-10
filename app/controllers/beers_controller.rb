class BeersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :delete]
  # before_filter :authenticate_user!, except: :show
  helper_method :sort_column, :sort_direction

  def index
    @beers = Beer.order("#{sort_column} #{sort_direction}")
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def new
    @beer = Beer.new
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def create
    @beer = Beer.new(beer_params)

    if @beer.save
      redirect_to @beer
    else
      render 'new'
    end
  end

  def update
    @beer = Beer.find(params[:id])

    if @beer.update(beer_params)
      redirect_to @beer
    else
      render 'edit'
    end
  end

  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy

    redirect_to beers_path
  end

  private

    def sortable_columns
      ["name", "brewer", "price", "ounce", "calorie", "rating", "abv", "abv_per_cal", "abv_per_price", "calorie_per_price", "calorie_per_ounce"]
    end

    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def beer_params
      params.require(:beer).permit(:name, :brewer, :price, :ounce, :calorie, :rating, :abv, :bomber, :quantity)
    end

    #comment to test git

end
