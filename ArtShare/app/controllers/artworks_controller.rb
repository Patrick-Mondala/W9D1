class ArtworksController < ApplicationController
  
  def index
      render json: Artwork.all
  end

  def create
      artwork = Artwork.new(artwork_params)

      if artwork.save
          render json: artwork
      else
          render json: artwork.errors.full_messages, status: :unprocessable_entity
      end
  end

  def show
      artwork = Artwork.find(params[:id])
      if artwork
          render json: artwork
      else
          render plain: "Artwork not found #{params[:id]}", status: :unprocessable_entity
      end
  end

  def destroy
    Artwork.find(params[:id]).destroy
  end

  def update
    artwork = Artwork.find(params[:id])


    if artwork.update(artwork_params)
        render plain: "Artwork updated"
    else
        render plain: "Artwork failed to update", status: 400
    end
  end

  private:

  def artwork_params
      params.require(:artwork).permit(:name, :email)
  end

end