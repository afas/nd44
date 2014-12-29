class Notice < ActiveRecord::Base

  default_scope { order('id DESC') }


  def self.set_descriptions
    Notice.find_each do |notice|
      notice.description = notice.body
      notice.save
    end
  end

end
