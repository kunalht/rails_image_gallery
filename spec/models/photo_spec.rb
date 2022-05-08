require 'rails_helper'

RSpec.describe Photo, type: :model do
  before(:example) do
    @gallery = Gallery.create(name: 'test', description: 'gallery')
  end

  it "is not valid without photo name" do
    photo = Photo.new(name: nil)
    expect(photo).to_not be_valid
  end
  
  it "must belongs to gallery" do
    photo = Photo.new(name: 'test', image: fixture_file_upload('ipad.jpg'), gallery: nil)
    expect(photo).to_not be_valid
  end

  it "is only valid with photo name and image" do
    photo = Photo.new(name: 'test', image: fixture_file_upload('ipad.jpg'), gallery: @gallery )
    expect(photo).to be_valid
  end

  it "check if name, photo and gallery exist while updating" do
    photo = Photo.create(name: 'test', image: fixture_file_upload('ipad.jpg'), gallery: @gallery)
    photo.name = nil
    photo.save
    
    expect(photo).to_not be_valid
  end
end
