class BandsController < ApplicationController

  before_action :require_user!

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = find_band
    if @band
      render :show
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to bands_url
    end
  end

  def edit
    @band = find_band
    render :edit
  end

  def update
    @band = find_band
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band = find_band
    @band.destroy
    redirect_to bands_url
  end

  private

  def find_band
    Band.find_by(params[:id])
  end

  def band_params
    params.require(:band).permit(:name)
  end

end
