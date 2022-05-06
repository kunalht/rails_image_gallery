class Galleries::Photos::CommentsController < ApplicationController
  def new
    @gallery = Gallery.find params[:gallery_id]
    @photo = Photo.find params[:photo_id]
    @comment = @photo.comments.build
  end
  
  def create
    @gallery = Gallery.find params[:gallery_id]
    @photo = Photo.find params[:photo_id]
    @comment = Comment.new(comment_params)
    @comment.photo = @photo
    @comment.save
    redirect_to gallery_photo_path(@gallery, @photo)
  end

  private 

  def comment_params
    params.require(:comment).permit(
      :username,
      :comment
    )
  end
end
