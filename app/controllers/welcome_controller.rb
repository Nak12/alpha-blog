class WelcomeController < ApplicationController
  def home
    redirect_to articles_path if logged_in? #se já estiver logado vai para pagina dos artigos, não entra no root_path
  
  end 

  def about
  end
end
