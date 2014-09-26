class ShortenedUrlsController < ApplicationController
  def root
    render :form
  end
  
  def create
    @shortened_url = ShortenedUrl.new(shortened_params)
    
    if @shortened_url.save
      render :show
    end
  end
  
  private
  def shortened_params
    params.require(:shortened_url).permit(:long_url)
  end
end
