class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id #cria uma variável de sessão chamado user_id que guarda o id do usuário
      flash[:success] = "You have successfully logged in."
      redirect_to user_path(user) #é user_path, se for users_path vai para a index do user controller (mostra todos os usuários)
    else
      flash.now[:danger] = "There was something wrong with your login information."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out."
    redirect_to root_path
  end

end