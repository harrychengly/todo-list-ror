class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def about
  end

  def contact
  end

  def index
    if params.has_key?(:category)
    @listingbody = Listing.select('body, id, category').where(category: params[:category]);
    @category = params[:category];
    else
      @listingbody = Listing.select('body, id, category');
      @category = "All tasks";
    end
    @listings = Listing.all;
  end

  def show 
    listing = Listing.find(params[:id])
  end

def create 
    listing = Listing.new(listing_params)

    if listing.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

end

def new
  respond_to do |format|
    format.html
    format.js
  end
end

def destroy 
    listing = Listing.find(params[:id])
    listing.destroy
    redirect_back(fallback_location: root_path)
  end

def edit 
  respond_to do |format|
    format.html
    format.js
  end
    @listing = Listing.find(params[:id])
end

def update
    listing = Listing.find(params[:id])
    listing.update_attributes(listing_params)
    redirect_back(fallback_location: root_path)
end

private 
def listing_params
    params.require(:listing).permit(:category, :body)
end

end


