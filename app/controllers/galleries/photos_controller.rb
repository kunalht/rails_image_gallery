class Galleries::PhotosController < ApplicationController
  
  def new 
    @gallery = Gallery.find params[:gallery_id]
    @photo = @gallery.photos.build
  end

  def create
    @gallery = Gallery.find params[:gallery_id]
    @photo = Photo.new(photo_params)

    @photo.gallery = @gallery
    if @photo.valid?
      @photo.save
      redirect_to gallery_path(@gallery)
    else
      flash[:error] = "Error occurred, please fix the error and try again"
      render "new"
    end
  end

  def edit
    @photo = Photo.find params[:id]
    @gallery = @photo.gallery
  end

  def update
    @photo = Photo.find params[:id]
    @gallery = @photo.gallery
    @photo.assign_attributes(photo_params)

    if @photo.valid?
      @photo.save!
      redirect_to gallery_path(@gallery)
    else
      flash[:error] = "Error occurred, please fix the error and try again"
      render "edit"
    end
  end

  def show
    @gallery = Gallery.find params[:gallery_id]
    @photo = Photo.find params[:id]
    @photo_tags = PhotoTag.where(photo: @photo)
    @tags = Tag.all
  end

  def destroy
    photo = Photo.find params[:id]
    gallery = photo.gallery

    photo.destroy
    redirect_to gallery_path(gallery)
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
