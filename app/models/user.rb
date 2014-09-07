class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :twitches
  has_many :followers

  after_create :send_welcome_email

  def twitch_search
    results = []
    Twitch.all.each do |twitch|
      if twitch.content.include? self.email
        results << twitch
      end
    end
    results
  end

  def mentions
    mentions = []
    twitch_search.each do |twitch|
      mentions << [User.find(twitch_search.first.user_id), twitch]
    end
    mentions
  end

  private

  def send_welcome_email
    UserMailer.signup_confirmation(self).deliver
  end

end



