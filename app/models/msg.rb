class Msg < ApplicationRecord
  attr_accessor :phone
  belongs_to :contact
  validates :body, presence: true
  before_create :send_msg

private
  def send_msg
    begin
      response = RestClient::Request.new(
        :method => :post,
        :url => "#{ENV['TWILIO_URL']}#{ENV['TWILIO_SID']}/Messages.json",
        :user => ENV['TWILIO_SID'],
        :password => ENV['TWILIO_TOKEN'],
        :payload => { :Body => body,
                      :To => "+#{phone}",
                      :From => "+#{ENV['TWILIO_FROM']}" }
      ).execute
      binding.pry
    rescue
      throw(:abort)
    end
  end

  def msg_params
    params.require(:msg).permit(:body)
  end
end
