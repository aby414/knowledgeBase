class ArticlesController < ApplicationController

  #get all articles
  def index
    @articles = Article.all
  end

  #create new article
  def new
    @article = Article.new
  end

  #get on e article by id
  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if (@article.update(article_params))
      redirect_to @article
    else
      render 'new'
    end
  end

  #delete an article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def create
    @article = Article.new(article_params)
    @article.body = translate_to_ger(params[:article][:body])
    if (@article.save)
      redirect_to @article
    else
      render 'edit'
    end

  end

  private def article_params
    params.require(:article).permit(:title, :body)
  end

  #translate text to german
  # source: https://github.com/MicrosoftTranslator/Text-Translation-API-V3-Ruby/blob/master/Translate.rb
  private def translate_to_ger(text)
    subscription_key = $ms_secret_key
    endpoint = 'https://api.cognitive.microsofttranslator.com/translate?api-version=3.0'

    #translate to German
    params = '&to=de'

    uri = URI (endpoint + params)

    content = '[{"Text" : "' + text + '"}]'

    request = Net::HTTP::Post.new(uri)
    request['Content-Type'] = 'application/json'
    request['Content-length'] = content.length
    request['Ocp-Apim-Subscription-Key'] = subscription_key
    request['X-ClientTraceId'] = SecureRandom.uuid
    request.body = content

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request (request)
    end

    result = response.body.force_encoding("utf-8")

    json_result = JSON.parse(result)
    trans_res = json_result[0]['translations'][0]['text']
    return trans_res
  end
end
