class Notice < ActiveRecord::Base

  default_scope { order('id DESC') }

end
