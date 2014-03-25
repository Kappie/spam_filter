require_relative "../lib/message"

describe "A message" do
  it "returns the word count" do
    message = SpamFilter::Message.new({text: "Buy buy my shit"})
    expect(message.word_count).to eq({"buy" => 2, "my" => 1, "shit" => 1})    
  end

  it "filters out punctuation and garbage" do
    message = SpamFilter::Message.new({text: "Hi, would you like shit? %%^*("})
    expect(message.word_count).to eq({"hi" => 1, "would" => 1, "you" => 1, "like" => 1, "shit" => 1})
  end

end