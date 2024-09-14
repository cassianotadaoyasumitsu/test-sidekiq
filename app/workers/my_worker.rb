class MyWorker
  include Sidekiq::Worker

  def perform
    # Fetch all news articles from yesterday
    news_articles = NewsFetcher.fetch_yesterday_news

    if news_articles.any?
      news_articles.each do |article|
        Post.create!(
          title: article.title,
          content: article.content,
          published_at: Time.now,
          url: article.url,
          url_to_image: article.urlToImage
        )
        Rails.logger.info "Post created successfully for article: #{article.title}"
      end
    else
      Rails.logger.info "No news articles available for yesterday."
    end
  end
end
