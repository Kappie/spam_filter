module SpamFilter
  class Brain
    def self.learn(params)
      new.learn(params)
    end

    def learn(params)
      message, type = params[:message], params[:type]
      
      message.word_count.each do |word, count|
        update_counts(word, count, type)
      end
    end

    private

    def update_counts(word, count, type)
      record = Word.first_or_create(word: word)
      record.update(type => record.send(type) + count)
    end
  end
end