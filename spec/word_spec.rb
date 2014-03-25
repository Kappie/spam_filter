require_relative "../lib/word"

describe "A word" do
  DataMapper.setup(:default, 'sqlite::memory:')
  DataMapper.finalize
  DataMapper.auto_migrate!

  it "reads the spam count" do
    word = Word.create(word: "buy", spam: 1, notspam: 0)
    expect(word.spam).to eq 1
  end
end