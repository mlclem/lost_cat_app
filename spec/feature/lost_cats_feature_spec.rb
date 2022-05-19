RSpec.describe "Lost cats feature tests", type: :feature do
  context "With an emptpy notice board" do
    it "starts with no lost cats on the board" do
      visit '/lostcats'
      expect(page).to have_content "There are no lost cats. Good job!"
    end

    it "adds a single lost cat and reports it" do
      visit '/lostcats'
      click_link "Add a cat"
      fill_in "name", with: "Gertrude"
      fill_in "phone", with: "011121 123 456"
      fill_in "description", with: "A large white cat who appears to be deaf (They meow very loudly)"
      click_button "Submit"
      expect(page).to have_content "Gertrude"
      expect(page).to have_content "011121 123 456"
      expect(page).to have_content "A large white cat who appears to be deaf (They meow very loudly)"
    end

    it "adds multiple lost cats and reports them" do
      visit '/lostcats'
      click_link "Add a cat"
      fill_in "name", with: "Gertrude"
      fill_in "phone", with: "011121 123 456"
      fill_in "description", with: "A large white cat who appears to be deaf (They meow very loudly)"
      click_button "Submit"
      click_link "Add a cat"
      fill_in "name", with: "The Baron"
      fill_in "phone", with: "09875 456 321"
      fill_in "description", with: "A cat wearing a suit and tophat"
      click_button "Submit"
      click_link "Add a cat"
      fill_in "name", with: "Salem"
      fill_in "phone", with: "066606 666 666"
      fill_in "description", with: "A snarky black cat who knows magic"
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
      click_link "Add a cat"
      fill_in "name", with: "Gertrude"
      fill_in "phone", with: "011121 123 456"
      fill_in "description", with: "A large white cat who appears to be deaf (They meow very loudly)"
      click_button "Submit"
      click_link "Add a cat"
      fill_in "name", with: "The Baron"
      fill_in "phone", with: "09875 456 321"
      fill_in "description", with: "A cat wearing a suit and tophat"
      click_button "Submit"
      click_link "Add a cat"
      fill_in "name", with: "Salem"
      fill_in "phone", with: "066606 666 666"
      fill_in "description", with: "A snarky black cat who knows magic"
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
    click_link "Add a cat"
    fill_in "name", with: "Gertrude"
    fill_in "phone", with: "011121 123 456"
    fill_in "description", with: "A large white cat who appears to be deaf (They meow very loudly)"
    click_button "Submit"
    click_link "Add a cat"
    fill_in "name", with: "The Baron"
    fill_in "phone", with: "09875 456 321"
    fill_in "description", with: "A cat wearing a suit and tophat"
    click_button "Submit"
    click_link "Add a cat"
    fill_in "name", with: "Salem"
    fill_in "phone", with: "066606 666 666"
    fill_in "description", with: "A snarky black cat who knows magic"
    click_button "Submit"
    click_button "update 2"
    fill_in "name", with: "Tigger"
    fill_in "phone", with: "0800 808 303"
    fill_in "description", with: "A very springy cat"
    click_button "Save"
    expect(page).to have_content "Gertrude"
    expect(page).to have_content "011121 123 456"
    expect(page).to have_content "A large white cat who appears to be deaf (They meow very loudly)"
    expect(page).not_to have_content "The Baron"
    expect(page).not_to have_content "09875 456 321"
    expect(page).not_to have_content "A cat wearing a suit and tophat"
    expect(page).to have_content "Tigger"
    expect(page).to have_content "0800 808 303"
    expect(page).to have_content "A very springy cat"
  end
end
