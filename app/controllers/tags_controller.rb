class TagsController < ApplicationController
  def index
    page = params[:page] || 1
    page_size = 10
    @tags = Tag.all.page(page).per(page_size)
  end

  def show
    @tag = Tag.find params[:id]
    @gallery_tags = GalleryTag.where(tag: @tag)
    @photo_tags = PhotoTag.where(tag: @tag)
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.valid?
      @tag.save
      redirect_to tags_path
    else
      flash[:error] = "Error occurred, please fix the error and try again"
      render "new"
    end
  end

  def edit
    @tag = Tag.find params[:id]
  end

  def update
    @tag = Tag.find params[:id]
    @tag.assign_attributes(tag_params)    

    if @tag.valid?
      @tag.save!
    else
      flash[:error] = "Error occurred, please fix the error and try again"
      render "edit"
    end
  end

  def destroy
    tag = Tag.find params[:id]
    tag.destroy
    redirect_to tags_path
  end

  def assign_to_gallery
    gallery = Gallery.find params[:gallery_id]
    tag = Tag.find params[:tag_id]
    
    if GalleryTag.where(gallery: gallery, tag: tag).exists?
      flash[:error] = "Tag already assigned to this gallery"
    else
      gallery_tag = GalleryTag.create(gallery: gallery, tag: tag)
    end
    redirect_back(fallback_location: galleries_path)
  end

  def assign_to_photo
    photo = Photo.find params[:photo_id]
    tag = Tag.find params[:tag_id]

    if PhotoTag.where(photo: photo, tag: tag).exists?
      flash[:error] = "Photo already assigned to this gallery"
    else
      photo_tag = PhotoTag.create(photo: photo, tag: tag)
    end
    redirect_back(fallback_location: galleries_path)
  end

  private

  def tag_params
    params.require(:tag).permit(
      :name
    )
  end

end