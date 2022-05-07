class Galleries::PhotosController < ApplicationController
  
  def new 
    @gallery = Gallery.find params[:gallery_id]
    @photo = @gallery.photos.build
  end

  def create
    @gallery = Gallery.find params[:gallery_id]
    @photo = Photo.new(photo_params)
    @photo.gallery = @gallery
    @photo.save
  end

  def show
    @gallery = Gallery.find params[:gallery_id]
    @photo = Photo.find params[:id]
    @photo_tags = PhotoTag.where(photo: @photo)
    @tags = Tag.all
  end

  private

  def photo_params
    params.require(:photo).permit(
      :name,
      :shooting_date,
      :description,
      :image
    )
  end
end
