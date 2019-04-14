require 'open-uri'

class HomeController < ApplicationController
  def index
    @contact = Contact.new
  end

  def search_contacts
    contacts = Contact.where('name LIKE :text OR phone_number LIKE :text', text: "%#{params[:text]}%")
    render json: contacts
  end

  def add_contact
    contact = Contact.create(name: params[:contact][:name], phone_number: params[:contact][:phone_number])
    if contact.save!
      render json: 'Added contact successfully.'
    else
      render json: 'Failed to add contact.'
    end
  end

  def google_sports
    google_news_url = "https://news.google.com"

    news = Nokogiri::HTML(open(google_news_url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    relative_sports_url = news.at('a:contains("Sports")').attributes["href"]
    sports_url = google_news_url + relative_sports_url
    sports = Nokogiri::HTML(open(sports_url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

    @res = []
    sports.css('.DY5T1d').each do |headline|
      @res << {headline.text() => headline.attributes.first[1].value.gsub('.', google_news_url)}
    end
  end
end
