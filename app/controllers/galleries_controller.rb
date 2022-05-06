class GalleriesController < ApplicationController
  def index
    page = params[:page] || 1
    page_size = 10
    @galleries = Gallery.all.page(page).per(page_size)
  end
  
  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)

    if @gallery.valid?
      @gallery.save
      redirect_to galleries_path
    else
      render "new"
    end
  end

  def show
    @gallery = Gallery.find params[:id]
    page = params[:page] || 1
    page_size = 5
    @photos = @gallery.photos.page(page).per(page_size)
    @tags = Tag.all
  end

  def edit
    @gallery = Gallery.find params[:id]
  end

  def update
    @gallery = Gallery.find params[:id]
    @gallery.assign_attributes(gallery_params)

    if @gallery.valid?
      @gallery.save!
      redirect_to galleries_path
    else
      render "edit"
    end
  end

  def destroy
    @gallery = Gallery.find params[:id]
    @gallery.destroy
    redirect_to galleries_path
  end

  private

  def gallery_params
    params.require(:gallery).permit(
      :name,
      :description
    )
  end

end