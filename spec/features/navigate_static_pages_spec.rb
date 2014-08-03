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
end
