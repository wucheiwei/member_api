class User < ApplicationRecord
    validates :username, presence: true, length:{3..32}
    validates :password, presence: true, length:{8..32},format: {with: /\A(?=.*[A-Z])(?=.*[a-z]).+\z/}
  
    before_create :encrypt_password
  
    private
      def encrypt_password
        self.password = Digest::SHA1.hexdigest(self.password)
      end
end
