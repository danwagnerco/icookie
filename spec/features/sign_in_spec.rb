require_relative("../spec_helper")

describe "User sign in" do

  before do
    @user = User.create!(user_attributes)
  end

  context "successfully" do
    it "shows the users profile page" do
      visit signin_url
      sign_in(@user)

      expect(current_path).to eql(user_path(@user))
      expect(page).to have_text("Welcome back #{@user.first_name}!")
    end

    it "shows sign out in nav" do
      visit signin_url
      sign_in(@user)

      expect(page).to have_link("Sign Out")
    end      

    it "shows the users name in nav" do
      visit signin_url
      sign_in(@user)

      expect(page).to have_link("#{@user.first_name}")
    end

    it "shows account settings in nav" do
      visit signin_url
      sign_in(@user)

      expect(page).to have_link("Account Settings")
    end

    it "does not show sign in" do
      visit signin_url
      sign_in(@user)

      expect(page).not_to have_link("Sign In")
    end
    
    it "gets to edit page from account settings" do
      visit signin_url
      sign_in(@user)
      click_link "Account Settings"

      expect(current_path).to eql(edit_user_path(@user))
    end
  end

  context "unsuccessfully" do
    it "redirects a bad sign in" do
      visit signin_url
      fill_in "email",    :with => "fakedude@fake.com"
      fill_in "password", :with => "whitewine"
      click_button "Sign In"

      expect(current_path).to eql(session_path)
      expect(page).to have_text("Invalid Email/Password Combination!")
    end
  end

end
