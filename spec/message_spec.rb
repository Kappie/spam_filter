require_relative "../lib/spam_filter/message"

describe "A message" do
  it "returns the word count" do
    message = SpamFilter::Message.new({text: "Buy buy shit"})
    expect(message.word_count).to eq( {"buy" => 2, "shit" => 1} )    
  end

  it "filters out punctuation and garbage" do
    message = SpamFilter::Message.new({text: "buy buy shit %%^*("})
    expect(message.word_count).to eq( {"buy" => 2, "shit" => 1} )
  end

  it "filters out the most commonly used words" do
    message = SpamFilter::Message.new(text: "I like fucking")
    expect(message.word_count).to eq( { "fucking" => 1 } )
  end

end