require 'readline'
require './class/computor_parser'
require './class/instance'
require './class/expression'
require './class/variable'
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

# def recursive_hash(a, expression)
#   begin
#     if expression.right_part.chars.any? { |char| a.keys.any? { |key| key.include? char } }
#       puts "here"
#       expression.right_part = a[expression.right_part]
#       recursive_hash(a, expression)
#     else
#       expression.right_part
#     end
#   rescue SystemStackError
#     puts "Seems like endless recursion"
#   end
# end

def parse_string(string)
    # if string.scan(/=/).count > 0
    #   expression = ComputorParser.new(string)
    #   expression.create_parts
    #
    #   if expression.valid?
    #     @variables[expression.left_part] = recursive_hash(@variables, expression)
    #     puts @variables
    #   else
    #     puts expression.errors
    #   end
    # end
    #
    #
    # if @variables.include? expression.left_part
    #   puts @variables[string]
    # else
    #   puts "Variable #{string} is undefined"
    # end
    instance = Instance.new string

    if instance.variable?
      Variable.print_variable(string)
    elsif instance.expression?
      expression = Expression.new string

      if expression.valid?
        expression.create_parts
        puts expression.right_part
      else
        puts expression.errors
      end
    end
end





def check_commands(input)
  case input
  when 'clear'
    $variables.clear
    puts "Clearing all data"
  when 'Exit', 'exit', 'e', '\e', 'q', 'quit', 'Quit'
    abort("Exiting... Bye bye")
  when ''
    '-----------'
  when 'show'
    puts $variables
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
$variables = {}
puts "Welcome to ComputorV2"
while input = Readline.readline("-> ", true)
  print("-> ", check_commands(input), "\n")
  parse_string(input) unless input.empty?
end

#------------------------------------------------------#
