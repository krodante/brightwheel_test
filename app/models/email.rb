require "html_to_plain_text"
require "httparty"

# converts body to plain text and sends emails
class Email
  include HTTParty
  format :json

  def initialize
    @mailgun_uri = "https://api:#{ENV['MAILGUN_API_KEY']}@api.mailgun.net/v3/kathyrodante.com"
    @mandrill_uri = "https://mandrillapp.com/api/1.0"
  end

  def self.convert_body(body)
    HtmlToPlainText.plain_text(body)
  end

  def send_email(payload)
    if ENV["MAILER"].downcase == "mailgun"
      HTTParty.post(@mailgun_uri + "/messages", body: payload)
    elsif ENV["MAILER"].downcase == "mandrill"
      HTTParty.post(@mandrill_uri + "/messages/send.json", body: mandrill_body(payload))
    end
  end

  def mandrill_body(payload)
    {
      key: ENV["MANDRILL_API_KEY"],
      message: {
        text: payload[:text],
        subject: payload[:subject],
        from_email: payload[:from],
        from_name: payload[:from_name],
        to: [
          {
            email: payload[:to],
            name: payload[:to_name],
            type: "to"
          }
        ]
      }
    }
  end
end
