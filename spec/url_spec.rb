require_relative '../app/routes.rb'

RSpec.describe "URLs" do
  it "should generate a valid URL when tema and content are present" do
    expect(set_url('a', 'b')).to eq("?tema=a&content=b")
  end

  it "should generate a valid URL when only tema is present" do
    expect(set_url('a', nil)).to eq("?tema=a")
  end
end