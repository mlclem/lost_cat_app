class NoticeBoard
  def initialize
    @board_array = []
  end

  def report
    return @board_array
  end

  def add(cat)
    @board_array << cat
  end
end
