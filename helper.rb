module Helper
  COMPUTER = "COMPUTER"
  ATTEMPTS = 6
  PLAY = 0
  SAVE_QUIT = 1
  QUIT = 2
  CONTINUE = 3

  def show_options
    options = [
               "Play",
               "Save and Quit",
               "Quit",
               "Continue Game"
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
end
