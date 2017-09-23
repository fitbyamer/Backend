class MembersController < ApplicationController

  def show
    @user = User.where_not_admin.find params[:id]
  end

  def index
    @users = User.where_not_admin.order(:username).paginate page: params[:page]
  end

  def search
    users = User.where_not_admin.where('LOWER(username) LIKE :term', term: "%#{params[:term].downcase}%")
    render json: users.map { |user|  {label: user.username, value: user.username, id: user.id}}
  end
end
