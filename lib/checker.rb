# frozen_string_literal: true

# Method to input the address from CSV
# There should be a method to format the response

# To-do:
# - import address from CSV
# - save API key safely

def run_welcome
  welcome_message
  run
end

def welcome_message
  puts "Welcome to Address Checker! Enter 'help' to see the help menu."
end

def help
  puts 'I accept the following commands:'
  puts '- help : displays this help message'
  puts '- exit : exits this program'
end

def exit_checker
  puts 'Thank you for using Address Checker. Goodbye.'
end

def run
  loop do
    puts 'Please enter address to validate:'
    users_response = gets.strip

    case users_response.downcase
    when 'help'
      help
    when 'exit'
      exit_checker
      break
    else
      puts 'Invalid entry'
    end
  end
end
