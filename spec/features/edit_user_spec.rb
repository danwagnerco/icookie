require_relative("../spec_helper")

describe "Editing a user" do

  it "Changes a newly-created users first name" do
    visit signup_url

    fill_in "user[first_name]",            :with => "First"
    fill_in "user[last_name]",             :with => "Last"
    fill_in "user[zip]",                   :with => "12345"
    fill_in "user[email]",                 :with => "test@test.com"
    fill_in "user[password]",              :with => "secret"
    fill_in "user[password_confirmation]", :with => "secret"
    choose("The Whole Enchilada")
    
    click_button "Sign Up"
    click_link "Account Settings"

    fill_in "user[first_name]",            :with => "First2"

    click_button "Update Account"

    expect(current_path).to eql(user_path(User.last))
    expect(page).to have_text("First2")
    expect(page).to have_text("Account Successfully Updated!")
  end

  it "Logs in and changes a users email"
  
end