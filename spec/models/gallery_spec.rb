require 'rails_helper'

RSpec.describe Gallery, type: :model do
  it "is not valid without gallery name" do
    gallery = Gallery.new(name: nil)
    expect(gallery).to_not be_valid
  end

  it "is not valid without gallery description" do
    gallery = Gallery.new(description: nil)
    expect(gallery).to_not be_valid
  end

  it "is valid with gallery name & description" do
    gallery = Gallery.new(name: 'test', description: 'test')
    expect(gallery).to be_valid
  end

  it "should have a unique name" do
    gallery1 = Gallery.new(name: 'first_gallery', description: 'test')
    gallery1.save
    gallery2 = Gallery.new(name: 'first_gallery', description: 'test second')
    expect(gallery2).to_not be_valid
  end

end
