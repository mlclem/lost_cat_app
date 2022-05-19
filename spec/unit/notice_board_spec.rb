require 'cat'
require 'notice_board'

RSpec.describe NoticeBoard do
  it "A single Cat instance can be added to the notice board" do
    board = NoticeBoard.new
    tabby = Cat.new("Bob", "01423 225 687", "A an old male Tabby with a collar and tag","password")
    board.add(tabby)
    expect(board.report).to eq [tabby]
  end

  it "Multiple Cat istances can be added to the notice board" do
    neue_board = NoticeBoard.new
    ginger = Cat.new("Larry", "079454 355 467", "A small ginger cat with a judging glare","password")
    bengal = Cat.new("Doris", "071246 384 472", "A young stripey cat with knack for breaking things","password")
    persian = Cat.new("Prince", "01468 147 465", "A very fluffy cat, good at getting stuck in small spaces","password")
    neue_board.add(ginger)
    neue_board.add(bengal)
    neue_board.add(persian)
    expect(neue_board.report).to eq [
      ginger,
      bengal,
      persian
    ]
  end

  it "removes specified Cat instance from the notice board" do
    delete_board = NoticeBoard.new
    thunder = Cat.new("Larry", "079454 355 467", "A small ginger cat with a judging glare","password")
    lightning = Cat.new("Doris", "071246 384 472", "A young stripey cat with knack for breaking things","password")
    rain = Cat.new("Prince", "01468 147 465", "A very fluffy cat, good at getting stuck in small spaces","password")
    delete_board.add(thunder)
    delete_board.add(lightning)
    delete_board.add(rain)
    delete_board.remove(0)
    expect(delete_board.report).to eq [
      lightning,
      rain
    ]
  end

  it "Returns a single Cat instance specified by index" do
    get_board = NoticeBoard.new
    thunder = Cat.new("Larry", "079454 355 467", "A small ginger cat with a judging glare","password")
    lightning = Cat.new("Doris", "071246 384 472", "A young stripey cat with knack for breaking things","password")
    rain = Cat.new("Prince", "01468 147 465", "A very fluffy cat, good at getting stuck in small spaces","password")
    get_board.add(thunder)
    get_board.add(lightning)
    get_board.add(rain)
    expect(get_board.get(0)).to eq thunder
  end

  it "Updates a single Cat instance specified by index" do
    up_board = NoticeBoard.new
    smol_cat = Cat.new("Tiny", "00001 111 111", "An impossibly small kitten","password")
    big_cat = Cat.new("General chonkington", "08999 978 878", "The general needs some exercise","password")
    up_board.add(smol_cat)
    up_board.add(big_cat)
    slim_cat = Cat.new("General slim", "0123 123 432", "The general has cut out the treats","password")
    up_board.update(1,slim_cat)
    expect(up_board.report).to eq [
      smol_cat,
      slim_cat
    ]
  end
end
