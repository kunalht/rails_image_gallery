require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "is not valid without Tag name" do
    tag = Tag.new(name: nil)
    expect(tag).to_not be_valid
  end
end
