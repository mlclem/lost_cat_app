RSpec.describe "Lost cats feature tests", type: :feature do
  context "With an emptpy notice board"  
    it "starts with no lost cats on the board" do
        visit '/lostcats'
        expect(page).to have_content "There are no lost cats. Good job!"
    end

    it "adds a lost cat and reports it" do
      visit 'lostcats'
      click_link "Add cat"
      fill_in "Name", with: "Gertrude"
      fill_in "Phone", with: "011121 123 456"
      fill_in "Description", with: "A large white cat who appears to be deaf (It meows very loudly)"
      
    end

end