require_relative("../spec_helper")

describe "Navigating static pages" do
  it "gets from root to about" do
    visit root_url
    click_link "About"

    expect(current_path).to eql(about_path)
  end

  it "gets from root to contact" do
    visit root_url
    click_link "Contact"

    expect(current_path).to eql(contact_path)
  end

  it "gets from root to signin" do
    visit root_url
    click_link "Sign In"

    expect(current_path).to eql(signin_path)
  end

  it "gets from root to signup" do
    visit root_url
    click_on "Sign Me Up!"

    expect(current_path).to eql(signup_path)
  end

  it "gets from about to signup" do
    visit about_url
    click_on "Sign Me Up!"

    expect(current_path).to eql(signup_path)
  end

end
