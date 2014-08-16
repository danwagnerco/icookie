class User < ActiveRecord::Base
  belongs_to :location
  has_secure_password

  REPORT_OPTIONS = %w(full partial)

  validates :first_name, :last_name, :presence => true
  validates :email, :format => {
      :with    => /\A(\S+)@(.+)\.(\S+)\z/i,
      :message => "email address must conform to *@*.* format"
    },
    :uniqueness => { :case_sensitive => false }
  validates :zip, :length => {
      :is      => 5,
      :message => "zip code must be exactly 5 digits long"
    },
    :format => {
      :with    => /\d{5}/i,
      :message => "zip code must contain digits only" 
    }
  validates :report_detail, :inclusion => {:in => REPORT_OPTIONS}

  def self.unique_zip_codes
    self.uniq.pluck(:zip)
  end

end
