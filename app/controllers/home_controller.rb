class HomeController < ApplicationController

  def welecome
  end

  def main_page
    if current_user.user_type == 'student'
      @courses = current_user.courses
    end
  end
end
