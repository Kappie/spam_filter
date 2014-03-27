module SpamFilter
  class Message
    MOST_COMMON_WORDS = File.read("assets/most_used_words_english.txt").downcase.split("\n")

    def initialize(params)
      @text = params[:text]
    end

    def word_count
      uncommon_words.each_with_object(Hash.new(0)) do |word, counts|
        counts[word] += 1;
      end
    end

    private

    def words
      @text.downcase.scan(/\w+/)
    end

    def uncommon_words
      words - MOST_COMMON_WORDS
    end
  end
end