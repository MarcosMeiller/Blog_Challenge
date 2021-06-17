class AuthController < ApplicationController
  def sign_up
    @user = User.new(password: params[:password], email: params[:email])
        if @user.save
            render json: {status: 200, msg: 'El usuario ha sido creado'}
        else
            render json: { msg: 'no se pudo crear'}
        end
  end

  def login
    @user = User.find_by(email: params[:email])
    if !@user
      render status: :unauthorized
    else
      if @user.authenticate(params[:password]) && @user.status
           secret_key = Rails.application.secrets.secret_key_base[0]
           token = JWT.encode({user_id: @user.id}, secret_key)
           render json: {user: @user, token: token}
      else
           render status: :unauthorized
      end
    end
  end
    
  private
    def user_params
        params.require(:user).permit(:username,:password)
    end
end
