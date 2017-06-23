class User < ActiveRecord::Base

  has_many :articles, dependent: :destroy #delete also related articles with the user
  before_save { self.email = email.downcase } #thiss saves email to downcase even if it is entered in uppercase letter
  validates :username, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 3, maximum: 25}

  VALID_EMAIL_REGEX = /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: {case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end