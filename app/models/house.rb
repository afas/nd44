class House < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  default_scope { order('address') }

end
