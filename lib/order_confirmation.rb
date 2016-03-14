require 'dotenv'
Dotenv.load
require 'rubygems'
require 'twilio-ruby'

class OrderConfirmation

  def send_sms(message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    client = Twilio::REST::Client.new account_sid, auth_token

    from = ENV['TWILIO_NUMBER']
    to = ENV['MY_NUMBER']
    body = message

    client.account.messages.create(
      to: to,
      from: from,
      body: body
    )
  end
end
