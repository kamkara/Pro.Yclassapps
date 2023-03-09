class HomepageController < ApplicationController
  def index
    @feed_courses = Course.all
    @feed_materials = Material.all
  end
end
