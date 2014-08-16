Location.create!(
  [
    {
      :zip       => "60012",
      :state     => "IL",
      :city      => "Crystal Lake",
      :county    => "McHenry",
      :latitude  => 42.27,
      :longitude => -88.32
    },
    {
      :zip       => "60622",
      :state     => "IL",
      :city      => "Chicago",
      :county    => "Cook",
      :latitude  => 41.9,
      :longitude => -87.68
    },
    {
      :zip       => "60642",
      :state     => "IL",
      :city      => "Chicago",
      :county    => "Cook",
      :latitude  => 41.9,
      :longitude => -87.66
    },
    {
      :zip       => "60439",
      :state     => "IL",
      :city      => "Lemont",
      :county    => "Cook",
      :latitude  => 41.68,
      :longitude => -87.98
    }
  ]
)

crystal_lake = Location.find_by(:zip => "60012")
chicago_wp   = Location.find_by(:zip => "60622")
chicago_wt   = Location.find_by(:zip => "60642")
lemont       = Location.find_by(:zip => "60439")

crystal_lake.users.create!(
  [
    {
      :first_name            => "Jess",
      :last_name             => "Caudillo",
      :email                 => "jess.caudillo@gmail.com",
      :password              => "secret",
      :password_confirmation => "secret",
      :zip                   => "60012",
      :report_detail         => "full"
    }    
  ]
)

chicago_wp.users.create!(
  [
    {
      :first_name            => "Tom",
      :last_name             => "Riordan",
      :email                 => "thomasjriordan@gmail.com",
      :password              => "secret",
      :password_confirmation => "secret",
      :zip                   => "60622",
      :report_detail         => "full"
    }
  ]
)

chicago_wt.users.create!(
  [
    {
      :first_name            => "Kelly",
      :last_name             => "Turner",
      :email                 => "kelculator87@gmail.com",
      :password              => "secret",
      :password_confirmation => "secret",
      :zip                   => "60642",
      :report_detail         => "full"
    },
    {
      :first_name            => "Dan",
      :last_name             => "Wagner",
      :email                 => "danwagnerco@gmail.com",
      :password              => "secret",
      :password_confirmation => "secret",
      :zip                   => "60642",
      :report_detail         => "full"
    }
  ]
)

lemont.users.create!(
  [
    {
      :first_name            => "Terese",
      :last_name             => "Turner",
      :email                 => "terese@scott-turner.com",
      :password              => "secret",
      :password_confirmation => "secret",
      :zip                   => "60439",
      :report_detail           => "full"
    },
    {
      :first_name            => "Scott",
      :last_name             => "Turner",
      :password              => "secret",
      :password_confirmation => "secret",
      :email                 => "saluki83@yahoo.com",
      :zip                   => "60439",
      :report_detail         => "full"
    },
    {
      :first_name            => "Emily",
      :last_name             => "Turner",
      :password              => "secret",
      :password_confirmation => "secret",
      :email                 => "emily.terese@gmail.com",
      :zip                   => "60439",
      :report_detail         => "full"
    }
  ]
)

