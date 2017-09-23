class HomeController < ApplicationController

  def index
    @weekly_users = User.where_not_admin.where(created_at: Time.now.weeks_ago(1)..Time.now)
  end
end
