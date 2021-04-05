class Game
  attr_reader :response
  def initialize
    @messages = Messages.new
    @response = ""
  end

  def start
     puts @messages.welcome_message +
      @messages.printz
      response = gets.chomp
      if response = 'p'
      #do game stuff
      elsif response = 'q'
        @messages.quit_message
    end
    response
  end

end
