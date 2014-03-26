require_relative "helpers"
require_relative "../lib/brain"
require_relative "../lib/message"
require_relative "../lib/word"

describe "The brain" do
  before :all do
    setup_memory_db
  end

  before :each do
    SpamFilter::Word.destroy
  end

  describe "#learn" do
    it "stores the words of a message" do
      message = SpamFilter::Message.new(text: "buy my shit")
      SpamFilter::Brain.learn(message: message, type: :spam)
      expect( SpamFilter::Word.get("buy").spam ).to eq 1
    end

    it "updates the counts for words it already knows" do
      message1 = SpamFilter::Message.new(text: "buy my shit")
      message2 = SpamFilter::Message.new(text: "buy it please")
      SpamFilter::Brain.learn(message: message1, type: :spam)
      SpamFilter::Brain.learn(message: message2, type: :spam)
      expect( SpamFilter::Word.get("buy").spam ).to eq 2
    end
  end
end