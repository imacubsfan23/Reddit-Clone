class AdvertisementsController < ApplicationController
  def index
    @advertisements = advertisements.all
  end

  def show
    @advertisement = advertisements.find{params[:id]}
  end

  def new
    @advertisement = advertisements.new
  end

  def create
    @advertisement = advertisements.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.copy = params[:advertisement][:copy]
    @advertisement.price = params[:advertisement][:price]
    
    if @advertisement.save
      flash[:notice] = "Advertisement was saved."
      redirect_to @advertisement
    else
      flash[:error] = "There was an error saving the advertisement. Please Try again."
      render :new
    end
  end
end
