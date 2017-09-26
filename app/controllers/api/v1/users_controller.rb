class Api::V1::UsersController < ApiApplicationController

  skip_before_action :validate_user!, only: [:create]

  def create
    
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :phone_number, :age, :gender, :height, :width, :aim, :image)
  end
end
