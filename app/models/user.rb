class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :twitches

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


# User.all.each do |user|
#       user.twitches.each do |twitch|
#         if twitch.basic_search(self.email)
#           results[user.id] = twitch
#         end
#       end
#     end

# if my_string.include? "cde"
