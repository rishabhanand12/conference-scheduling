require_relative "track"

class Conference 
  def initialize 
    # @track_1 = Track.new(1)
    # @track_2 = Track.new(2)
    # @sessions = [@track_1.morning_session, @track_1.evening_session, @track_2.morning_session, @track_2.evening_session]
    @tracks = []
    @unscheduled_talks = []
  end

  def prepare_schedule (talk_list)
    track_1 = Track.new(1)
    track_2 = Track.new(2)
    @tracks.push(track_1, track_2)
    sessions = [@track_1.morning_session, @track_1.evening_session, @track_2.morning_session, @track_2.evening_session]
    index = 0
    @unscheduled_talks = talk_list
    while(!@unscheduled_talks.empty?) 
      @unscheduled_talks = sessions[index].add_talks_to_session (@unscheduled_talks)
      index += 1
      if(index > sessions.length-1)
        break
      end
    end
  end

  def show_itinerary
    result = ""
    @tracks.each do |track| 
      result += "Track #{track.number} \n"
      track.sessions.each do |session|
        if !session.talks.empty? 
          talks.each do |talk|
            time = session.start_time
            result += "#{session.time.hour}: #{session.time.min} talk.topic \n" 
            time += talk.duration * 60
          end
      end 
    end
  end
  puts result
end