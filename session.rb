class Session
    attr_reader :talks, :start_time, :name
  
    def initialize(name, start_time, end_time)
      @name = name.capitalize
      @start_time = Time.new(2020,12,11,start_time,0,0)
      @end_time = Time.new(2020,12,11,end_time,0,0)
      @talks = []
    end
  
    def add_talks_to_session (talk_list)
      time_remaining = (@end_time - @start_time) / 60
      while(!talk_list.empty?)
        if(talk_list.first.duration > time_remaining) 
          break
        else 
          talks << talk_list.first
          time_remaining -= talk_list.first.duration
          talk_list.delete(talk_list.first)
        end
      end
      return talk_list
    end

    def get_talks_for_session
      result = ""
      time = @start_time
      @talks.each do |talk|
        result +=  "#{time.hour}:#{time.min} #{time.hour<12? "AM" : "PM"} #{talk.topic} \n"
        time = time + talk.duration * 60
      end
      return result
    end
  end
