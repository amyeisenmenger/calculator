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
    @menus[:command_line].each {|num, value| puts "#{num} #{value[:text]}"}
    puts "Make a selection:"
    selection = gets.strip
    case selection
    when '1', '2', '3'
      @menus[:command_line][selection][:method].call(@menus[:command_line][selection][:cmd])
    when '4', '5'
      @menus[:command_line][selection][:method].call
    else 
      puts 'That is not an option. Try again.'
    end
  end
end

def sublime_menu # google ide shortcuts
  selection = 'no'
  while selection == 'no'
    puts " ****** Sublime Shortcuts ****** "
    @menus[:sublime].each { |num, value| puts "#{num} #{value[:text]}" }
    puts 'Return to main menu?'
    selection = gets.strip.downcase
  end
end

def search_menu(search, main)
  puts '****** Search ******'
  puts 'Enter a command:'
  cmd = gets.strip
  search.call(cmd)
  puts 'Search again?'
  if gets.strip.downcase == 'yes'
    search_menu(search, main)
  else
    main
  end
end

cmd_line = -> { command_line_menu }
quit = -> { exit(0) }
main = -> { main_menu }
sbl = -> { sublime_menu }
search = -> (cmd) { puts `man #{cmd}`}
srch = -> { search_menu(search, main) }


menus = {
  main: {
    '1'=> {text: 'Command Line', method: cmd_line },
    '2'=> {text: 'Sublime', method: sbl },
    '3'=> {text: 'Search', method: srch },
    '4'=> {text: 'Quit', method: quit }
  },

  command_line: {
    '1'=> {text: 'Copy - cp - cp path/to/file path/to/destination', method: search, cmd: 'cp' },
    '2'=> {text: 'Move - mv - mv path/to/file path/to/destination', method: search, cmd: 'mv' },
    '3'=> {text: 'Make directory - mkdir - mkdir path/name/of/directory', method: search, cmd: 'mkdir' },
    '4'=> {text: 'Search More Commands', method: srch},
    '5'=> {text: 'Main Menu', method: main}
  },

  sublime: {
    '1': {text: '⌘ + X = cut line'},
    '2': {text: '⌘ + L = select line'},
    '3': {text: '⌘ + D = select word'},
    '4': {text: '⌘ + ] = indent current line(s)'},
    '5': {text: '⌘ + [ = un-indent current line(s)'},
    '6': {text: '⌘ + / = comment/uncomment current line(s)'},
    '7': {text: '⌘ + F = find'},
    '8': {text: 'Main Menu'}
  }
}
@menus = menus

def main_menu
  selection = 0
  while selection != 4
    puts '****** My Cheatsheet ******'
    @menus[:main].each { |num, value| puts "#{num}: #{value[:text]}" } 
    puts 'Make a selection:'
    selection = gets.strip
    case selection
    when '1', '2', '3', '4' 
      @menus[:main][selection][:method].call
    else
      puts 'That is not an option. Try again.'
    end
  end
end


main_menu

