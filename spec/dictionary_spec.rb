describe "Dictionary" do

  before do
    @dict = Dictionary.new
  end

  describe "#add_word" do

    it "has method defined" do
      Dictionary.method_defined?(:add_word).should == true
    end

    it "adds a word and generates 4-grams" do
      @dict.add_word("arrows")
      compare_hash = {"arro"=>["arrows"], "rrow"=>["arrows"], "rows"=>["arrows"]}
      @dict.should == compare_hash
    end

    it "adds duplicate words and generates 4-grams with a duplicate count" do
      @dict.add_word("baseball").add_word("football").add_word("ballista")
      @dict["ball"].should == ["baseball", "football", "ballista"]
    end

    it "won't add 4-grams that include an apostrophe" do
      @dict.add_word("homebrewer's")
      compare_hash = {"home"=>["homebrewer's"], "omeb"=>["homebrewer's"], "mebr"=>["homebrewer's"],
                      "ebre"=>["homebrewer's"], "brew"=>["homebrewer's"], "rewe"=>["homebrewer's"], "ewer"=>["homebrewer's"]}
      @dict.should == compare_hash
    end

    it "won't add 4-grams that include an integer(1)" do
      @dict.add_word("golfer123")
      compare_hash = {"golf"=>["golfer123"], "olfe"=>["golfer123"], "lfer"=>["golfer123"]}
      @dict.should == compare_hash
    end

    it "won't add 4-grams that include an integer(2)" do
      @dict.add_word("10th")
      compare_hash = {}
      @dict.should == compare_hash
    end

  end

  describe "#add_words" do

    it "has method defined" do
      Dictionary.method_defined?(:add_words).should == true
    end

    it "adds multiple words and generates 4-grams" do
      @dict.add_words("arrows", "carrots", "give", "me")
      @dict.length.should == 7
    end

  end

  describe "#unique_segments" do

    it "has method defined" do
      Dictionary.method_defined?(:unique_segments).should == true
    end

    it "adds duplicate words and retrieves unique 4-grams WITHOUT words" do
      @dict.add_words("arrows", "carrots", "give", "me")
      @dict.unique_segments.should == ["carr", "give", "rots", "rows", "rrot", "rrow"]
    end

    it "adds duplicate words and retrieves unique 4-grams WITH words" do
      @dict.add_words("arrows", "carrots", "give", "me")
      @dict.unique_segments(true).should == [["carr", ["carrots"]], ["give", ["give"]], ["rots", ["carrots"]],
                                             ["rows", ["arrows"]], ["rrot", ["carrots"]], ["rrow", ["arrows"]]]
    end

    it "adds duplicate words and retrieves unique 4-grams WITHOUT words IGNORING case" do
      @dict.add_words("arrows", "carrots", "Give", "me")
      @dict.unique_segments(false, true).should == ["carr", "Give", "rots", "rows", "rrot", "rrow"]
    end

    it "adds duplicate words and retrieves unique 4-grams WITH words NOT IGNORING case" do
      @dict.add_words("arrows", "carrots", "Give", "me")
      @dict.unique_segments(true).should == [["Give", ["Give"]], ["carr", ["carrots"]], ["rots", ["carrots"]],
                                             ["rows", ["arrows"]], ["rrot", ["carrots"]], ["rrow", ["arrows"]]]
    end

  end

end