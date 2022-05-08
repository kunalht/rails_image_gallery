require 'rails_helper'

RSpec.describe "Comments", type: :request do
  before(:example) do
    @gallery = Gallery.create(name: 'test', description: 'gallery')
    @photo = Photo.create(name: 'test', image: fixture_file_upload('ipad.jpg'), gallery: @gallery )
  end

  it "creates a new comment to a photo" do
    get "/galleries/#{@gallery.id}/photos/#{@photo.id}/comments/new"
    expect(response).to render_template(:new)

    post "/galleries/#{@gallery.id}/photos/#{@photo.id}/comments", params: 
    {comment: {username: "firstuser", comment: "test comment"}}
    follow_redirect!

    expect(response).to render_template(:show)
  end
end
