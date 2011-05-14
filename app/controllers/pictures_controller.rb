class PicturesController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  before_filter :require_admin, :except => [:index, :show]

  def index
    @album = Album.find(params[:album_id])
    @pictures = @album.pictures.processed
  end

  def show
    @album = Album.find(params[:album_id])
    @picture = Picture.find(params[:id])
  end

end
