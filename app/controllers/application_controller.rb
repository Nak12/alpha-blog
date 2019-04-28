class ApplicationController < ActionController::Base
  #prevent CSRF attacks by raising an exception
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in? #assim esses métodos ficarão disponíveis nas views! Por padrão os métodos do ApplicationController são ficam disponíveis para os Controllers e não para suas Views.

  def current_user
    #busca e retorna o usuário do BD através da variável de sessão 'user_id' se existir essa variável de sessão
    #retorna @current_user se já existe e não executa o comando depois ?; isso evita acessos desnecessário ao BD
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user #transforma num boolean, true se existir, false caso contrário
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action."
      redirect_to root_path
    end
  end
  
end
