require_relative "session"

class Track 
    attr_reader :number, :sessions, :morning_session, :evening_session
    
    def initialize(number)
        @number = number 
        @morning_session = Session.new("morning", 9, 13)
        @evening_session = Session.new("evening", 14, 17)
        @sessions = [@morning_session, @evening_session]
    end

    def get_schedule
        result = ""
        @sessions.each do |session|
          result += "#{session.name} session \n"
          result += session.get_talks_for_session
        end
        return result
    end
end
