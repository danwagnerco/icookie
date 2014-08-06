class User < ActiveRecord::Base
  REPORT_OPTIONS = %w(full temps-only)

  validates :first_name, :last_name, :presence => true
  validates :email, :format => {
      :with    => /\A(\S+)@(.+)\.(\S+)\z/i,
      :message => "email address must conform to *@*.* format"
    }
  validates :zip, :length => {
      :is      => 5,
      :with    => /\d{5}/,
      :message => "zip code must be exactly 5 digits long"
    }
  validates :report_detail, :inclusion => {:in => REPORT_OPTIONS}
  
  belongs_to :location

  def self.unique_zip_codes
    self.uniq.pluck(:zip)
  end

end
