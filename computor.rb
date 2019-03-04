require 'readline'
require './class/computor_parser'
#
# def check_for_brackets(string)
#   # brackets = ['[', ']', '(', ')']
#   arr = string.gsub(' ', '').split('')
#   puts "arr = #{arr}"
# end
#
# def validate_input(string)
#   check_for_brackets(string)
#
# end
#

# def validate_string(string)
#   e = ("Should be one `=` sign") if string.scan(/=/).count != 1
#   e
# end

def recognize_input(string)
  # if right part has 'x' then it is an function
  # if right part has no 'x' but has '+-*()/' then it is a postfix shit
  # if right part has only digits then it is a variable
###  # if right part contains [] it might be a matrix
end

def recursive_hash(a, string)
  begin
    if a.has_key?(a[string])
      recursive_hash(a, a[string])
    else
      a[string]
    end
  rescue SystemStackError
    puts "Seems like endless recursion"
  end
end

def parse_string(string)
    if string.scan(/=/).count > 0
      expression = ComputorParser.new(string)
      expression.create_parts

      if expression.valid?
        @variables[expression.left_part] = expression.right_part
        puts @variables
      else
        puts expression.errors
      end
    else
        puts recursive_hash(@variables, string)
    end
end





def check_commands(input)
  case input
  when 'clear'
    @variables.clear
    puts "Clearing all data"
  when 'Exit', 'exit', 'e', '\e', 'q', 'quit', 'Quit'
    abort("Exiting... Bye bye")
  when ''
    '-----------'
  end
end


#-------------------------------------------------------#
#-------------------------------------------------------#
#-------------------------------------------------------#
#-------------------------------------------------------#
#----------------------MAIN PART------------------------#
#-------------------------------------------------------#
#-------------------------------------------------------#
#-------------------------------------------------------#
#-------------------------------------------------------#


#------------------ Catches Ctrl + C ------------------#
stty_save = `stty -g`.chomp
trap("INT") { system "stty", stty_save; exit }
#------------------ ---------------- ------------------#

#-------------------- Main loop -----------------------#
@variables = {}
puts "Welcome to ComputorV2"
while input = Readline.readline("-> ", true)
  print("-> ", check_commands(input), "\n")
  parse_string(input) unless input.empty?
end

#------------------------------------------------------#
