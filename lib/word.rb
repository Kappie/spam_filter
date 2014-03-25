require "data_mapper"

class Word
  include DataMapper::Resource

  property :word,     String, :key => true
  property :spam,     Integer
  property :notspam,  Integer
end