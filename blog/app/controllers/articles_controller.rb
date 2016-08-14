class ArticlesController < ApplicationController
  #autentificador de devise
before_action :authenticate_user!, except:[:show,:idex]

#nos permite ahorrar lines de codigo que se repiten
# @article = Article.find(params[:id])
before_action :set_article, except:[:index,:new,:create]
#Get/article
  def index
     @articles =Article.all
    end
    #Get /articles/:id
  def show
    @article.update_visits_count
    @comment = Comment.new
    #where
  #  Article.where.not("id = ?",params[:id])
  end
  #Get /articles/new
  def new
    @article=Article.new
  end
  #Pots/article
  def create
    #current_user tiene la informacion del usuario
    @article= current_user.articles.new(article_params)
        if@article.save
        redirect_to @article
      else
        render :new
      end
  end

  def destroy

    @article.destroy
    redirect_to articles_path
  end
  #
  def edit

  end
  #put/article/:id
  def update
    @article = Article.find(params[:id])
    if @article.update (article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
  # si el usuario no ha iniciado sesion y intenta crear un blog lo redirige a el login
  def validate_user
    redirect_to new_user_session_path, notice:"Nesecitas iniciar sesion"
  end
  def article_params
    params.require(:article).permit(:title,:body)

  end

end
