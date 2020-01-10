module Helper
  COMPUTER = "COMPUTER"
  ATTEMPTS = 6
  NEW_GAME = 0
  SAVE_QUIT = 1
  QUIT = 2
  RESTORE = 3
  GAME_FILE = ".prev_game.json"

  def show_options
    options = [
               "New Game",
               "Save and Quit",
               "Quit",
               "Restore Game"
              ]

    options.each_with_index do |option, index|
      print "[#{index} - #{option}]\t"
    end
    puts
  end

  def get_selected
    input = ''

    loop do
      input = gets.chomp
      if input.match(/[0-3]/)
        break
      else
        puts "Invalid option. Try again."
      end
    end

    input.to_i
  end

  def prev_game_saved?
    File.exist?(GAME_FILE)
  end

  def save_to_file(data)
    File.open(GAME_FILE, 'w+') do |f|
      Marshal.dump(data, f)
    end
  end

  def load_from_file
    File.open(GAME_FILE, 'r') do |f|
      Marshal.load(f)
    end
  end
end
