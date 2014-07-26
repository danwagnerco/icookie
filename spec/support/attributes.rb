def user_attributes(overrides = {})
  {
    :first_name    => "Dan",
    :last_name     => "Wagner",
    :email         => "danwagnerco@gmail.com",
    :zip           => "60642",
    :report_detail => "full"
  }.merge(overrides)
end
