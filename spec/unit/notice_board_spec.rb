require 'cat'
require  'notice_board'

RSpec.describe NoticeBoard do
  it "A single Cat instance can be added to the notice board" do
    board = NoticeBoard.new
    tabby = Cat.new()
    board.add(tabby)
    expect(board.report).to eq [tabby]
  end

  it "Multiple cat istances can be added to the notice board" do
    neue_board = NoticeBoard.new
    ginger = Cat.new
    bengal = Cat.new
    persian = Cat.new
    neue_board.add(ginger)
    neue_board.add(bengal)
    neue_board.add(persian)
    expect(neue_board.report).to eq [
      ginger,
      bengal,
      persian
    ]
  end

end