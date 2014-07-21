describe "String" do

  describe "#ngrams" do

    it "has method defined" do
      String.method_defined?(:ngrams).should == true
    end

    it "has 4-grams for first value" do
      "arrows".ngrams(4).should == ["arro", "rrow", "rows"]
    end
  
    it "has 4-grams for second value" do
      "carrots".ngrams(4).should == ["carr", "arro", "rrot", "rots"]
    end

    it "has 4-grams for third value" do
      "give".ngrams(4).should == ["give"]
    end

    it "has NO 4-grams for fourth value" do
      "me".ngrams(4).should == []
    end

  end

end