class ArticlesController < ApplicationController
def index
  @articles = Article.paginate(page: params[:page],per_page: 3)
end
def new
  @article = Article.new
  @user = User.new
end
def edit
  @article = Article.find(params[:id])
end

def create
  #render plain: params[:article].inspect
  debugger
  @article = Article.new(article_params)
  @article.user = User.first
#  @article.save
#  redirect_to article_path(@article)
if @article.save
  flash[:success] = "Article was successfully created"
  redirect_to article_path(@article)
else
  render 'new'
end
end


def update
  @article = Article.find(params[:id])
  if @article.update(article_params)
    flash[:success] = "Article was successfully updated"
    redirect_to article_path(@article)

  else
    render 'edit'
  end

end

def show
  @article = Article.find(params[:id])
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  flash[:danger] ="Article was successfully deleted "
  redirect_to articles_path

end


private
  def article_params
    params.require(:article).permit(:title, :description)

  end
end
