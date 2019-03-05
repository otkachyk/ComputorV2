class Variable
  def self.print_variable(variable)
    if $variables.keys.any? { |key| key.include? variable }
      puts $variables[variable]
    else
      puts "NameError: undefined local variable #{variable}"
    end
  end
end
