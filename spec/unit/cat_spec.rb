require 'cat'

RSpec.describe Cat do
  it "contructs correctly" do
    jess = Cat.new("Jesse", "07489 281 982", "A black & white cat, found near post box")
    expect(jess).to eq jess
    
  end
  
  it "Cat instance variables can be returned" do
    jess = Cat.new("Jesse", "07489 281 982", "A black & white cat, found near post box")
    expect(jess.name).to eq "Jesse"
    expect(jess.phone).to eq "07489 281 982"
    expect(jess.description).to eq (
      "A black & white cat, found near post box"
    )
  end
end
