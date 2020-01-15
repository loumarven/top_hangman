module Helper
  COMPUTER = "COMPUTER"
  ATTEMPTS = 6
  NEW_GAME = 0
  SAVE_QUIT = 1
  QUIT = 2
  RESTORE = 3
  NOT_PLAYING = 0
  PLAYING = 1
  GAME_FILE = ".prev_game"

  def show_options(game_state)
    options = [
               "New Game",
               "Save and Quit",
               "Quit"
              ]

    options << "Restore Game" if prev_game_saved? && game_state == NOT_PLAYING

    puts
    options.each_with_index do |option, index|
      print "[#{index} - #{option}]\t"
    end
    puts
  end

  def get_input(game_state)
    input = ''

    if game_state == PLAYING
      message = "Enter guess letter or game option: "
    else
      message = "Enter game option: "
    end

    loop do
      puts
      print message
      input = gets.chomp
      if valid?(input, game_state)
        break
      else
        puts "Invalid input. Try again."
      end
    end

    input
  end

  def delete_saved_game
    File.delete(GAME_FILE) if prev_game_saved?
  end

  def save_game(data)
    File.open(GAME_FILE, 'w+') do |f|
      Marshal.dump(data, f)
    end
  end

  def load_saved_game
    File.open(GAME_FILE, 'r') do |f|
      Marshal.load(f)
    end
  end

  private
  def valid?(input, game_state)
    return false if input.length > 1

    if game_state == NOT_PLAYING
      return true if input.match(/[0-3]/)
    elsif game_state == PLAYING
      return true if input.match(/[0-3a-z]/)
    end

    false
  end

  def prev_game_saved?
    File.exist?(GAME_FILE)
  end
end
