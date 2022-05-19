RSpec.describe "Lost cats feature tests", type: :feature do
  context "With an emptpy notice board" do
    it "starts with no lost cats on the board" do
      visit '/lostcats'
      expect(page).to have_content "There are no lost cats. Good job!"
    end

    it "adds a single lost cat and reports it" do
      visit '/lostcats'
      click_button "add cat"
      fill_in "name", with: "Gertrude"
      fill_in "phone", with: "011121 123 456"
      fill_in "description", with: "A large white cat who appears to be deaf (They meow very loudly)"
      fill_in "passwd", with: "Password1"
      click_button "Submit"
      expect(page).to have_content "Gertrude"
      expect(page).to have_content "011121 123 456"
      expect(page).to have_content "A large white cat who appears to be deaf (They meow very loudly)"
    end

    it "adds multiple lost cats and reports them" do
      visit '/lostcats'
      click_button "add cat"
      fill_in "name", with: "Gertrude"
      fill_in "phone", with: "011121 123 456"
      fill_in "passwd", with: "Password"
      fill_in "description", with: "A large white cat who appears to be deaf (They meow very loudly)"
      click_button "Submit"
      click_button "add cat"
      fill_in "name", with: "The Baron"
      fill_in "phone", with: "09875 456 321"
      fill_in "description", with: "A cat wearing a suit and tophat"
      fill_in "passwd", with: "Password1"
      click_button "Submit"
      click_button "add cat"
      fill_in "name", with: "Salem"
      fill_in "phone", with: "066606 666 666"
      fill_in "description", with: "A snarky black cat who knows magic"
      fill_in "passwd", with: "Password1"
      click_button "Submit"
      expect(page).to have_content "Gertrude"
      expect(page).to have_content "011121 123 456"
      expect(page).to have_content "A large white cat who appears to be deaf (They meow very loudly)"
      expect(page).to have_content "The Baron"
      expect(page).to have_content "09875 456 321"
      expect(page).to have_content "A cat wearing a suit and tophat"
      expect(page).to have_content "Salem"
      expect(page).to have_content "066606 666 666"
      expect(page).to have_content "A snarky black cat who knows magic"
    end
  end

  context "If there are existing lost cats" do
    it "A cat instance can be deleted" do
      visit '/lostcats'
      click_button "add cat"
      fill_in "name", with: "Gertrude"
      fill_in "phone", with: "011121 123 456"
      fill_in "description", with: "A large white cat who appears to be deaf (They meow very loudly)"
      fill_in "passwd", with: "Password1"
      click_button "Submit"
      click_button "add cat"
      fill_in "name", with: "The Baron"
      fill_in "phone", with: "09875 456 321"
      fill_in "description", with: "A cat wearing a suit and tophat"
      fill_in "passwd", with: "Password1"
      click_button "Submit"
      click_button "add cat"
      fill_in "name", with: "Salem"
      fill_in "phone", with: "066606 666 666"
      fill_in "description", with: "A snarky black cat who knows magic"
      fill_in "passwd", with: "Password1"
      click_button "Submit"
      click_button "delete 1"
      expect(page).to have_content "Gertrude"
      expect(page).to have_content "011121 123 456"
      expect(page).to have_content "A large white cat who appears to be deaf (They meow very loudly)"
      expect(page).not_to have_content "The Baron"
      expect(page).not_to have_content "09875 456 321"
      expect(page).not_to have_content "A cat wearing a suit and tophat"
      expect(page).to have_content "Salem"
      expect(page).to have_content "066606 666 666"
      expect(page).to have_content "A snarky black cat who knows magic"
    end
  end

  it "A cat instance can be updated" do
    visit '/lostcats'
    click_button "add cat"
    fill_in "name", with: "Gertrude"
    fill_in "phone", with: "011121 123 456"
    fill_in "description", with: "A large white cat who appears to be deaf (They meow very loudly)"
    fill_in "passwd", with: "Password1"
    click_button "Submit"
    click_button "add cat"
    fill_in "name", with: "The Baron"
    fill_in "phone", with: "09875 456 321"
    fill_in "description", with: "A cat wearing a suit and tophat"
    fill_in "passwd", with: "Password1"
    click_button "Submit"
    click_button "add cat"
    fill_in "name", with: "Salem"
    fill_in "phone", with: "066606 666 666"
    fill_in "description", with: "A snarky black cat who knows magic"
    fill_in "passwd", with: "Password1"
    click_button "Submit"
    click_button "update 2"
    fill_in "name", with: "Tigger"
    fill_in "phone", with: "0800 808 303"
    fill_in "description", with: "A very springy cat"
    fill_in "passwd", with: "Password1"
    click_button "Save"

    expect(page).to have_content "Gertrude"
    expect(page).to have_content "011121 123 456"
    expect(page).to have_content "A large white cat who appears to be deaf (They meow very loudly)"
    expect(page).to have_content "The Baron"
    expect(page).to have_content "09875 456 321"
    expect(page).to have_content "A cat wearing a suit and tophat"
    expect(page).not_to have_content "Salem"
    expect(page).not_to have_content "066606 666 666"
    expect(page).not_to have_content "A snarky black cat who knows magic"
    expect(page).to have_content "Tigger"
    expect(page).to have_content "0800 808 303"
    expect(page).to have_content "A very springy cat"
  end

  it "does not allowthe user to input HTML" do
    visit '/lostcats'
    click_button "add cat"
    fill_in "name", with: "LolCat"
    fill_in "phone", with: "707707 707 077"
    fill_in "description", with: "A dubious cat who's only in it for the evulz <button>EVULZ!!!!</button>"
    click_button "Submit"
    # save_and_open_page
    expect(page).not_to have_button('EVULZ!!!!')
  end

  context "If a user submits the correct password" do
    it "they can edit a cat on the notice board" do
      visit '/lostcats'
      click_button "add cat"
      fill_in "name", with: "LolCat"
      fill_in "phone", with: "707707 707 077"
      fill_in "description", with: "A most dubious cat"
      click_button "Submit"
      click_button "update 0"
      fill_in "passwd_in", with: "p1a2s3s3w4o5r6d7"
      fill_in "name", with: "Tigger"
      fill_in "phone", with: "0800 808 303"
      fill_in "description", with: "A very springy cat"
      fill_in "passwd", with: "Password1"
      click_button "Save"
      expect(page).to have_content "Tigger"
      expect(page).to have_content "0800 808 303"
      expect(page).to have_content "A very springy cat"
      expect(page).not_to have_content "LolCat"
      expect(page).not_to have_content "707707 707 077"
      expect(page).not_to have_content "A most dubious cat"
    end
  
    it "they can delete a cat from the notice board" do
      visit '/lostcats'
      click_button "add cat"
      fill_in "name", with: "LolCat"
      fill_in "phone", with: "707707 707 077"
      fill_in "description", with: "A dubious cat"
      click_button "Submit"
      click_button "update 0"
    end
  end

  context "if a user submits an incorrect password" do
    it "they cannot edit a cat on the notice board" do
      visit '/lostcats'
      click_button "add cat"
      fill_in "name", with: "LolCat"
      fill_in "phone", with: "707707 707 077"
      fill_in "description", with: "A dubious cat"
      click_button "Submit"
      click_button "update 0"
    end

    it "they cannot delete a cat from the notice board" do
      visit '/lostcats'
      click_button "add cat"
      fill_in "name", with: "LolCat"
      fill_in "phone", with: "707707 707 077"
      fill_in "description", with: "A dubious cat"
      click_button "Submit"
      click_button "update 0"
    end
  end
end
