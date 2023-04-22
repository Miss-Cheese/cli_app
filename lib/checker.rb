# frozen_string_literal: true

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
    puts 'Please enter a command:'
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
