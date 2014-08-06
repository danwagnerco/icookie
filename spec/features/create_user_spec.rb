require_relative("../spec_helper")

describe "Creating a new user" do
	context "bad input to form" do
		it "error on blank first name" do
			visit signup_url # new_user_url
			
			fill_in "user[first_name]", :with => ""
			fill_in "user[last_name]",  :with => "Last"
			fill_in "user[zip]",        :with => "12345"
			fill_in "user[email]",      :with => "test@test.com"
			choose("The Whole Enchilada")
			click_on "Sign Up"

			expect(page).to have_text("can't be blank")
		end

		it "error on blank last name" do
			visit signup_url

			fill_in "user[first_name]", :with => "First"
			fill_in "user[last_name]",  :with => ""
			fill_in "user[zip]",        :with => "12345"
			fill_in "user[email]",      :with => "test@test.com"
			choose("The Whole Enchilada")
			click_on "Sign Up"

			expect(page).to have_text("can't be blank")
		end

		it "error on too-short zip code" do
			visit signup_url

			fill_in "user[first_name]", :with => "First"
			fill_in "user[last_name]",  :with => "Last"
			fill_in "user[zip]",        :with => "12"
			fill_in "user[email]",      :with => "test@test.com"
			choose("The Whole Enchilada")
			click_on "Sign Up"

			expect(page).to have_text("must be exactly 5 digits long")
		end

		it "error on too-long zip code" do
			visit signup_url

			fill_in "user[first_name]", :with => "First"
			fill_in "user[last_name]",  :with => "Last"
			fill_in "user[zip]",        :with => "123456789"
			fill_in "user[email]",      :with => "test@test.com"
			choose("The Whole Enchilada")
			click_on "Sign Up"

			expect(page).to have_text("must be exactly 5 digits long")
		end

		it "error on non-digit zip code" do
			visit signup_url

			fill_in "user[first_name]", :with => "First"
			fill_in "user[last_name]",  :with => "Last"
			fill_in "user[zip]",        :with => "abcde"
			fill_in "user[email]",      :with => "test@test.com"
			choose("The Whole Enchilada")
			click_on "Sign Up"

			expect(page).to have_text("must contain digits only")
		end

		it "error on email missing dot whatever" do
			visit signup_url

			fill_in "user[first_name]", :with => "First"
			fill_in "user[last_name]",  :with => "Last"
			fill_in "user[zip]",        :with => "abcde"
			fill_in "user[email]",      :with => "test@test"
			choose("The Whole Enchilada")
			click_on "Sign Up"

			expect(page).to have_text("must conform to *@*.* format")
		end
	end

	context "successfully" do
		it "shows the success page" do
			visit root_url
			click_on "Sign Me Up!"

			expect(current_path).to eql(signup_path)

			fill_in "user[first_name]", :with => "First"
			fill_in "user[last_name]",  :with => "Last"
			fill_in "user[zip]",        :with => "12345"
			fill_in "user[email]",      :with => "test@test.com"
			choose("The Whole Enchilada")
			click_on "Sign Up"

			expect(current_path).to eql(success_path)
			expect(page).to have_text("You're in!")
		end
	end
	
end