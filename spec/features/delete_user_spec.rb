require_relative("../spec_helper")

describe "Deleting a user" do

  before do
    @user = User.create!(user_attributes)
    sign_in(@user)
  end

  it "destroys the user and returns to root" do
    click_link "Delete Account"

    expect(current_path).to eql(root_path)
    expect(page).to have_text("Account Successfully Deleted!")
  end

  it "signs the user out when deleting account" do
    click_link "Delete Account"

    expect(page).to have_link("Sign In")
    expect(page).not_to have_link("Sign Out")
  end

end
