module SpamFilter
  class Brain
    def initialize(db)
      @db = db;
    end

    def learn(params)
      message, type = params[:message], params[:type]      
    end
  end 
end