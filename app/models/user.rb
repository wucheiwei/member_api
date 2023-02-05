class User < ApplicationRecord
    validates :username, presence: true, length:{in:3..32}
    validates :password, presence: true, length:{in:8..32},format: { with: /\A(?=.*[A-Z])(?=.*[a-z])(?=.*\d)/,message: "須至少包含一個大寫字母、小寫字母及一個數字" }
  
    before_create :encrypt_password
  
    private
      def encrypt_password
        self.password = Digest::SHA1.hexdigest(self.password)
      end
end
