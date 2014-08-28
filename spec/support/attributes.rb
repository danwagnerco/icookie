def user_attributes(overrides = {})
  {
    :first_name            => "Dan",
    :last_name             => "Wagner",
    :email                 => "danwagnerco@gmail.com",
    :password              => "secret",
    :password_confirmation => "secret",
    :zip                   => "60642",
    :report_detail         => "full"
  }.merge(overrides)
end
