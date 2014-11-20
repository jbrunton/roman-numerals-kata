def convert(arabic)
  return ""
end

describe "#convert" do
  it "should return the empty string for 0" do
    expect(convert(0)).to eq("")
  end
end
