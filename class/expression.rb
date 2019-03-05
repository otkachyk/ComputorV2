class Expression
  attr_accessor :left_part, :right_part
  def initialize(string)
    @expression = string
    @left_part = ''
    @right_part = ''
    @error = ""
  end

  def create_parts
      @left_part = @expression.match(/^.+?(?=\s*=)/)[0].gsub(/\s+/, '')
      @right_part = @expression.match(/(?<==).+/)[0].gsub(/\s+/, '')

      $variables[@left_part] = @right_part

      convert_variables_to_numbers
      $variables[@left_part] = @right_part
      simplify_right_part
  end

  def valid?
      @error = ("Should be one `=` sign") if @expression.scan(/=/).count != 1
      @error = ("Left part should contain only word characters") if !@left_part.scan(/\d+/).empty?
      @error.empty?
  end

  def errors
    puts @error
  end

  private

  def convert_variables_to_numbers
    $variables.keys.each do |key|
      if @right_part.include? key
        @right_part = @right_part.gsub(/#{key}/, $variables[key])
      end
    end
  end

  def simplify_right_part
    @right_part = eval @right_part
  end

end
