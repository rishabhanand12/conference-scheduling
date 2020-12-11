class Session
    attr_reader : available_time_mins
    def initialize 
        @start_time = Time.new(2020,12,10,9,0,0)
        @end_time = Time.new(2020,12,10,16,59,59)
        @break_start = Time.new(2020,12,10,13,0,0)
        @break_end = Time.new(2020,12,10,14,0,0)
        @session_duration_mins = (@end_time - @start_time) / 60
        @break_duration_mins = (@break_end - @break_start) / 60
        @available_time_mins = @session_duration_mins - @break_duration_mins
        @session_talks = []
        # scheduler method(talk_list)/
    end

    def add_talks_to_session talks_list
        sorted_talks_list = talks_list.sort_by(&:duration)
        for i in sorted_talks_list
            if @available_time_mins >= sorted_talks_list[i].duration
                sorted_talks_list[i] << @session_talks
                @available_time_mins -= sorted_talks_list[i].duration
            else break
            end     
        end
    end

end





# main
track1 = session.new talk_list
track2 = session.new talk_list

