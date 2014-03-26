require_relative "../lib/word"
DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.finalize
DataMapper.auto_migrate!

describe "A word" do
  it "recognizes its columns" do
    word = SpamFilter::Word.new
    expect(word.respond_to? "word").to eq true
    expect(word.respond_to? "spam").to eq true
    expect(word.respond_to? "notspam").to eq true
  end

  it "has the word as primary key" do
    word = SpamFilter::Word.create(word: "buy")
    expect(word).to eq SpamFilter::Word.get("buy")
  end

  it "has a default value of 0 for labels" do
    word = SpamFilter::Word.new
    expect(word.spam).to eq 0
    expect(word.notspam).to eq 0
  end
end