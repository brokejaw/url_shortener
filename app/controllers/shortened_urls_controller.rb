class ShortenedUrlsController < ApplicationController
  def root
    render :form
  end
  
  def create
    @shortened_url = ShortenedUrl.new(shortened_params)
    
    if @shortened_url.save
      render :index
    else
      render json: @shortened_url.errors, status: :unprocessable_entity
    end
  end
  
  def show
    @shortened_url = ShortenedUrl.find(params[:id])
   
    redirect_to "#{@shortened_url.long_url}"
  end
  
  private
  def shortened_params
    params.require(:shortened_url).permit(:long_url)
  end
end
