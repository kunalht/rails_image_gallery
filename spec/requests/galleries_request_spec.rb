require 'rails_helper'

RSpec.describe "Galleries", type: :request do
  it "creates a new gallery and redirects to galleries index path" do
    get "/galleries/new"
    expect(response).to render_template(:new)

    post "/galleries", params: { gallery: { name: "test", description: "test" }}
    follow_redirect!

    expect(response).to render_template(:index)
  end

  it "edit a gallery and redirects to galleries index path" do 
    gallery = Gallery.create(name: 'test', description: 'gallery')
    get "/galleries/#{gallery.id}/edit"
    expect(response).to render_template(:edit)


    patch "/galleries/#{gallery.id}", params: { gallery: { name: "test-updated", description: "test" }}
    follow_redirect!
    expect(response).to render_template(:index)
  end

  it "delete a gallery and redirect to index path" do
    gallery = Gallery.create(name: 'test', description: 'gallery')
    delete "/galleries/#{gallery.id}"
    follow_redirect!
    expect(response).to render_template(:index)
  end
end
