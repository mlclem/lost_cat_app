require 'cat'
require 'notice_board'

RSpec.describe NoticeBoard do
  it "A single Cat instance can be added to the notice board" do
    board = NoticeBoard.new
    tabby = Cat.new("Bob", "01423 225 687", "A an old male Tabby with a collar and tag")
    board.add(tabby)
    expect(board.report).to eq [tabby]
  end

  it "Multiple cat istances can be added to the notice board" do
    neue_board = NoticeBoard.new
    ginger = Cat.new("Larry", "079454 355 467", "A small ginger cat with a judging glare")
    bengal = Cat.new("Doris", "071246 384 472", "A young stripey cat with knack for breaking things")
    persian = Cat.new("Prince", "01468 147 465", "A very fluffy cat, good at getting stuck in small spaces")
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
