# Create a cheat sheet project to help learn terminal commands.

# Objectives:
#  1. Create a menu that takes in a user input
#   a. 1. Command Line 2. IDE 3. Search 4. Quit
#   b. Based on user choice go to a 2nd menu
#  2. When command line is chosen display a list of command line options
#    a. Also supply a way for the user to get back to the main menu
#    b. When a comand line menu option is selected display the man pages for that option
#  3. When the IDE menu is chosen list shortcut options
#    a. When a shortcut is chosen display more information about the shortcut
#    b. Also provide a way for the user to get back to the main menu
# BONUS:
#   Allow the user to search.  When a command is entered into the search show the man pages for that command.

# main menu
# have a case statement for main menu options
# command line menu
# ide menu
# search menu

def command_line_menu
  selection = 0
  while selection != 5
    puts '****** Command Lines Cheats ******'
    puts '1. Copy - cp - cp path/to/file path/to/destination'
    puts '2. Move - mv - mv path/to/file path/to/destination'
    puts '3. Make directory - mkdir - mkdir path/name/of/directory'
    puts '4. Search More Commands'
    puts '5. Main Menu'
    puts "Make a selection:"
    selection = gets.to_i
    case selection
    when 1 
      puts `man cp`
    when 2
      puts `man mv`
    when 3
      puts `man mkdir`
    when 4
      search_menu
    when 5
    else 
      puts 'That is not an option. Try again.'
    end
  end
end

def sublime_menu # google ide shortcuts
  selection = 'no'
  while selection == 'no'
    puts """ ****** Sublime Shortcuts ******
      1. ⌘ + X = cut line
      2. ⌘ + L = select line
      3. ⌘ + D = select word
      4. ⌘ + ] = indent current line(s)
      5. ⌘ + [ = un-indent current line(s)
      6. ⌘ + / = comment/uncomment current line(s)
      7. ⌘ + F = find
      """
    puts 'Return to main menu?'
    selection = gets.strip.downcase
  end
end

def search_menu
  puts '****** Search ******'
  puts 'Enter a command:'
  cmd = gets.strip
  puts `man #{cmd}`
  puts 'Search again?'
  if gets.strip.downcase == 'yes'
    search_menu
  end
end


def main_menu
  selection = 0
  while selection != 4
    puts '****** My Cheatsheet ******'
    puts '1. Command Line'
    puts '2. Sublime'
    puts '3. Search'
    puts '4. Quit'
    puts 'Make a selection:'
    selection = gets.to_i
    case selection
    when 1 
      command_line_menu
    when 2
      sublime_menu
    when 3
      search_menu
    when 4
      puts 'Goodbye'
      exit 0
    else
      puts 'That is not an option. Try again.'
    end
  end
end

main_menu







