class Track 
    attr_reader :number, :sessions, :morning_session, :evening_session
    
    def initialize(number)
        @number = number 
        @morning_session = Session.new(9,13)
        @evening_session = Session.new(14,17)
        @sessions = [@morning_session, @evening_session]
    end
end
