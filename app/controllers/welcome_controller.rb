class WelcomeController < ApplicationController
  def index
    @request = Request.new
    @houses = House.all
    @notices = Notice.all
  end
end
