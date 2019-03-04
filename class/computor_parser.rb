class ComputorParser
  attr_reader :left_part, :right_part

  def initialize(whole_string)
    @whole_string = whole_string
    @left_part = ""
    @right_part = ""
    @error = ""
  end

  def show_string
    puts @right_part + "class"
  end

  def create_parts
    @left_part = @whole_string.match(/^.+?(?=\s*=)/)[0].gsub(/\s+/, '')
    @right_part = @whole_string.match(/(?<==).+/)[0].gsub(/\s+/, '')
  end

  def valid?
      @error = ("Should be one `=` sign") if @whole_string.scan(/=/).count != 1
      @error = ("Left part should contain only word characters") if !@left_part.scan(/\d+/).empty?
      @error.empty?
  end


  def errors
    puts @error
  end

  private


end
