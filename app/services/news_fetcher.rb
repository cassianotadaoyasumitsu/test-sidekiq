require 'news-api'

class NewsFetcher
  def initialize
    @newsapi = News.new(ENV['NEWS_API_KEY'])  # Correct API key
  end

  # Fetch top headlines
  def fetch_top_headlines
    @newsapi.get_top_headlines(country: 'us', language: 'en')
  end

  # Fetch everything (used for more specific searches)
  def fetch_everything(query, from_date, to_date)
    @newsapi.get_everything(q: query, from: from_date, to: to_date, sortBy: 'popularity', language: 'en')
  end

  # Fetch sources (useful if you want to check available sources)
  def fetch_sources
    @newsapi.get_sources(country: 'us', language: 'en')
  end

  # Fetch news from yesterday (specific method you need)
  def self.fetch_yesterday_news
    yesterday = Date.yesterday.strftime('%Y-%m-%d')
    news_fetcher = new  # Create an instance of NewsFetcher to use instance methods
    news_fetcher.fetch_everything("bitcoin", yesterday, yesterday)
  end
end
