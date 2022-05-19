class NoticeBoard
  def initialize
    @board_array = []
  end

  # Read - list all
  def report
    return @board_array
  end

  # Create - add Cat instance
  def add(cat)
    @board_array << cat
  end

  # Delete - Remove Cat instance at index
  def remove(index)
    @board_array.delete_at(index)
  end
end
