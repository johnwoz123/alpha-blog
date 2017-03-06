class ArticlesController < ApplicationController
  # before everything else only these four methods call set_article
  before_action :set_article, only: [:edit, :update, :show, :destroy]

def index
  @articles = Article.all

end


def new
  @article = Article.new

end

# This does NOT need a template
def create
  # render plain: params[:article].inspect -- this is what is being passed in the params hash
  # create a new article from what is coming in from the params hash - must white list first

  @article = Article.new(article_params)
  @article.user = User.first
  if @article.save
    flash[:success] = "Article was successfully created"
    # what to do after save? needs to redirect to show
    redirect_to article_path(@article)
  else
    render 'new'
  end
end

def show
  # show the article just created by id
end

def destroy
  @article.destroy
  flash[:danger]  = "Article was successfully deleted"
  redirect_to articles_path
end

def edit
  # When adding article you need to find article by id
# this is handled by the update function
end

def update
  if @article.update(article_params)
    flash[:success] = "Article was successfully updated"
    redirect_to article_path(@article)
  else
    render 'edit'
  end

end



private

def set_article

  @article = Article.find(params[:id])

end


def article_params
  # top level key is article
  params.require(:article).permit(:title, :description)
end


end
