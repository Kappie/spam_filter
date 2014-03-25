module SpamFilter
  class Message
    def initialize(params)
      @text = params[:text]
    end

    def word_count
      words.each_with_object(Hash.new(0)) do |word, counts|
        counts[word] += 1;
      end
    end

    private

    def words
      @text.downcase.scan(/\w+/)
    end

  end
end