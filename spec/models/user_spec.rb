require_relative("../spec_helper")

describe "User" do

  context "validation check" do
    it "requires a first name" do
      u = User.new(:first_name            => "",
                   :last_name             => "Wagner",
                   :email                 => "dan@example.com",
                   :zip                   => "12345",
                   :report_detail         => "full",
                   :password              => "secret",
                   :password_confirmation => "secret"
                  )
      expect(u.valid?).to be_false
    end

    it "requires a last name" do
      u = User.new(:first_name            => "Dan",
                   :last_name             => "",
                   :email                 => "dan@example.com",
                   :zip                   => "12345",
                   :report_detail         => "full",
                   :password              => "secret",
                   :password_confirmation => "secret"
                  )
      expect(u.valid?).to be_false
    end

    it "requires an email" do
      u = User.new(:first_name            => "Dan",
                   :last_name             => "Wagner",
                   :email                 => "",
                   :zip                   => "12345",
                   :report_detail         => "full",
                   :password              => "secret",
                   :password_confirmation => "secret"
                  )
      expect(u.valid?).to be_false
    end

    it "requires a valid email" do
      u = User.new(:first_name            => "Dan",
                   :last_name             => "Wagner",
                   :email                 => "dan@example",
                   :zip                   => "12345",
                   :report_detail         => "full",
                   :password              => "secret",
                   :password_confirmation => "secret"
                  )
      expect(u.valid?).to be_false
    end

    it "requires a zip code" do
      u = User.new(:first_name            => "Dan",
                   :last_name             => "Wagner",
                   :email                 => "dan@example.com",
                   :zip                   => "",
                   :report_detail         => "full",
                   :password              => "secret",
                   :password_confirmation => "secret"
                  )
      expect(u.valid?).to be_false
    end

    it "requires a 5-digit zip code" do
      u = User.new(:first_name            => "Dan",
                   :last_name             => "Wagner",
                   :email                 => "dan@example",
                   :zip                   => "333",
                   :report_detail         => "full",
                   :password              => "secret",
                   :password_confirmation => "secret"
                  )
      expect(u.valid?).to be_false
    end

    it "requires only digits in zip code" do
      u = User.new(:first_name            => "Dan",
                   :last_name             => "Wagner",
                   :email                 => "dan@example",
                   :zip                   => "abcde",
                   :report_detail         => "full",
                   :password              => "secret",
                   :password_confirmation => "secret"
                  )
      expect(u.valid?).to be_false
    end

    it "requires a password" do
      u = User.new(:first_name            => "Dan",
                   :last_name             => "Wagner",
                   :email                 => "dan@example",
                   :zip                   => "12345",
                   :report_detail         => "full",
                   :password              => "",
                   :password_confirmation => ""
                  )
      expect(u.valid?).to be_false
    end

    it "requires password and confirmation match" do
      u = User.new(:first_name            => "Dan",
                   :last_name             => "Wagner",
                   :email                 => "dan@example",
                   :zip                   => "12345",
                   :report_detail         => "full",
                   :password              => "secret",
                   :password_confirmation => "not secret"
                  )
      expect(u.valid?).to be_false
    end

    it "requires a report detail" do
      u = User.new(:first_name            => "Dan",
                   :last_name             => "Wagner",
                   :email                 => "dan@example",
                   :zip                   => "12345",
                   :report_detail         => "",
                   :password              => "secret",
                   :password_confirmation => "secret"
                  )
      expect(u.valid?).to be_false
    end

    it "requires report detail to be full or partial" do
      u = User.new(:first_name            => "Dan",
                   :last_name             => "Wagner",
                   :email                 => "dan@example",
                   :zip                   => "12345",
                   :report_detail         => "other",
                   :password              => "secret",
                   :password_confirmation => "secret"
                  )
      expect(u.valid?).to be_false
    end
  end

  context "successful validations" do
    it "creates a user with the user_attributes" do
      u = User.new(user_attributes)
      expect(u.valid?).to be_true
    end
  end

end
