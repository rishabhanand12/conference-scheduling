class Session
    attr_reader :talks, :start_time
  
    def initialize(start_time, end_time)
      @start_time = Time.new(2020,12,11,start_time,0,0)
      @end_time = Time.new(2020,12,11,end_time,0,0)
      @duration_in_mins = (@start_time-@end_time) / 60
      @talks = []
    end
  
    def add_talks_to_session (talk_list)
      time_remaining = @duration
      while(!talk_list.empty?)
        if(talk_list.first.duration > time_remaining) 
          break
        else 
          talks << talk_list[i]
          time_remaining -= talk_list.first.duration
          talk_list.delete(talk_list.first)
        end
      end
      return talk_list
    end
  end