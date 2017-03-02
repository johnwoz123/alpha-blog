class ArticlesController < ApplicationController

def new
  @article = Article.new

end

# This does NOT need a template
def create
  # render plain: params[:article].inspect -- this is what is being passed in the params hash
  # create a new article from what is coming in from the params hash - must white list first


  @article = Article.new(article_params)
  @article.save

  # what to do after save? needs to redirect to show
  redirect_to articles_show(@article)
end

private
def article_params
  # top level key is article
  params.require(:article).permit(:title, :description)
end


end
