require_relative("../spec_helper")

describe "User sign out" do
  it "shows the root after signing out" do
    u = User.create!(user_attributes)
    sign_in(u)
    click_link "Sign Out"

    expect(current_path).to eql(root_path)
    expect(page).to have_text("You Have Successfully Signed Out!")
    expect(page).to have_link("Sign In")
    expect(page).not_to have_link("Sign Out")
  end

end
