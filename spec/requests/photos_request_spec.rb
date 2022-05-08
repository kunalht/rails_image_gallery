require 'rails_helper'

RSpec.describe "Photos", type: :request do
  before(:example) do
    @gallery = Gallery.create(name: 'test', description: 'gallery')
  end

  it "creates a new photo and redirects to galleries show path" do
    get "/galleries/#{@gallery.id}/photos/new"
    expect(response).to render_template(:new)

    post "/galleries/#{@gallery.id}/photos", params: { photo: { name: 'test', image: fixture_file_upload('ipad.jpg') }}
    follow_redirect!

    expect(response).to render_template(:show)
  end
end
