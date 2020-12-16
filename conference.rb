require_relative "track"

class Conference 
  def initialize 
    @tracks = []
    @unscheduled_talks = []
  end

  def create_tracks (num)
    num.times do |i|
      @tracks << Track.new(i+1)
    end
  end

  def prepare_schedule (talk_list)
    @unscheduled_talks = talk_list.sort_by(&:duration)
    while(!@unscheduled_talks.empty?) 
      @tracks.each do |track|
        @unscheduled_talks = track.morning_session.add_talks_to_session(@unscheduled_talks)
        @unscheduled_talks = track.evening_session.add_talks_to_session(@unscheduled_talks)
        if(@unscheduled_talks.empty?) 
          break
        end
      end
    end
  end

  def show_itinerary
    result = ""
    @tracks.each do |track| 
      result += "Track #{track.number} \n"
      result += track.get_schedule
    end
    puts result
    show_unscheduled_talks
  end

  def show_unscheduled_talks
    if (!@unscheduled_talks.empty?) 
      @unscheduled_talks.each |talk|
      puts talk.topic
    end
  end

end