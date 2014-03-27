require_relative "spam_filter/brain"
require_relative "spam_filter/word"
require_relative "spam_filter/message"

# setup takes an absolute path!
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/words.db")
DataMapper.finalize
DataMapper.auto_upgrade!