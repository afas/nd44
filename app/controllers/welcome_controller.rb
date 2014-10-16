class WelcomeController < ApplicationController
  def index
    @request = Request.new
    @houses = House.all
    @notices = Notice.all.limit 4
  end
end
