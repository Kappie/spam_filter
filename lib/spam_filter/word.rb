require "data_mapper"

module SpamFilter
  class Word
    include DataMapper::Resource

    property :word,     String, key: true
    property :spam,     Integer, default: 0
    property :notspam,  Integer, default: 0
  end
end