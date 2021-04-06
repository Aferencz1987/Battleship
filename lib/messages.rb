class Messages
  def initialize

  end

  def welcome_message
    "Welcome to BATTLESHIP.
    Enter p to play. Enter q to quit"
  end

  def place_ship_message
    "You will be playing against the computer! The computer will pick theres right now.\n Pick your cells by typing your selection below. \nA cruiser needs three cells. A submarie needs 2. The selections must be consecutive and not diagonal. \nHappy battling!"
  end

  def printz
    ">"
  end


  def invalid_placement_message
    "Nah bro, those coordinates aren't valid. Let's try again, shall we?"
  end

  def end_message
    #if ___COMPUTER___
    "Skynet for the win baby!"
    #elsif ______HUMAN___
    "Humans 1, AI 0!"
    #end
  end

  def quit_message
    "Okay fine! Go live your life."
  end
end
