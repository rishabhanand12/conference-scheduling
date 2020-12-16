require_relative "talk_list"
require_relative "conference"

conference = Conference.new
conference.create_tracks(2)
conference.prepare_schedule(TalkList::Talks)
conference.show_itinerary