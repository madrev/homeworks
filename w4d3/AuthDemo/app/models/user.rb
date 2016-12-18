class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank"}
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(username, password)
    result = User.find_by(username: username)
    if BCrypt::Password.new(result.password_digest).is_password?(password)
      return result
    end
    nil
  end

  def password=(string)
    @password = string
    self.password_digest = BCrypt::Password.create(string)
  end


  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
  end
end
