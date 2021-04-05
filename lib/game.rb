class Game
  def initialize
    messages = Messages.new
  end

  def start
    p messages.welcome_message
  end
end
