class Talk
  attr_reader :topic, :duration

  def initialize(topic, duration)
    @topic = topic
    @duration = duration
  end
end
