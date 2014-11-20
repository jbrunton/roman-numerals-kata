def conversion_factor_for(arabic)
  {
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    1 => "I"
  }.find{|v,_| v <= arabic}
end

def convert(arabic)
  return "" if arabic.zero?
  factor = conversion_factor_for(arabic)
  factor.last + convert(arabic - factor.first)
end

describe "#convert" do
  it "should return the empty string for 0" do
    expect(convert(0)).to eq("")
  end
  
  {
    1 => "I",
    2 => "II",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    98 => "XCVIII"
  }.each do |arabic, expected_numeral|
    it "should convert #{arabic} to #{expected_numeral}" do
      expect(convert(arabic)).to eq(expected_numeral)
    end
  end
end
