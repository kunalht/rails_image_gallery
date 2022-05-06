class TagsController < ApplicationController
  def index
    page = params[:page] || 1
    page_size = 10
    @tags = Tag.all.page(page).per(page_size)
  end

  def show
    # Show galleries and pictures associated here
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
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def assign_to_gallery
    gallery = Gallery.find params[:gallery_id]
  end

  def assign_to_photo
  end

  private

  def tag_params
    params.require(:tag).permit(
      :name
    )
  end

end