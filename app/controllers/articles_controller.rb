class ArticlesController < ApplicationController

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
  @article.save


  if @article.save
    flash[:notice] = "Article was successfully created"
    # what to do after save? needs to redirect to show
    redirect_to article_path(@article)
  else
    render 'new'
  end
end

def show
  # show the article just created by id
  @article = Article.find(params[:id])

end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  flash[:notice]  = "Article was successfully deleted"
  redirect_to articles_path
end

def edit
  # When adding article you need to find article by id
@article = Article.find(params[:id])

# this is handled by the update function
end

def update
  @article = Article.find(params[:id])
  if @article.update(article_params)
    flash[:notice] = "Article was successfully updated"
    redirect_to article_path(@article)
  else
    render 'edit'
  end

end



private
def article_params
  # top level key is article
  params.require(:article).permit(:title, :description)
end


end
